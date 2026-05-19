import 'package:flutter/material.dart';

class ShopProfilePage extends StatelessWidget {
  const ShopProfilePage({super.key, String? sellerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Shop Profile",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // වම් පැත්තේ Profile Form එක
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _buildProfileSection("Shop Information", [
                        Row(
                          children: [
                            Expanded(child: _buildField("Shop Name", "Malabe Auto Spares")),
                            const SizedBox(width: 20),
                            Expanded(child: _buildField("Owner Name", "Sunil Rathnayake")),
                          ],
                        ),
                        const SizedBox(height: 15),
                        _buildField("Shop Description", "Trusted supplier of genuine auto spare parts...", maxLines: 3),
                      ]),
                      const SizedBox(height: 20),
                      _buildProfileSection("Contact Information", [
                        Row(
                          children: [
                            Expanded(child: _buildField("Email Address", "malabe.autospares@gmail.com", icon: Icons.email_outlined)),
                            const SizedBox(width: 20),
                            Expanded(child: _buildField("Phone Number", "+94 77 123 4567", icon: Icons.phone_outlined)),
                          ],
                        ),
                      ]),
                      const SizedBox(height: 20),
                      _buildProfileSection("Shop Address", [
                        _buildField("Street Address", "No. 45, Kaduwela Road"),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(child: _buildField("City", "Malabe")),
                            const SizedBox(width: 20),
                            Expanded(child: _buildDropdownField("District", "Colombo")),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                // දකුණු පැත්තේ Preview Card එක සහ Save Button එක
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // Shop Preview Card
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Shop Preview", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 15),
                              const Center(
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.blueAccent,
                                  child: Icon(Icons.store, color: Colors.white, size: 40),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Center(
                                child: Text("Malabe Auto Spares", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              ),
                              const Center(
                                child: Text("Sunil Rathnayake", style: TextStyle(color: Colors.grey)),
                              ),
                              const Divider(height: 30),
                              _buildPreviewDetail(Icons.location_on_outlined, "No. 45, Kaduwela Road, Malabe"),
                              _buildPreviewDetail(Icons.phone_outlined, "+94 77 123 4567"),
                              _buildPreviewDetail(Icons.email_outlined, "malabe.autospares@gmail.com"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A73E8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("Save Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(title.contains("Shop") ? Icons.storefront : title.contains("Contact") ? Icons.contact_mail : Icons.location_on, size: 20, color: Colors.blue),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 15),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String initialValue, {IconData? icon, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, size: 20) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: [value].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewDetail(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700]))),
        ],
      ),
    );
  }
}