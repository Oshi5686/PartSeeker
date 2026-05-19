/*import 'dart:io';
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
}*/

/*import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'identify_screen.dart'; // IdentifyPage එක තියෙන ෆයිල් එක

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

    // Model එක ලෝඩ් කරලා ස්කෑන් එක පටන් ගන්නවා
    _runAIInference();
  }

  Future<void> _runAIInference() async {
    try {
      // 1. Assets වල තියෙන TFLite Model එක ලෝඩ් කිරීම
      await Tflite.loadModel(
        model: "assets/models/model_unquant.tflite",
        labels: "assets/models/labels.txt",
      );

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/temp_scan_image.jpg');
      await tempFile.writeAsBytes(widget.imageBytes);

      // 3. AI Model එක මගින් Part එක Identify කිරීම
      var recognitions = await Tflite.runModelOnImage(
        path: tempFile.path,
        numResults: 1,
        threshold: 0.2,
      );

      await Future.delayed(const Duration(seconds: 3));

      if (recognitions != null && recognitions.isNotEmpty) {
        String label = recognitions[0]['label'].toString();

        // Label එකේ තියෙන ඉලක්කම් අයින් කිරීම (Example: "0 Spark Plug" -> "Spark Plug")
        String cleanPartName =
            label.replaceAll(RegExp(r'^[0-9]+\s*'), '').trim();
        double conf = (recognitions[0]['confidence'] as num).toDouble();

        if (mounted) {
          // 🎯 රියල් AI එකෙන් හොයාගත්ත නම (`cleanPartName`) අපි IdentifyPage එකට පාස් කරනවා!
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IdentifyPage(
                image: widget.imageBytes,
                partName: cleanPartName, // මෙතනින් ඩයිනමික් නම යනවා
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
}*/

/*import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'identify_screen.dart'; // IdentifyPage එක තියෙන ෆයිල් එක

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

    // Model එක ලෝඩ් කරලා ස්කෑන් එක පටන් ගන්නවා
    _runAIInference();
  }

  Future<void> _runAIInference() async {
    try {
      // 1. Assets වල තියෙන TFLite Model එක ලෝඩ් කිරීම
      await Tflite.loadModel(
        model: "assets/models/model_unquant.tflite",
        labels: "assets/models/labels.txt",
      );

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/temp_scan_image.jpg');
      await tempFile.writeAsBytes(widget.imageBytes);

      // 3. AI Model එක මගින් Part එක Identify කිරීම
      var recognitions = await Tflite.runModelOnImage(
        path: tempFile.path,
        numResults: 1,
        threshold: 0.2,
      );

      await Future.delayed(const Duration(seconds: 3));

      if (recognitions != null && recognitions.isNotEmpty) {
        String label = recognitions[0]['label'].toString();

        // Label එකේ තියෙන ඉලක්කම් අයින් කිරීම (Example: "0 Spark Plug" -> "Spark Plug")
        String cleanPartName =
            label.replaceAll(RegExp(r'^[0-9]+\s*'), '').trim();

        if (mounted) {
          // 🎯 දැන් අපි පිරිසිදු කරපු IdentifyPage එකට පාස් කරන්නේ 'scannedPart' එක විතරයි!
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IdentifyPage(
                scannedPart: cleanPartName, // මෙතනින් ඩයිනමික් නම විතරක් යනවා
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Inference Error: $e");
    } finally {
      // 🎯 Error එකක් එන්නේ නැතිවෙන්න 'await' එක අයින් කරලා close() එක විතරක් දැම්මා
      Tflite.close();
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
*/

/*import 'dart:io';
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
  String _statusText = "Loading AI Model...";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _runAIInference();
  }

  Future<void> _runAIInference() async {
    try {
      setState(() => _statusText = "Loading AI Model...");

      await Tflite.loadModel(
        model: "assets/models/model_unquant.tflite",
        labels: "assets/models/labels.txt",
        numThreads: 4,
        isAsset: true,
        useGpuDelegate: false,
      );

      setState(() => _statusText = "Processing Image...");

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/temp_scan_image.jpg');
      await tempFile.writeAsBytes(widget.imageBytes);

      setState(() => _statusText = "Identifying Part...");

      var recognitions = await Tflite.runModelOnImage(
        path: tempFile.path,
        numResults: 3,
        threshold: 0.05,
        imageMean: 127.5, // ✅ Teachable Machine default
        imageStd: 127.5, // ✅ Teachable Machine default
        asynch: true,
      );

      // Debug logs
      debugPrint("=== AI Results ===");
      if (recognitions != null) {
        for (var r in recognitions) {
          debugPrint(
              "Label: ${r['label']} | Confidence: ${((r['confidence'] as double) * 100).toStringAsFixed(1)}%");
        }
      }

      await Future.delayed(const Duration(seconds: 2));

      if (recognitions != null && recognitions.isNotEmpty) {
        var bestResult = recognitions[0];
        double confidence = (bestResult['confidence'] as double) * 100;
        String label = bestResult['label'].toString();
        String cleanPartName =
            label.replaceAll(RegExp(r'^[0-9]+\s*'), '').trim();

        debugPrint(
            "Best: $cleanPartName | Confidence: ${confidence.toStringAsFixed(1)}%");

        if (mounted) {
          if (confidence < 30) {
            // Low confidence — top 3 options user ට දෙනවා
            _showLowConfidenceDialog(cleanPartName, confidence, recognitions);
          } else {
            // ✅ imageBytes සමඟ IdentifyPage එකට යනවා
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => IdentifyPage(
                  scannedPart: cleanPartName,
                  imageBytes: widget.imageBytes, // ✅ image pass කරනවා
                ),
              ),
            );
          }
        }
      } else {
        _showErrorDialog(
            "Part identify කරන්න බැරි වුණා. Photo clear ව retake කරන්නකෝ.");
      }
    } catch (e) {
      debugPrint("Inference Error: $e");
      if (mounted) {
        _showErrorDialog("Error: ${e.toString()}");
      }
    } finally {
      Tflite.close();
    }
  }

  // ✅ Low confidence dialog — top 3 options
  void _showLowConfidenceDialog(
      String topPart, double confidence, List recognitions) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 8),
            Text("Low Confidence"),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AI isn't fully sure. Please select the correct part:",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(height: 16),
            ...recognitions.take(3).map((r) {
              String lbl = r['label']
                  .toString()
                  .replaceAll(RegExp(r'^[0-9]+\s*'), '')
                  .trim();
              double conf = (r['confidence'] as double) * 100;
              return GestureDetector(
                onTap: () {
                  Navigator.of(ctx).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IdentifyPage(
                        scannedPart: lbl,
                        imageBytes: widget.imageBytes, // ✅ image pass
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(lbl,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: conf > 50
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${conf.toStringAsFixed(1)}%",
                          style: TextStyle(
                            color: conf > 50 ? Colors.green : Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child:
                const Text("Scan Again", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
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
            const SizedBox(height: 12),
            Text(
              _statusText,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
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
                  const Text(
                    "AI Vision is processing the image",
                    style: TextStyle(color: Colors.black54),
                  ),
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
            const SizedBox(height: 30),
            Container(
              width: 300,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.tips_and_updates,
                          size: 16, color: Colors.blue),
                      SizedBox(width: 6),
                      Text("Tips for better results",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "• Part eka clear ව photo ekk gann\n• Good lighting use karann\n• Part eka frame ekata center karann",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

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
  String _statusText = "Loading AI Model...";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _runAIInference();
  }

  Future<void> _runAIInference() async {
    try {
      setState(() => _statusText = "Loading AI Model...");

      await Tflite.loadModel(
        model: "assets/models/model_unquant.tflite",
        labels: "assets/models/labels.txt",
        numThreads: 4,
        isAsset: true,
        useGpuDelegate: false,
      );

      setState(() => _statusText = "Processing Image...");

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/temp_scan_image.jpg');
      await tempFile.writeAsBytes(widget.imageBytes);

      setState(() => _statusText = "Identifying Part...");

      // 🎯 OPTIMIZED FOR LIVE CAMERA & GALLERY IMAGES
      var recognitions = await Tflite.runModelOnImage(
        path: tempFile.path,
        numResults: 3,
        threshold:
            0.10, // වැරදි options අයින් වෙන්න threshold එක 0.10 දක්වා වැඩි කරා
        imageMean: 127.5, // ✅ Teachable Machine default
        imageStd: 127.5, // ✅ Teachable Machine default
        asynch: true,
      );

      // Debug logs
      debugPrint("=== AI Results ===");
      if (recognitions != null) {
        for (var r in recognitions) {
          debugPrint(
              "Label: ${r['label']} | Confidence: ${((r['confidence'] as double) * 100).toStringAsFixed(1)}%");
        }
      }

      await Future.delayed(const Duration(
          seconds: 1)); // Delay එක පොඩ්ඩක් අඩු කරා ස්ලෝ ගතිය නැති වෙන්න

      if (recognitions != null && recognitions.isNotEmpty) {
        var bestResult = recognitions[0];
        double confidence = (bestResult['confidence'] as double) * 100;
        String label = bestResult['label'].toString();
        String cleanPartName =
            label.replaceAll(RegExp(r'^[0-9]+\s*'), '').trim();

        debugPrint(
            "Best: $cleanPartName | Confidence: ${confidence.toStringAsFixed(1)}%");

        if (mounted) {
          if (confidence < 35) {
            _showLowConfidenceDialog(cleanPartName, confidence, recognitions);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => IdentifyPage(
                  scannedPart: cleanPartName,
                  imageBytes: widget.imageBytes, // ✅ image pass කරනවා
                ),
              ),
            );
          }
        }
      } else {
        _showErrorDialog("No results found. Please try again.");
      }
    } catch (e) {
      debugPrint("Inference Error: $e");
      if (mounted) {
        _showErrorDialog("Error: ${e.toString()}");
      }
    } finally {
      Tflite.close();
    }
  }

  // ✅ Low confidence dialog — top 3 options
  void _showLowConfidenceDialog(
      String topPart, double confidence, List recognitions) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 8),
            Text("Low Confidence"),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AI isn't fully sure. Please select the correct part:",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(height: 16),
            ...recognitions.take(3).map((r) {
              String lbl = r['label']
                  .toString()
                  .replaceAll(RegExp(r'^[0-9]+\s*'), '')
                  .trim();
              double conf = (r['confidence'] as double) * 100;
              return GestureDetector(
                onTap: () {
                  Navigator.of(ctx).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IdentifyPage(
                        scannedPart: lbl,
                        imageBytes: widget.imageBytes, // ✅ image pass
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(lbl,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: conf > 50
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${conf.toStringAsFixed(1)}%",
                          style: TextStyle(
                            color: conf > 50 ? Colors.green : Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child:
                const Text("Scan Again", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
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
            const SizedBox(height: 12),
            Text(
              _statusText,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
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
                  const Text(
                    "AI Vision is processing the image",
                    style: TextStyle(color: Colors.black54),
                  ),
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
            const SizedBox(height: 30),
            Container(
              width: 300,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.tips_and_updates,
                          size: 16, color: Colors.blue),
                      SizedBox(width: 6),
                      Text("Tips for better results",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "• Part eka clear  photo ekk gann\n• Good lighting use karann\n• Part eka frame ekata center karann",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
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
