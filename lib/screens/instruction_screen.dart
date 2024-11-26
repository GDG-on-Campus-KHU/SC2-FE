import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../utils/theme/color_manager.dart';
import '../utils/theme/text_manager.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  final List<bool> _visibleItems = [];
  final disasterType = "Earthquake";
  final instructions = [
    "Drop to the ground and take cover under a sturdy desk or table",
    "Stay away from glass, windows, outside doors and walls",
    "Stay inside until the shaking stops",
    "Be prepared for aftershocks",
    "If you're in bed, stay there and protect your head with a pillow",
    "If you're outdoors, stay in the open away from buildings",
    "If you're in a vehicle, stop in a safe place away from buildings"
  ];

  @override
  void initState() {
    super.initState();
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
            // Disaster Type Title
            Text(
              'What to do in a(n) $disasterType',
              style: TextManager.main23,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),

            // Instructions List
            Expanded(
              child: ListView.builder(
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  return instructionCard(instructions, index);
                },
              ),
            ),
            // const SizedBox(height: 28),
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
          'Show me shelter routes',
          style: TextManager.invert17,
        ),
      ),
    );
  }

  Widget instructionCard(List<String> instructions, int index) {
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
          child: Text(
            instructions[index],
            style: TextManager.sub17,
          ),
        ),
      ),
    );
  }
}
