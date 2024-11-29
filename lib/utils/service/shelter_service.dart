import 'dart:convert';
import '../model/shelter_model.dart';
import 'package:http/http.dart' as http;

class ShelterService {
  Future<List<ShelterModel>> fetchShelters(String query) async {
    try {
      // maybe there's no need to encode the query. change in the future if needed, or hard code it.
      final encodedQuery = Uri.encodeComponent(query.trim());
      final uri = Uri.parse(
          'http://localhost:8080/api/map/search?query="$encodedQuery"');

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => ShelterModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch route: ${response.statusCode}');
        // print('Error: HTTP ${response.statusCode}');
        // return [];
      }
    } catch (e) {
      throw Exception('Error fetching route: $e');
      // print('Error in searchShelters: $e');
      // return [];
    }
  }
}
