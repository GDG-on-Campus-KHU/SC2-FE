import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

import '../utils/theme/color_manager.dart';
import 'instruction_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<void> getDeviceToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $fcmToken');
    // TODO: Send this token to your backend or store it as needed
  }

  @override
  Widget build(BuildContext context) {
    getDeviceToken();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorManager.background,
      systemNavigationBarColor: ColorManager.background,
    ));

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
