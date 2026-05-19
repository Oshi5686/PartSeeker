/*import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../auth/login_page.dart'; // ⬅️ Login Page එකට අදාළ path එක මෙතනට දාන්න

class IdentifyPage extends StatelessWidget {
  final Uint8List image;
  final String partName;
  final double confidence;
  final String description;

  const IdentifyPage({
    super.key,
    required this.image,
    required this.partName,
    required this.confidence,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Identified Part",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Image Container (Light Grey background added)
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.memory(image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 25),

              // 2. Part Name & Confidence Level
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    partName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "${(confidence * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // 3. Description Section
              Text(
                description,
                style: TextStyle(
                    fontSize: 16, color: Colors.grey.shade700, height: 1.5),
              ),
              const SizedBox(height: 40),

              // 4. "Find Sellers" Button (Navigates to Login Page)
              ElevatedButton(
                onPressed: () {
                  // 🚀 මෙතනින් තමයි Login Page එකට යන්නේ
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B4F72),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Find Sellers",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 15),

              // 5. "Scan Again" Button
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  side: const BorderSide(color: Color(0xFF1B4F72)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Scan Again",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1B4F72),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../auth/login_page.dart'; // 🎯 ඔයාගේ LoginPage එක තියෙන නිවැරදිම path එක මෙතනට දාන්න

class IdentifyPage extends StatelessWidget {
  final Uint8List image;
  final String partName;
  final double confidence;
  final String description;

  const IdentifyPage({
    super.key,
    required this.image,
    required this.partName,
    required this.confidence,
    required this.description,
  });

  // 💡 AI එකෙන් අහුවෙන Part Name එක අනුව ලස්සන Custom විස්තරයක් පෙන්වන Function එක
  String _getCustomDescription(String part) {
    String formattedPart = part.toLowerCase();
    if (formattedPart.contains('spark plug')) {
      return "A spark plug delivers electric current to the combustion chamber, igniting the fuel-air mixture to start your vehicle's engine efficiently.";
    } else if (formattedPart.contains('brake') ||
        formattedPart.contains('rotor')) {
      return "A brake rotor is a circular metal disc that works with the brake pads to stop your vehicle. When you press the brake pedal, the calipers squeeze the pads against the rotor, creating friction to slow down the wheels safely.";
    } else {
      return "Auto-Parts-Connect has successfully identified this component using your custom trained AI model.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Identified Part",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Image Container (ස්කෑන් කරපු ඉමේජ් එක පෙන්වයි)
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.memory(image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 25),

              // 2. Part Name & Confidence Level
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🎯 AI එකෙන් ආපු පිරිසිදු නම (උදා: Spark Plug හෝ Brake Rotor)
                  Text(
                    partName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "${(confidence * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // 3. Description Section (ඉමේජ් එක අනුව ඔටෝ හැදෙන විස්තරය)
              Text(
                _getCustomDescription(partName),
                style: TextStyle(
                    fontSize: 16, color: Colors.grey.shade700, height: 1.5),
              ),
              const SizedBox(height: 40),

              // 4. "Find Sellers" Button (🎯 දැන් කෙලින්ම යන්නේ LoginPage එකටයි)
              ElevatedButton(
                onPressed: () {
                  // 🚀 ඔයා කිව්වා වගේ දැන් කෙලින්ම LoginPage එකට තමයි යන්නේ.
                  // හැබැයි අපි ලොගින් පිටුවට 'scannedPart' එකත් පාස් කරනවා (එතකොට ලොග් වුණාට පස්සේ ෂොප් ලිස්ට් එකට මේ නමම අරන් යන්න පුළුවන්).
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                      // 💡 සටහන: පසුව ඔයාට අවශ්‍ය නම් LoginPage(scannedPart: partName) විදිහට මේ දත්තය ඉදිරියටම යවන්න පුළුවන්.
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B4F72),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  "Find Sellers",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              // 5. "Scan Again" Button
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  side: const BorderSide(color: Color(0xFF1B4F72)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  "Scan Again",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1B4F72),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'auth/login_page.dart'; // 🎯 ලොගින් පේජ් එක නිවැරදිව ඉම්පෝර්ට් කරගත්තා

class IdentifyPage extends StatelessWidget {
  final String
      scannedPart; // AI එකෙන් අඳුනගත්ත පාර්ට් එකේ නම (e.g., "Brake Rotor")

  const IdentifyPage({super.key, required this.scannedPart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Identified Part",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🖼️ ස්කෑන් කරපු ඉමේජ් එක පෙන්වන කොටස
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/logo.png', // ඔයාගේ ඉමේජ් පාත් එක මෙතනට දෙන්න
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 🏷️ AI එකෙන් අඳුනගත්තු නම පෙන්වන කාඩ් එක
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    "AI RESULT",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    scannedPart, // මෙතනට "Brake Rotor" වගේ නම වැටෙනවා
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4F72),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 🔍 Find Sellers Button
            ElevatedButton(
              onPressed: () {
                // 🚀 මෙතනින් LoginPage එකට යනකොට scannedPart එකත් එක්කම අරන් යනවා
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(scannedPart: scannedPart),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B4F72),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Find Sellers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 🔄 Scan Again Button
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context); // ආපහු කැමරා එකට යනවා
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1B4F72), width: 2),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const ColorFiltered(
                colorFilter:
                    ColorFilter.mode(Color(0xFF1B4F72), BlendMode.srcIn),
                child: Text(
                  "Scan Again",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
