import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/shelter_model.dart';

class ShelterService {
  Future<List<ShelterModel>> fetchShelters() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy/shelter.json');
      final data = json.decode(response);

      if (data['items'] == null) {
        print('Warning: items key is null or missing');
        return [];
      }

      final sheltersList = data['items'] as List;
      List<ShelterModel> shelters = sheltersList
          .map((shelter) => ShelterModel.fromJson(shelter))
          .toList();

      return shelters;
    } catch (e, stackTrace) {
      print('Error in fetchShelters: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
  }
}
