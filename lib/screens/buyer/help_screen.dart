import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("How to Use", style: TextStyle(color: Colors.black)),
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
          children: [
            _buildHelpStep("1", "Point the camera at the auto part clearly."),
            _buildHelpStep("2", "Wait for the AI to recognize the part."),
            _buildHelpStep("3", "Browse sellers and prices instantly."),
            const SizedBox(height: 30),
            const Icon(Icons.info_outline, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            const Text(
              "If the camera cannot identify the part, use the 'Manual Search' option.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpStep(String step, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(step, style: const TextStyle(color: Colors.white))),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
