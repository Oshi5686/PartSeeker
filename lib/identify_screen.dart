import 'dart:typed_data';
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
}
