import 'package:flutter/material.dart';
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
}
