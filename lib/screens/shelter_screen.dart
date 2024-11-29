import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sheet/sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show min, max;

import '../utils/model/shelter_model.dart';
import '../utils/theme/color_manager.dart';
import '../utils/theme/text_manager.dart';
import '../utils/location.dart';
import '../utils/service/shelter_service.dart';

class ShelterScreen extends StatefulWidget {
  const ShelterScreen({super.key});

  @override
  State<ShelterScreen> createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  final ShelterService _shelterService = ShelterService();
  List<Shelter> _shelters = [];

  final SheetController sheetController = SheetController();

  GoogleMapController? mapController;

  CameraPosition? _initialPosition;

  double _sheetPosition = 0.5;

  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    sheetController.addListener(_onSheetChanged);
    _loadShelters();
    Future<void>.delayed(const Duration(milliseconds: 300), () {
      animateSheet();
      _goToCurrentLocation();
    });
  }

  void _onSheetChanged() {
    setState(() {
      _sheetPosition = sheetController.animation.value;
    });
  }

  void animateSheet() {
    sheetController.relativeAnimateTo(
      0.5,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    sheetController.removeListener(_onSheetChanged);
    sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bodyHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight);
    final sheetHeight = bodyHeight * _sheetPosition;
    final fixedBottom = bodyHeight * 0.5 + 16.0;
    final fabBottom = sheetHeight + 16.0;

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.mainText,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.map,
              color: ColorManager.mainText,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Shelters',
              style: TextManager.main19,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: Stack(children: [
        if (_initialPosition != null)
          GoogleMap(
            initialCameraPosition: _initialPosition!,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            myLocationEnabled: true,
            polylines: _polylines,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: false,
          ),
        _buildCurrentLocationButton(fabBottom, fixedBottom),
        _buildShelterSheet(),
      ]),
    );
  }

  Widget _buildCurrentLocationButton(double fabBottom, double fixedBottom) {
    return Positioned(
      right: 16,
      bottom: (_sheetPosition <= 0.5) ? fabBottom : fixedBottom,
      child: FloatingActionButton(
        backgroundColor: ColorManager.card,
        elevation: 2,
        onPressed: _goToCurrentLocation,
        child: Icon(
          Icons.my_location,
          color: ColorManager.mainText,
        ),
      ),
    );
  }

  Sheet _buildShelterSheet() {
    return Sheet(
      controller: sheetController,
      elevation: 4,
      backgroundColor: ColorManager.background,
      physics: const SnapSheetPhysics(
        stops: [0.12, 0.5, 1],
        parent: BouncingSheetPhysics(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 32,
                height: 4,
                margin: const EdgeInsets.only(top: 8, bottom: 16),
                decoration: BoxDecoration(
                  color: ColorManager.card,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              '인근 대피소',
              style: TextManager.main23,
            ),
            const SizedBox(height: 48),
            Expanded(
              child: ListView.builder(
                itemCount: _shelters.length,
                itemBuilder: (context, index) {
                  final shelter = _shelters[index];
                  return shelterCard(
                    name: shelter.title,
                    address: shelter.address,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shelterCard({
    required String name,
    required String address,
  }) {
    return GestureDetector(
      onTap: () => _fetchAndDrawRoute(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: ColorManager.card,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Symbols.home_rounded,
                color: ColorManager.mainText,
                size: 32,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextManager.main19,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    address,
                    style: TextManager.sub17,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    try {
      final position = await determineLocation();
      _initialPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );

      setState(() {}); // Trigger rebuild with new position

      await mapController?.animateCamera(
        CameraUpdate.newCameraPosition(_initialPosition!),
      );
    } catch (e) {
      // If location fails, fall back to Seoul coordinates
      _initialPosition = const CameraPosition(
        target: LatLng(37.5665, 126.9780), // Seoul coordinates
        zoom: 15,
      );
      setState(() {});
      debugPrint('Error getting location: $e');
    }
  }

  Future<void> _loadShelters() async {
    final shelters = await _shelterService.fetchShelters();
    setState(() {
      _shelters = shelters;
    });
  }

  Future<void> _fetchAndDrawRoute() async {
    try {
      // TODO: Replace with actual API call
      final response = {
        "start": [127.027618, 37.497968],
        "goal": [127.0646402, 37.2497394],
        "path": [
          [127.0583539, 37.248289],
          [127.0585089, 37.3481931],
          [127.058517, 37.248158]
        ]
      };

      // Create complete route including start, path, and goal
      final List<LatLng> polylineCoordinates = [
        // Add start point
        LatLng(
          (response['start'] as List)[1] as double,
          (response['start'] as List)[0] as double,
        ),
        // Add path points (stopovers)
        ...(response['path'] as List).map((point) => LatLng(
              point[1] as double,
              point[0] as double,
            )),
        // Add goal point
        LatLng(
          (response['goal'] as List)[1] as double,
          (response['goal'] as List)[0] as double,
        ),
      ];

      final Polyline polyline = Polyline(
        polylineId: const PolylineId('route'),
        color: ColorManager.button,
        points: polylineCoordinates,
        width: 4,
      );

      setState(() {
        _polylines.clear();
        _polylines.add(polyline);
      });

      // Animate camera to show the route
      final LatLngBounds bounds = _getBounds(polylineCoordinates);
      await mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 50),
      );
    } catch (e) {
      debugPrint('Error drawing route: $e');
    }
  }

  LatLngBounds _getBounds(List<LatLng> coordinates) {
    double? minLat, maxLat, minLng, maxLng;

    for (final coord in coordinates) {
      minLat = minLat == null ? coord.latitude : min(minLat, coord.latitude);
      maxLat = maxLat == null ? coord.latitude : max(maxLat, coord.latitude);
      minLng = minLng == null ? coord.longitude : min(minLng, coord.longitude);
      maxLng = maxLng == null ? coord.longitude : max(maxLng, coord.longitude);
    }

    return LatLngBounds(
      southwest: LatLng(minLat!, minLng!),
      northeast: LatLng(maxLat!, maxLng!),
    );
  }
}
