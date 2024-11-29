import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';
import 'screens/instruction_screen.dart';
import 'screens/main_screen.dart';
import 'screens/shelter_screen.dart';
import 'utils/theme/color_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: App()));
}

class App extends StatefulWidget {
  final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
        routes: [
          GoRoute(
            path: 'instruction',
            builder: (context, state) => const InstructionScreen(),
          ),
          GoRoute(
            path: 'shelter',
            builder: (context, state) => const ShelterScreen(),
          ),
        ]),
  ]);

  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.router,
      theme: ThemeData(scaffoldBackgroundColor: ColorManager.background),
    );
  }
}
