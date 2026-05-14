/*import 'package:flutter/material.dart';
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
}*/

import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Splash screen එක import කරන්න

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Parts Connect',
      theme: ThemeData(primarySwatch: Colors.blue),
      // මුලින්ම load වෙන්නේ Splash Screen එක
      home: const SplashScreen(), 
    );
  }
}
