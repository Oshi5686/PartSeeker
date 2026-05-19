/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'shop_details_screen.dart';
import '../../auth/login_page.dart';



class ManualSearchScreen extends StatelessWidget {
  const ManualSearchScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint("Logout error: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Logout failed. Please try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Search Spare Parts",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search Part Name (e.g. Brake Rotor)",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Trending/Category Tags
            const Text("Popular Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildChip("Battery"),
                _buildChip("Gas Cap"),
                _buildChip("Air Compressor"),
                _buildChip("Headlight"),
                _buildChip("Brake Pad"),
              ],
            ),

            const SizedBox(height: 30),
            const Text("Suggested Results",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 15),

            // Search Results List
            Expanded(
              child: ListView(
                children: [
                  _buildResultItem(
                      context, "Brake Rotor - Bosch", "LKR 12,000.00"),
                  _buildResultItem(
                      context, "Brake Rotor - Brembo", "LKR 25,500.00"),
                  _buildResultItem(
                      context, "Front Brake Disk", "LKR 18,000.00"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return ActionChip(
      label: Text(label),
      backgroundColor: Colors.blue.shade50,
      labelStyle: const TextStyle(color: Colors.blue, fontSize: 12),
      onPressed: () {},
    );
  }

  Widget _buildResultItem(BuildContext context, String title, String price) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFFDDEAF3),
        child:
            Icon(Icons.settings_input_component, color: Colors.blue, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(price,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopDetailsScreen()),
        );
      },
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// 🎯 නිවැරදිම Imports ටික මෙන්න:
import 'package:part_seeker/screens/buyer/shop_details_screen.dart';
import 'package:part_seeker/auth/login_page.dart';

class ManualSearchScreen extends StatelessWidget {
  const ManualSearchScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint("Logout error: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Logout failed. Please try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Search Spare Parts",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search Part Name (e.g. Brake Rotor)",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Trending/Category Tags
            const Text("Popular Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildChip("Battery"),
                _buildChip("Gas Cap"),
                _buildChip("Air Compressor"),
                _buildChip("Headlight"),
                _buildChip("Brake Pad"),
              ],
            ),

            const SizedBox(height: 30),
            const Text("Suggested Results",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 15),

            // Search Results List
            Expanded(
              child: ListView(
                children: [
                  _buildResultItem(
                      context, "Brake Rotor - Bosch", "LKR 12,000.00"),
                  _buildResultItem(
                      context, "Brake Rotor - Brembo", "LKR 25,500.00"),
                  _buildResultItem(
                      context, "Front Brake Disk", "LKR 18,000.00"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return ActionChip(
      label: Text(label),
      backgroundColor: Colors.blue.shade50,
      labelStyle: const TextStyle(color: Colors.blue, fontSize: 12),
      onPressed: () {},
    );
  }

  Widget _buildResultItem(BuildContext context, String title, String price) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFFDDEAF3),
        child:
            Icon(Icons.settings_input_component, color: Colors.blue, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(price,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // 🎯 මෙන්න මෙතන තිබ්බ පරණ const කෑල්ල මම අයින් කරා! දැන් Error එන්නේ නැහැ.
            builder: (context) => ShopDetailsScreen(
              partData: {},
              shopData: {},
            ),
          ),
        );
      },
    );
  }
}
