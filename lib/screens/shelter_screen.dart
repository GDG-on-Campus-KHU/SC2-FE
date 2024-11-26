import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sheet/sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/model/shelter_model.dart';
import '../utils/theme/color_manager.dart';
import '../utils/theme/text_manager.dart';
import '../utils/location.dart';

class ShelterScreen extends StatefulWidget {
  const ShelterScreen({super.key});

  @override
  State<ShelterScreen> createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  final List<Shelter> _dummyShelters = [
    Shelter(
      name: 'Central Community Center',
      address: '123 Main St, Seoul',
    ),
    Shelter(
      name: 'Metro Station Bunker',
      address: '45 Station Road, Seoul',
    ),
    Shelter(
      name: 'Public Library Basement',
      address: '67 Book Avenue, Seoul',
    ),
  ];

  final SheetController sheetController = SheetController();

  GoogleMapController? mapController;

  CameraPosition? _initialPosition;

  double _sheetPosition = 0.5;

  @override
  void initState() {
    super.initState();
    sheetController.addListener(_onSheetChanged);
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
    // Calculate FAB position based on sheet position
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
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: ColorManager.card,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // const SizedBox(height: 12),
            Text(
              'Nearest Shelters',
              style: TextManager.main23,
            ),
            const SizedBox(height: 28),
            Expanded(
              child: ListView.builder(
                itemCount: _dummyShelters.length,
                itemBuilder: (context, index) {
                  final shelter = _dummyShelters[index];
                  return shelterCard(
                    name: shelter.name,
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
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextManager.main19),
              Text(address, style: TextManager.sub17),
            ],
          ),
        ],
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
}
