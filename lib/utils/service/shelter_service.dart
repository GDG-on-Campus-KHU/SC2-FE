import 'dart:convert';
import '../model/shelter_model.dart';
import 'package:http/http.dart' as http;

class ShelterService {
  Future<List<ShelterModel>> fetchShelters(String query) async {
    try {
      final encodedQuery = Uri.encodeComponent(query.trim());
      final uri =
          Uri.parse('http://localhost:8080/api/map/search?query=$encodedQuery');

      // print('Fetching shelters from: $uri');

      final response = await http.get(uri);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = json.decode(response.body);
        final List<dynamic> sheltersList = jsonMap['items'] ?? [];
        return sheltersList.map((json) => ShelterModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch shelters: ${response.statusCode}');
      }
    } catch (e) {
      // print('Error in fetchShelters: $e');
      throw Exception('Error fetching shelters: $e');
    }
  }
}
