import 'package:flutter/material.dart';
import 'package:vocny/screens/home2.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocny',
      theme: appTheme,
      home: const HomeScreen2(),
    );
  }
}