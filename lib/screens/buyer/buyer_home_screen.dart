/*import 'package:flutter/material.dart';
import 'shop_details_screen.dart'; //

class BuyerHomeScreen extends StatelessWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Blue Header with Logo
            _buildHeader(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello, Akash",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sellers for Brake Rotor",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  // Filter Chips
                  _buildFilterChips(),

                  const SizedBox(height: 20),

                  
                  _buildShopItem(context, "Hill Country Auto Mart Shop",
                      "Katugastota, Kandy", "LKR 22 000.00", 4),
                  _buildShopItem(context, "Central Spare Mart Shop",
                      "Dambulla Road, Kurunegala", "LKR 18 000.00", 5),
                  _buildShopItem(
                      context, "Kasun Perera", "Kandy", "LKR 14 000.00", 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Figma Header UI
  Widget _buildHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDDEAF3),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Logo placeholder
            const Icon(Icons.settings, size: 80, color: Colors.blue),
            const Text("PartSeeker",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A))),
          ],
        ),
      ),
    );
  }

  // Filter UI
  Widget _buildFilterChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ["Nearest", "Lower Price", "New", "Used"].map((label) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }

  // Shop Card UI with Navigation
  Widget _buildShopItem(BuildContext context, String name, String location,
      String price, int stars) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShopDetailsScreen()),
          );
        },
        leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: const TextStyle(fontSize: 12)),
            Row(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        size: 14,
                        color: index < stars ? Colors.orange : Colors.grey))),
            Text(price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone, color: Colors.blue),
            SizedBox(width: 10),
            Icon(Icons.message, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'shop_details_screen.dart';

class BuyerHomeScreen extends StatelessWidget {
  // ස්කෑන් කරලා ලැබෙන පාර්ට් එකේ නම (උදා: "Brake Rotor" හෝ "Spark Plug")
  final String scannedPart;

  const BuyerHomeScreen(
      {super.key,
      this.scannedPart = "Brake Rotor"}); // default එක Brake Rotor කියලා දැම්මා

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Blue Header with Logo
            _buildHeader(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello, Akash",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // ස්කෑන් කරපු පාර්ට් එක අනුව Title එක වෙනස් වෙනවා
                  Text(
                    "Sellers for $scannedPart",
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  // Filter Chips
                  _buildFilterChips(),

                  const SizedBox(height: 20),

                  // ෂොප්ස් වල විස්තර ටික ඩයිනමික් විදිහට පාස් කරනවා
                  _buildShopItem(context,
                      shopName: "Hill Country Auto Mart Shop",
                      location: "Katugastota, Kandy",
                      price: "LKR 22,000.00",
                      stars: 4,
                      phone: "+94771112222",
                      condition: "Brand New"),
                  _buildShopItem(context,
                      shopName: "Central Spare Mart Shop",
                      location: "Dambulla Road, Kurunegala",
                      price: "LKR 18,000.00",
                      stars: 5,
                      phone: "+94773334444",
                      condition: "New"),
                  _buildShopItem(context,
                      shopName: "Kasun Perera",
                      location: "Pilimathalawa, Kandy",
                      price: "LKR 14,000.00",
                      stars: 3,
                      phone: "+94775556666",
                      condition: "Used"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Figma Header UI
  Widget _buildHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDDEAF3),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.settings, size: 80, color: Colors.blue),
            const Text("PartSeeker",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A))),
          ],
        ),
      ),
    );
  }

  // Filter UI
  Widget _buildFilterChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ["Nearest", "Lower Price", "New", "Used"].map((label) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }

  // Shop Card UI - සම්පූර්ණයෙන්ම ඩයිනමික් කර ඇත
  Widget _buildShopItem(
    BuildContext context, {
    required String shopName,
    required String location,
    required String price,
    required int stars,
    required String phone,
    required String condition,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          // ක්ලික් කරපු වෙලාවේ ඩේටා ටික Maps දෙකකට ඇසුරුම් (Pack) කරලා පාස් කරනවා
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetailsScreen(
                partData: {
                  "partName": scannedPart,
                  "price": price,
                  "condition": condition,
                },
                shopData: {
                  "shopName": shopName,
                  "location": location,
                  "phone": phone,
                },
              ),
            ),
          );
        },
        leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white)),
        title:
            Text(shopName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: const TextStyle(fontSize: 12)),
            Row(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        size: 14,
                        color: index < stars ? Colors.orange : Colors.grey))),
            Text(price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone, color: Colors.blue),
            SizedBox(width: 10),
            Icon(Icons.message, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'shop_details_screen.dart';
import 'package:part_seeker/screens/buyer/shop_details_screen.dart';

class BuyerHomeScreen extends StatelessWidget {
  // 🚀 AI එකෙන් ස්කෑන් වෙලා ලොගින් පේජ් එක හරහා මෙතනට එන ඕනෑම නිවැරදි පාර්ට් එකක නමක්
  final String scannedPart;

  const BuyerHomeScreen({
    super.key,
    required this.scannedPart, // 🎯 දැන් මේක required, එතකොට dynamic ඩේටා විතරයි පෙන්නන්නේ
  });

  @override
  Widget build(BuildContext context) {
    // 👤 Firebase Auth එකෙන් ලොග් වුණු යූසර්ගේ නම ගන්නවා
    final User? user = FirebaseAuth.instance.currentUser;
    final String greetingName = user?.displayName ?? "User";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Blue Header with Logo
            _buildHeader(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // යූසර්ගේ සැබෑ නම
                  Text(
                    "Hello, $greetingName",
                    style: const TextStyle(
                        color: Color(0xFF1B4F72),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // ස්කෑන් කරපු පාර්ට් එක අනුව Title එක 100% ඩයිනමික් වෙනවා
                  Text(
                    "Sellers for $scannedPart",
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  // Filter Chips
                  _buildFilterChips(),

                  const SizedBox(height: 20),

                  // 🔄 Firestore එකෙන් හරියටම scannedPart එකට ගැලපෙන කඩවල් ටික විතරක් ගන්නවා
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('parts')
                        .where('partName',
                            isEqualTo:
                                scannedPart) // 🎯 මෙතනින් තමයි dynamic filter එක කරන්නේ
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "No registered shops found for '$scannedPart' in Firebase yet.",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        );
                      }

                      // ඩේටා තියෙනවා නම් ලස්සනට ලිස්ට් එකක් විදිහට පෙන්වනවා
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var doc = snapshot.data!.docs[index];

                          return _buildShopItem(
                            context,
                            displayPartName: scannedPart,
                            shopName: doc['shopName'] ?? 'Unknown Shop',
                            location: doc['location'] ?? 'No Location',
                            price: doc['price'] ?? 'LKR 0.00',
                            stars: doc['stars'] ?? 5,
                            phone: doc['phone'] ?? '',
                            condition: doc['condition'] ?? 'New',
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Figma Header UI
  Widget _buildHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDDEAF3),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150)),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(Icons.settings, size: 80, color: Colors.blue),
            Text("PartSeeker",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A))),
          ],
        ),
      ),
    );
  }

  // Filter UI
  Widget _buildFilterChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ["Nearest", "Lower Price", "New", "Used"].map((label) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }

  // Shop Card UI
  Widget _buildShopItem(
    BuildContext context, {
    required String displayPartName,
    required String shopName,
    required String location,
    required String price,
    required int stars,
    required String phone,
    required String condition,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetailsScreen(
                partData: {
                  "partName": displayPartName,
                  "price": price,
                  "condition": condition,
                },
                shopData: {
                  "shopName": shopName,
                  "location": location,
                  "phone": phone,
                },
              ),
            ),
          );
        },
        leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white)),
        title:
            Text(shopName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: const TextStyle(fontSize: 12)),
            Row(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        size: 14,
                        color: index < stars ? Colors.orange : Colors.grey))),
            Text(price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone, color: Colors.blue),
            SizedBox(width: 10),
            Icon(Icons.message, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart'; // 🎯 URL Launcher එක එකතු කරා
import 'package:part_seeker/screens/buyer/shop_details_screen.dart';

class BuyerHomeScreen extends StatelessWidget {
  final String scannedPart;

  const BuyerHomeScreen({
    super.key,
    required this.scannedPart,
  });

  // 📞 සෙලර්ට කෝල් එකක් ගන්නා ෆන්ක්ෂන් එක
  Future<void> _makeCall(String phone) async {
    if (phone.isEmpty) return;
    final Uri callUrl = Uri.parse("tel:$phone");
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    }
  }

  // 💬 සෙලර්ට කෙලින්ම WhatsApp මැසේජ් එකක් යවන ෆන්ක්ෂන් එක
  Future<void> _openWhatsApp(String phone, String partName) async {
    if (phone.isEmpty) return;

    // ලංකාවේ නම්බර් එකක් නම් +94 හැඩයට සකස් කර ගැනීම
    String formattedPhone = phone.trim();
    if (formattedPhone.startsWith('0')) {
      formattedPhone = '+94' + formattedPhone.substring(1);
    }

    final String message =
        "Hello, I am interested in buying the '$partName' from your shop listed on PartSeeker.";
    final Uri whatsappUrl = Uri.parse(
        "https://wa.me/${formattedPhone.replaceAll('+', '')}?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String greetingName = user?.displayName ?? "User";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, $greetingName",
                    style: const TextStyle(
                        color: Color(0xFF1B4F72),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sellers for $scannedPart",
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildFilterChips(),
                  const SizedBox(height: 20),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('parts')
                        .where('partName', isEqualTo: scannedPart)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "No registered shops found for '$scannedPart' in Firebase yet.",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var doc = snapshot.data!.docs[index];

                          return _buildShopItem(
                            context,
                            displayPartName: scannedPart,
                            shopName: doc['shopName'] ?? 'Unknown Shop',
                            location: doc['location'] ?? 'No Location',
                            price: doc['price'] ?? 'LKR 0.00',
                            stars: doc['stars'] ?? 5,
                            phone: doc['phone'] ?? '',
                            condition: doc['condition'] ?? 'New',
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDDEAF3),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150)),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(Icons.settings, size: 80, color: Colors.blue),
            Text("PartSeeker",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A))),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ["Nearest", "Lower Price", "New", "Used"].map((label) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }

  Widget _buildShopItem(
    BuildContext context, {
    required String displayPartName,
    required String shopName,
    required String location,
    required String price,
    required int stars,
    required String phone,
    required String condition,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          // 🚀 කඩේ ක්ලික් කරපු ගමන් ඔක්කොම ඩේටා ටික ShopDetailsScreen එකට යනවා
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetailsScreen(
                partData: {
                  "partName": displayPartName,
                  "price": price,
                  "condition": condition,
                },
                shopData: {
                  "shopName": shopName,
                  "location": location,
                  "phone": phone,
                },
              ),
            ),
          );
        },
        leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white)),
        title:
            Text(shopName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: const TextStyle(fontSize: 12)),
            Row(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        size: 14,
                        color: index < stars ? Colors.orange : Colors.grey))),
            Text(price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 📞 Call Button එක වැඩ කරනවා
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.blue),
              onPressed: () => _makeCall(phone),
            ),
            const SizedBox(width: 5),
            // 💬 WhatsApp Message Button එක වැඩ කරනවා
            IconButton(
              icon: const Icon(Icons.message, color: Colors.blue),
              onPressed: () => _openWhatsApp(phone, displayPartName),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:part_seeker/screens/buyer/shop_details_screen.dart';

class BuyerHomeScreen extends StatelessWidget {
  final String scannedPart;

  const BuyerHomeScreen({
    super.key,
    required this.scannedPart,
  });

  Future<void> _makeCall(String phone) async {
    if (phone.isEmpty) return;
    final Uri callUrl = Uri.parse("tel:$phone");
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    }
  }

  Future<void> _openWhatsApp(String phone, String partName) async {
    if (phone.isEmpty) return;

    String formattedPhone = phone.trim();
    if (formattedPhone.startsWith('0')) {
      formattedPhone = '+94' + formattedPhone.substring(1);
    }

    final String message =
        "Hello, I am interested in buying the '$partName' from your shop listed on PartSeeker.";
    final Uri whatsappUrl = Uri.parse(
        "https://wa.me/${formattedPhone.replaceAll('+', '')}?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String greetingName = user?.displayName ?? "User";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, $greetingName",
                    style: const TextStyle(
                        color: Color(0xFF1B4F72),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sellers for $scannedPart",
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildFilterChips(),
                  const SizedBox(height: 20),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('parts')
                        .where('category', isEqualTo: scannedPart.toUpperCase())
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "No registered shops found for '$scannedPart' in Firebase yet.",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var partDoc = snapshot.data!.docs[index];

                          String shopId = partDoc['shopId'] ?? '';
                          String price = partDoc['price']?.toString() ?? '0.00';
                          String condition = partDoc['status'] ?? 'New';
                          String partName = partDoc['partName'] ?? scannedPart;

                          String targetCollection = 'shops';
                          if (shopId.startsWith('seller_')) {
                            targetCollection = 'sellers';
                          }

                          return FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection(targetCollection)
                                .doc(shopId)
                                .get(),
                            builder: (context, userSnapshot) {
                              if (userSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }

                              if (!userSnapshot.hasData ||
                                  !userSnapshot.data!.exists) {
                                return const SizedBox();
                              }

                              var userData = userSnapshot.data!;
                              Map<String, dynamic> dataMap =
                                  userData.data() as Map<String, dynamic>;

                              String displayName = 'Unknown Seller';
                              if (dataMap.containsKey('shopName')) {
                                displayName = dataMap['shopName'];
                              } else if (dataMap.containsKey('name')) {
                                displayName = dataMap['name'];
                              }

                              String sLocation = dataMap.containsKey('location')
                                  ? dataMap['location']
                                  : 'No Location';
                              String sPhone = dataMap.containsKey('phone')
                                  ? dataMap['phone']
                                  : '';

                              int sStars = 5;
                              if (dataMap.containsKey('stars')) {
                                sStars = dataMap['stars'] is int
                                    ? dataMap['stars']
                                    : (dataMap['stars'] as num).toInt();
                              }

                              return _buildShopItem(
                                context,
                                displayPartName: partName,
                                shopName: displayName,
                                location: sLocation,
                                price: 'LKR $price',
                                stars: sStars,
                                phone: sPhone,
                                condition: condition,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDDEAF3),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150)),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(Icons.settings, size: 80, color: Colors.blue),
            Text("PartSeeker",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A))),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ["Nearest", "Lower Price", "New", "Used"].map((label) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }

  Widget _buildShopItem(
    BuildContext context, {
    required String displayPartName,
    required String shopName,
    required String location,
    required String price,
    required int stars,
    required String phone,
    required String condition,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetailsScreen(
                partData: {
                  "partName": displayPartName,
                  "price": price,
                  "condition": condition,
                },
                shopData: {
                  "shopName": shopName,
                  "location": location,
                  "phone": phone,
                },
              ),
            ),
          );
        },
        leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white)),
        title:
            Text(shopName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: const TextStyle(fontSize: 12)),
            Row(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        size: 14,
                        color: index < stars ? Colors.orange : Colors.grey))),
            Text(price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.blue),
              onPressed: () => _makeCall(phone),
            ),
            const SizedBox(width: 5),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.blue),
              onPressed: () => _openWhatsApp(phone, displayPartName),
            ),
          ],
        ),
      ),
    );
  }
}
