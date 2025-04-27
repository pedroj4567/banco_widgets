import 'package:flutter/material.dart';
import 'package:widget_application/presentation/screens/buttons/buttons_screen.dart';
import 'package:widget_application/presentation/screens/cards/card_screen.dart';
import 'package:widget_application/presentation/screens/home/home_screen.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardScreen(),
      },
      home: Scaffold(
        body: const HomeScreen(),
      ),
    );
  }
}
