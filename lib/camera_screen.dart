import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'scan_screen.dart';
import 'screens/buyer/manual_search_screen.dart';
import 'screens/buyer/help_screen.dart'; // HelpScreen එක import කරන්න
import 'screens/buyer/history_screen.dart'; // HistoryScreen එක import කරන්න

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller!.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List bytes = await image.readAsBytes();
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanScreen(imageBytes: bytes),
        ),
      );
    }
  }

  Future<void> _takePicture() async {
    try {
      if (_controller == null || !_controller!.value.isInitialized) return;
      final image = await _controller!.takePicture();
      final bytes = await image.readAsBytes();
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanScreen(imageBytes: bytes),
        ),
      );
    } catch (e) {
      debugPrint("Error taking picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔵 Background Blue Shape
          Positioned(
            top: -150,
            left: -40,
            right: -40,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFFD6EAF8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // 🏗️ Logo සහ App Name
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: _buildHeader(),
                  ),

                  const SizedBox(height: 80),

                  // 📝 Title & Description
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "Identify Your Vehicle Part\nInstantly",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B4F72),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                          child: Text(
                            "Scan or upload a photo and PartSeeker AI will recognise the spare part.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // 🔍 Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextField(
                      controller: _searchController,
                      readOnly: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManualSearchScreen()),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Search spare parts",
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xFF1B4F72)),
                        filled: true,
                        fillColor: const Color(0xFFF2F4F4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 📸 Camera Preview Box
                  _buildCameraBox(),

                  const SizedBox(height: 25),

                  // 🔘 Buttons
                  _buildActionButtons(),

                  const SizedBox(height: 40),

                  // 📱 Bottom Navigation Menu (මෙතනින් තමයි Help/History යන්නේ)
                  _buildBottomMenu(context),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60,
              errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.settings_suggest,
                  size: 50,
                  color: Color(0xFF1B4F72)),
            ),
            const SizedBox(width: 8),
            const Text(
              "PartSeeker",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4F72)),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Identify Parts. Find Sellers.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFFE27312),
                fontWeight: FontWeight.w800,
                fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildCameraBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEBF5FB),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFAED6F1), width: 1.5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                _controller != null) {
              return CameraPreview(_controller!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: _takePicture,
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
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _pickFromGallery,
            icon: const Icon(Icons.file_upload_outlined,
                color: Color(0xFF1B4F72)),
            label: const Text("Upload from Gallery",
                style: TextStyle(
                    color: Color(0xFF1B4F72),
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              side: const BorderSide(color: Color(0xFF1B4F72), width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }

  // අලුත් Bottom Menu එක (Navigation සහිතව)
  Widget _buildBottomMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBottomNav(context, Icons.person_search, "Manual Search", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ManualSearchScreen()));
        }),
        _buildBottomNav(context, Icons.history, "History", () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()));
        }),
        _buildBottomNav(context, Icons.help_outline, "Help", () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HelpScreen()));
        }),
      ],
    );
  }

  Widget _buildBottomNav(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
