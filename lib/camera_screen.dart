import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Take Photo'),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cancel),
                  title: const Text('Cancel'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Top Background Ellipse -
          Positioned(
            top: -120,
            left: -40,
            right: -40,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: const Color(0xFFD6EAF8), // Figma light blue color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width + 100, 180),
                  bottomRight: Radius.elliptical(
                      MediaQuery.of(context).size.width + 100, 180),
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // 2. Logo & Name
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: 70, //
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8), // Logo
                            const Text(
                              "PartSeeker",
                              style: TextStyle(
                                fontSize: 32, // Figma
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B4F72), // Dark Blue
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // 3. Subtitle - Identify Parts. Find Sellers.
                        const Text(
                          "Identify Parts. Find Sellers.",
                          style: TextStyle(
                            color: Color(0xFFE27312), // Orange color from Figma
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // 4. Main Title
                  const Text(
                    "Identify Your Vehicle Part\nInstantly",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4F72),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Text(
                      "Scan or upload a photo and PartSeeker AI will recognise the spare part.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),

                  // 5. Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search spare parts",
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFD5D8DC)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFF1B4F72)),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),

                  // 6. Camera Preview Box
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5FB),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color(0xFFAED6F1), width: 1.5),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined,
                              color: Color(0xFF2E86C1), size: 50),
                          SizedBox(height: 10),
                          Text(
                            "Camera Preview",
                            style: TextStyle(
                                color: Color(0xFF2E86C1),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 7. Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      label: const Text("Scan Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B4F72),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: OutlinedButton.icon(
                      onPressed: () => _showPicker(context),
                      icon: const Icon(Icons.file_upload_outlined,
                          color: Color(0xFF1B4F72)),
                      label: const Text("Upload from Gallery",
                          style: TextStyle(
                              color: Color(0xFF1B4F72),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        side: const BorderSide(
                            color: Color(0xFF1B4F72), width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 8. Bottom Navigation Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottomNav(Icons.person_search, "Manual Search"),
                      _buildBottomNav(Icons.save_outlined, "Saved Scans"),
                      _buildBottomNav(Icons.help_outline, "Help"),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F4F4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: const Color(0xFF1B4F72), size: 28),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
      ],
    );
  }
}
