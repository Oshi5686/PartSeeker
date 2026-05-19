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

/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase සඳහා අවශ්‍ය ප්‍රධාන ඉම්පෝර්ට් එක
import 'splash_screen.dart'; // ඔයාගේ Splash Page එක ලෝඩ් වෙන්න

void main() async {
  // Flutter Engine එක සහ Widgets නිසිලෙස බයින්ඩ් වී ඇති බව සහතික කරයි
  WidgetsFlutterBinding.ensureInitialized();

  // ඇප් එක Firebase ඩේටාබේස් එකත් එක්ක කනෙක්ට් කරන ප්‍රධානම පේළිය
  await Firebase.initializeApp();

  runApp(const PartSeekerApp());
}

class PartSeekerApp extends StatelessWidget {
  const PartSeekerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PartSeeker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // ඇප් එක ස්ටාර්ට් වෙද්දීම Splash Page එකට යයි
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // 🌐 kIsWeb චෙක් කිරීමට අනිවාර්යයෙන්ම අවශ්‍යයි

// 📦 ඔයාගේ Pages ඔක්කොම නිවැරදිව ඉම්පෝර්ට් කරගත්තේ මෙහෙමයි:
import 'splash_screen.dart';
import 'web/seller_auth_page.dart'; // 🎯 මෙන්න මේ නිවැරදි Import එක වැටුණු නිසා දැන් Error එක නැති වෙනවා!

void main() async {
  // Flutter Engine එක සහ widgets නිසිලෙස බයින්ඩ් වී ඇති බව සහතික කරයි
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐 වෙබ් සහ මොබයිල් දෙකටම ආරක්ෂිතව Firebase Initialize කිරීම
  if (kIsWeb) {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      debugPrint("Firebase Web Initialization Setup: $e");
    }
  } else {
    // Mobile (Android/iOS) වලදී සාමාන්‍ය විදිහටම රන් වෙනවා
    await Firebase.initializeApp();
  }

  runApp(const PartSeekerApp());
}

class PartSeekerApp extends StatelessWidget {
  const PartSeekerApp(
      {super.key}); // 🎯 මෙතන අන්තිමට තිබ්බ ";" එක අයින් කරලා Error එක සම්පූර්ණයෙන්ම හැදුවා!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PartSeeker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // 🎯 මෙන්න මෙතනින් තමයි සිස්ටම් එක ඔටෝමැටිකලි Platform එක තීරණය කරන්නේ:
      home: kIsWeb
          ? const SellerAuthPage() // 💻 Web Browser එකෙන් ආවොත් කෙලින්ම වෙබ් පේජ් එක ඕපන් වෙනවා
          : const SplashScreen(), // 📲 Phone එකෙන් ආවොත් කෙලින්ම මොබයිල් ඇප් එක ඕපන් වෙනවා
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // 🌐 kIsWeb චෙක් කිරීමට අනිවාර්යයෙන්ම අවශ්‍යයි

// 📦 ඔයාගේ Pages ඔක්කොම නිවැරදිව ඉම්පෝර්ට් කරගත්තේ මෙහෙමයි:
import 'splash_screen.dart';
import 'web/seller_auth_page.dart'; // 🎯 මෙන්න මේ නිවැරදි Import එක වැටුණු නිසා දැන් Error එක නැති වෙනවා!

void main() async {
  // Flutter Engine එක සහ widgets නිසිලෙස බයින්ඩ් වී ඇති බව සහතික කරයි
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐 වෙබ් සහ මොබයිල් දෙකටම ආරක්ෂිතව Firebase Initialize කිරීම
  if (kIsWeb) {
    // 💻 Web Browser එකෙන් ආවොත් FirebaseOptions සහිතව initialize කරනවා
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDT6HaFcmvbNp1HZdmX5DZVQVRdNrnQbL8",
          authDomain: "auto-parts-connect-34ff1.firebaseapp.com",
          projectId: "auto-parts-connect-34ff1",
          storageBucket: "auto-parts-connect-34ff1.firebasestorage.app",
          messagingSenderId: "923292256742",
          appId: "1:923292256742:web:dc917766107a4f6e30ae27",
        ),
      );
    } catch (e) {
      debugPrint("Firebase Web Initialization Setup: $e");
    }
  } else {
    // 📲 Mobile (Android/iOS) වලදී google-services.json එකෙන් auto initialize වෙනවා
    await Firebase.initializeApp();
  }

  runApp(const PartSeekerApp());
}

class PartSeekerApp extends StatelessWidget {
  const PartSeekerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PartSeeker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // 🎯 මෙන්න මෙතනින් තමයි සිස්ටම් එක ඔටෝමැටිකලි Platform එක තීරණය කරන්නේ:
      home: kIsWeb
          ? const SellerAuthPage() // 💻 Web Browser එකෙන් ආවොත් කෙලින්ම වෙබ් පේජ් එක ඕපන් වෙනවා
          : const SplashScreen(), // 📲 Phone එකෙන් ආවොත් කෙලින්ම මොබයිල් ඇප් එක ඕපන් වෙනවා
    );
  }
}
