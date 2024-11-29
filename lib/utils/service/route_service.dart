import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/route_model.dart';

class RouteService {
  static const String _baseUrl = 'http://localhost:8080/api';

  Future<RouteModel> getRoute({
    required LatLng start,
    required String destinationName,
  }) async {
    try {
      final startCoord = '${start.longitude},${start.latitude}';
      final encodedGoal = Uri.encodeComponent(destinationName);

      final url =
          '$_baseUrl/map/navigation?start=$startCoord&location=$encodedGoal';

      // print('Requesting route from URL: $url');

      final response = await http.get(Uri.parse(url));

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to fetch route: ${response.statusCode} - ${response.body}');
      }

      final decodedResponse = jsonDecode(response.body);
      // print('Decoded response: $decodedResponse');

      return RouteModel.fromJson(decodedResponse);
    } catch (e) {
      // print('Error in getRoute: $e');
      throw Exception('Error fetching route: $e');
    }
  }
}
