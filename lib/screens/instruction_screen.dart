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
  Future<List<InstructionModel>>? _instructionsFuture;
  bool _animationInitialized = false;

  @override
  void initState() {
    super.initState();
    _instructionsFuture = InstructionService().fetchInstructions();
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _animationInitialized = false;
      _instructionsFuture = InstructionService().fetchInstructions();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(width: 4),
            Text(
              'Disaster Instructions',
              style: TextManager.main19,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: RefreshIndicator(
        color: ColorManager.button,
        backgroundColor: ColorManager.background,
        onRefresh: _handleRefresh,
        child: FutureBuilder<List<InstructionModel>>(
          future: _instructionsFuture,
          builder: (context, AsyncSnapshot<List<InstructionModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error loading instructions: ${snapshot.error}'),
              );
            }

            final instructions = snapshot.data;
            if (instructions == null || instructions.isEmpty) {
              return const Center(
                child: Text('No instructions available'),
              );
            }

            if (!_animationInitialized) {
              _visibleItems.clear();
              _visibleItems
                  .addAll(List.generate(instructions.length, (_) => false));
              _animationInitialized = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _animateItems();
              });
            }

            return Stack(children: [
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: instructions.length,
                        itemBuilder: (context, index) {
                          return instructionCard(instructions, index);
                        },
                      ),
                      // Divider(
                      //   color: ColorManager.card,
                      //   height: 1,
                      // ),
                      const SizedBox(height: 68), // 16 + 52
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 0,
                child: Container(
                  height: 84, // 16 + 52 + 16
                  decoration: BoxDecoration(
                    color: ColorManager.background,
                    border: Border(
                      top: BorderSide(
                        color: ColorManager.card,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: _buildShelterButton(context),
              ),
            ]);
          },
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

  Widget instructionCard(List<InstructionModel> instructions, int index) {
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
}
