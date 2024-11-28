import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/instruction_model.dart';

class InstructionService {
  Future<List<SafetyInstruction>> fetchInstructions() async {
    try {
      // print('Fetching instructions...');
      final String response =
          await rootBundle.loadString('assets/dummy/safety_instruction.json');
      // print('Response loaded: ${response.substring(0, 100)}...');

      final data = json.decode(response);
      // print('Decoded data: $data');

      if (data['행동요령'] == null) {
        print('Warning: 행동요령 key is null or missing');
        return [];
      }

      final instructionsList = data['행동요령'] as List;
      // print('Instructions list length: ${instructionsList.length}');

      List<SafetyInstruction> instructions = instructionsList
          .where((instruction) => instruction['actRmks'] != null)
          .map((instruction) => SafetyInstruction.fromJson(instruction))
          .toList();

      // print('Filtered instructions length: ${instructions.length}');
      return instructions;
    } catch (e, stackTrace) {
      print('Error in fetchInstructions: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
  }
}
