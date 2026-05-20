/*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'order_success_screen.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> partData;
  final Map<String, dynamic> shopData;

  const ShopDetailsScreen({
    super.key,
    required this.partData,
    required this.shopData,
  });

  Future<void> _openMap() async {
    final String address = shopData['location'] ?? "Kandy, Sri Lanka";
    final String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}";
    final Uri url = Uri.parse(googleMapUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch maps URL");
    }
  }

  Future<void> _callSeller() async {
    final String phone = shopData['phone'] ?? "";
    if (phone.isEmpty) return;

    final Uri callUrl = Uri.parse("tel:$phone");
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      debugPrint("Could not launch phone dialer");
    }
  }

  // Confirmation Pop-up Dialog එක (Brand සහ Status එකත් මේක ඇතුළට දැම්මා)
  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.shopping_bag_outlined, color: Colors.green),
              SizedBox(width: 10),
              Text(
                "Confirm Order",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Are you sure you want to place this order?",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item: ${partData['partName'] ?? 'Spare Part'}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Brand: ${partData['brand'] ?? 'Genuine'}",
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Price: ${partData['price'] ?? 'LKR 0.00'}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderSuccessScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Yes, Place Order",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🔥 Firebase එකෙන් එන values ගන්නවා (නැත්නම් default values වැටෙනවා)
    String itemBrand = partData['brand'] ?? "Toyota / Genuine";
    String stockStatus = partData['availability'] ?? "In Stock";
    bool isInStock = stockStatus.toLowerCase().contains('in stock') ||
        stockStatus.toLowerCase() == 'available';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Shop Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shopData['shopName'] ?? "Unknown Shop",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    partData['partName'] ?? "Spare Part",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    partData['price'] ?? "LKR 0.00",
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 🎯 NEW FEATURE: Brand සහ Stock Status එක ලස්සන Chips විදිහට පෙන්වන කොටස
            Row(
              children: [
                // Condition Chip (New/Used)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Condition: ${partData['condition'] ?? 'New'}",
                    style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),

                // Brand Chip
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Brand: $itemBrand",
                    style: TextStyle(
                        color: Colors.orange.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),

                // In Stock / Out of Stock Status Chip
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color:
                        isInStock ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: isInStock ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        stockStatus,
                        style: TextStyle(
                            color: isInStock
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1486006920555-c77dce18193b?q=80&w=600&auto=format&fit=cover'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "High quality ${partData['partName'] ?? 'part'} (${itemBrand}) suitable for your vehicle updates, sourced directly from trusted distributors. Status is currently $stockStatus.",
              style: const TextStyle(height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 25),
            const Text(
              "Location",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(shopData['location'] ?? "No Address Available",
                style: const TextStyle(color: Colors.black87)),
            const SizedBox(height: 15),
            InkWell(
              onTap: _openMap,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                        color: Colors.red.shade600, size: 40),
                    const SizedBox(height: 5),
                    const Text(
                      "Click below to open in Google Maps",
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openMap,
                icon: const Icon(Icons.directions, color: Colors.white),
                label: const Text("Get Directions",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _callSeller,
                    icon: const Icon(Icons.call, color: Colors.white),
                    label: const Text("Call Seller",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    // 🎯 සල්ලි බේරගන්න තව ලොජික් එකක්: බඩු Out of stock නම් ඕඩර් එකක් දාන්න දෙන්නෙ නෑ!
                    onPressed: isInStock
                        ? () => _showOrderConfirmationDialog(context)
                        : null,
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    label: Text(isInStock ? "Place Order" : "Out of Stock",
                        style: const TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isInStock
                          ? Colors.green
                          : Colors.grey, // බඩු නැත්නම් බටන් එක අළු පාට වෙනවා
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'order_success_screen.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> partData;
  final Map<String, dynamic> shopData;

  const ShopDetailsScreen({
    super.key,
    required this.partData,
    required this.shopData,
  });

  Future<void> _openMap() async {
    final String address = shopData['location'] ?? "Kandy, Sri Lanka";
    final String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}";
    final Uri url = Uri.parse(googleMapUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _callSeller() async {
    final String phone = shopData['phone'] ?? "";
    if (phone.isEmpty) return;
    final Uri callUrl = Uri.parse("tel:$phone");
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    }
  }

  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Icon(Icons.shopping_bag_outlined, color: Colors.green),
              SizedBox(width: 10),
              Text("Confirm Order",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Are you sure you want to place this order?",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item: ${partData['partName'] ?? 'Spare Part'}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Brand: ${partData['brand'] ?? 'Genuine'}",
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Price: ${partData['price'] ?? 'LKR 0.00'}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderSuccessScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Yes, Place Order",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String itemBrand = partData['brand'] ?? "Toyota / Genuine";
    String stockStatus =
        partData['status'] ?? partData['availability'] ?? "In Stock";
    bool isInStock = stockStatus.toLowerCase().contains('in stock') ||
        stockStatus.toLowerCase() == 'available';
    String condition = partData['condition'] ?? 'New';
    String partName = partData['partName'] ?? "Spare Part";
    String price = partData['price'] ?? "LKR 0.00";
    String shopName = shopData['shopName'] ?? "Unknown Shop";
    String location = shopData['location'] ?? "No Location";

    // Status color
    Color statusColor = Colors.green;
    if (stockStatus == 'Low Stock') statusColor = Colors.orange;
    if (stockStatus == 'Out of Stock') statusColor = Colors.red;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Shop Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shop Name
            Text(
              shopName,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            // ✅ Part Name + Price — overflow fix
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    partName,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                const SizedBox(width: 10),
                // ✅ Price chip — fixed width + no overflow
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Text(
                    price,
                    style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ✅ Condition + Brand + Status chips — Wrap use කළා overflow නෑ
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChip("Condition: $condition", Colors.blue),
                _buildChip("Brand: $itemBrand", Colors.orange),
                _buildStatusChip(stockStatus, statusColor),
              ],
            ),
            const SizedBox(height: 20),

            // ✅ Part Image — Firebase image නැත්නම් category based placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _buildPartImage(partData),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Shop Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                children: [
                  // ✅ Shop image/avatar
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B4F72),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        const Icon(Icons.store, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shopName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF1B4F72)),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                location,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: List.generate(
                              5,
                              (i) => Icon(Icons.star,
                                  size: 14,
                                  color: i < 4 ? Colors.orange : Colors.grey)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description
            const Text("Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              "High quality $partName ($itemBrand) suitable for your vehicle. "
              "Sourced directly from trusted distributors. "
              "Status is currently $stockStatus.",
              style: const TextStyle(height: 1.6, color: Colors.black87),
            ),
            const SizedBox(height: 25),

            // Location
            const Text("Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red.shade400, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(location,
                      style: const TextStyle(color: Colors.black87)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Map Preview
            InkWell(
              onTap: _openMap,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                        color: Colors.red.shade600, size: 40),
                    const SizedBox(height: 5),
                    const Text(
                      "Click to open in Google Maps",
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Get Directions button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openMap,
                icon: const Icon(Icons.directions, color: Colors.white),
                label: const Text("Get Directions",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Call + Order buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _callSeller,
                    icon: const Icon(Icons.call, color: Colors.white),
                    label: const Text("Call Seller",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: isInStock
                        ? () => _showOrderConfirmationDialog(context)
                        : null,
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    label: Text(isInStock ? "Place Order" : "Out of Stock",
                        style: const TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isInStock ? Colors.green : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ✅ Part image — Firebase imageUrl field use කරනවා, නැත්නම් category icon
  Widget _buildPartImage(Map<String, dynamic> partData) {
    final String? imageUrl = partData['imageUrl'];
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _buildPartPlaceholder(partData),
      );
    }
    return _buildPartPlaceholder(partData);
  }

  Widget _buildPartPlaceholder(Map<String, dynamic> partData) {
    final String category =
        (partData['category'] ?? '').toString().toUpperCase();

    // Category based icon
    IconData icon = Icons.settings;
    Color iconColor = Colors.blueGrey;

    if (category.contains('BRAKE')) {
      icon = Icons.radio_button_checked;
      iconColor = Colors.red;
    } else if (category.contains('ENGINE') || category.contains('CYLINDER')) {
      icon = Icons.engineering;
      iconColor = Colors.orange;
    } else if (category.contains('BATTERY')) {
      icon = Icons.battery_charging_full;
      iconColor = Colors.green;
    } else if (category.contains('LIGHT')) {
      icon = Icons.lightbulb;
      iconColor = Colors.amber;
    } else if (category.contains('COMPRESSOR') || category.contains('AIR')) {
      icon = Icons.ac_unit;
      iconColor = Colors.blue;
    } else if (category.contains('RADIATOR') || category.contains('COOLING')) {
      icon = Icons.thermostat;
      iconColor = Colors.teal;
    } else if (category.contains('FILTER')) {
      icon = Icons.filter_alt;
      iconColor = Colors.brown;
    }

    return Container(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: iconColor.withOpacity(0.6)),
          const SizedBox(height: 10),
          Text(
            category.isNotEmpty ? category : 'AUTO PART',
            style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // ✅ Chip helper widgets
  Widget _buildChip(String label, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.shade200),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: color.shade800, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildStatusChip(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 4, backgroundColor: color),
          const SizedBox(width: 5),
          Text(
            status,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
