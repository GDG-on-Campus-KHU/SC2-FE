import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../utils/theme/color_manager.dart';
import '../utils/theme/text_manager.dart';
import '../utils/service/instruction_service.dart';
import '../utils/model/instruction_model.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  final List<bool> _visibleItems = [];
  // final disasterType = "Earthquake";
  List<SafetyInstruction> instructions = [];

  @override
  void initState() {
    super.initState();
    _fetchAndAnimateInstructions();
  }

  Future<void> _fetchAndAnimateInstructions() async {
    final service = InstructionService();
    instructions = await service.fetchInstructions();
    _visibleItems.addAll(List.generate(instructions.length, (_) => false));
    _animateItems();
  }

  void _animateItems() async {
    for (int i = 0; i < _visibleItems.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        setState(() {
          _visibleItems[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Example data

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Symbols.sentiment_sad,
              color: ColorManager.mainText,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Disaster Instructions',
              style: TextManager.main19,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${instructions[0].safetyCateNm2} 발생 시 행동요령',
              style: TextManager.main23,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Expanded(
              child: ListView.builder(
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  return instructionCard(instructions, index);
                },
              ),
            ),
            Divider(
              color: ColorManager.card,
              height: 1,
            ),
            const SizedBox(height: 16),
            _buildShelterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildShelterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          context.go('/shelter');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          '가까운 대피소를 앱에서 확인하세요',
          style: TextManager.invert19,
        ),
      ),
    );
  }

  Widget instructionCard(List<SafetyInstruction> instructions, int index) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _visibleItems[index] ? 1.0 : 0.0,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        color: ColorManager.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: ColorManager.card,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                instructions[index].safetyCateNm3,
                style: TextManager.main19,
              ),
              const SizedBox(height: 8),
              Text(
                instructions[index].actRmks ?? '',
                style: TextManager.sub17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
