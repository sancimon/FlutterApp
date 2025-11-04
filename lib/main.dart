import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkshare/screens/welcome_screen.dart';
import 'package:parkshare/utils/app_theme.dart';

void main() {
  runApp(const ParkShareApp());
}

class ParkShareApp extends StatelessWidget {
  const ParkShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkShare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
