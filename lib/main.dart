import 'package:flutter/material.dart';
import 'splash_screen.dart'; //

void main() {
  runApp(const PartSeekerApp());
}

class PartSeekerApp extends StatelessWidget {
  const PartSeekerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartSeeker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF0D3178),
      ),
      home: const SplashScreen(),
    );
  }
}
