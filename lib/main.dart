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

/*import 'package:flutter/material.dart';
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
    
      home: const SplashScreen(), 
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Parts Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
/*import 'web/seller_auth_page.dart'; */
import 'splash_screen.dart';
import 'package:part_seeker/web/seller_auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      print("Running on Web: Firebase auto-init skipped");
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    print("Firebase error: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Parts Connect',
      theme: ThemeData(
        // මෙතන const එක අයින් කරන්න, එතකොට error එක එන්නේ නැහැ
        primaryColor: const Color(0xFF0D3178),
        fontFamily: 'Poppins',
      ),
      // SellerAuthPage එකට කලින් const දාන්න එපා
      home: kIsWeb ? const SellerAuthPage() : const SplashScreen(),
    );
  }
}*/
