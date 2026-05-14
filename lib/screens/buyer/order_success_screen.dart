import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50, shape: BoxShape.circle),
                child: const Icon(Icons.send_rounded,
                    size: 80, color: Colors.blue),
              ),
              const SizedBox(height: 30),
              const Text(
                "Request Sent Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                "The seller has been notified. They will contact you via WhatsApp shortly to confirm your order.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 40),

              // Status Indicator (Simplified)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _statusDot("Sent", true),
                  _statusLine(),
                  _statusDot("Processing", false),
                  _statusLine(),
                  _statusDot("Confirm", false),
                ],
              ),

              const SizedBox(height: 60),

              // Back to Home Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Back to Home",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusDot(String label, bool isActive) {
    return Column(
      children: [
        Icon(Icons.check_circle,
            color: isActive ? Colors.blue : Colors.grey.shade300),
        const SizedBox(height: 5),
        Text(label,
            style: TextStyle(
                fontSize: 10, color: isActive ? Colors.blue : Colors.grey)),
      ],
    );
  }

  Widget _statusLine() {
    return Container(
        width: 40,
        height: 2,
        color: Colors.grey.shade300,
        margin: const EdgeInsets.only(bottom: 20));
  }
}
