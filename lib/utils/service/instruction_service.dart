import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/instruction_model.dart';

class InstructionService {
  Future<List<SafetyInstruction>> fetchInstructions() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy/safety_instruction.json');
      final data = json.decode(response);

      if (data['행동요령'] == null) {
        print('Warning: 행동요령 key is null or missing');
        return [];
      }

      final instructionsList = data['행동요령'] as List;

      // Filter out entries with null actRmks
      List<SafetyInstruction> instructions = instructionsList
          .where((instruction) => instruction['actRmks'] != null)
          .map((instruction) => SafetyInstruction.fromJson(instruction))
          .toList();

      return instructions;
    } catch (e, stackTrace) {
      print('Error in fetchInstructions: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
  }
}
