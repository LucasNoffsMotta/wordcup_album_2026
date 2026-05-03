import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/core/theme/app_theme.dart';
import 'package:wordcup_album_2026/screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Cup 2026',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      home: MainScreen(),
    );
  }
}

