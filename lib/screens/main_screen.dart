import 'package:flutter/material.dart';

import '../utils/theme/color_manager.dart';
import 'instruction_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: ColorManager.background,
        body: const SafeArea(
          child: InstructionScreen(),
        ),
      ),
    );
  }
}
