import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'identify_screen.dart';

class ScanScreen extends StatefulWidget {
  final Uint8List imageBytes;

  const ScanScreen({super.key, required this.imageBytes});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Model load madi scan prarambhisalu
    _runAIInference();
  }

  Future<void> _runAIInference() async {
    try {
      // 1. Assets nalliruva model load maduvudu
      await Tflite.loadModel(
        model: "assets/models/model_unquant.tflite",
        labels: "assets/models/labels.txt",
      );

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/temp_scan_image.jpg');
      await tempFile.writeAsBytes(widget.imageBytes);

      // 3. AI Model moolaka part identify maduvudu
      var recognitions = await Tflite.runModelOnImage(
        path: tempFile.path,
        numResults: 1,
        threshold: 0.2,
      );

      await Future.delayed(const Duration(seconds: 3));

      if (recognitions != null && recognitions.isNotEmpty) {
        String label = recognitions[0]['label'].toString();
        // Label nalliruva number tegeyuvudu (Example: "0 Brake" -> "Brake")
        String cleanPartName =
            label.replaceAll(RegExp(r'^[0-9]+\s*'), '').trim();
        double conf = (recognitions[0]['confidence'] as num).toDouble();

        if (mounted) {
          // Result page ge navigate maduvudu
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IdentifyPage(
                image: widget.imageBytes,
                partName: cleanPartName,
                confidence: conf,
                description:
                    "Auto-Parts-Connect has identified this component using your trained model.",
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Inference Error: $e");
    } finally {
      await Tflite.close();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Scanning Component"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gear Animation
            RotationTransition(
              turns: _controller,
              child: Image.asset(
                'assets/images/scanning image.png',
                width: 220,
                height: 220,
                errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.settings,
                    size: 100,
                    color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Analyzing Part...",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4F72)),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text("AI Vision is processing the image",
                      style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF1B4F72)),
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
