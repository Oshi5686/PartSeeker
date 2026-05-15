import 'package:flutter/material.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Listing",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Add a new spare part to your inventory",
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // වම් පැත්තේ Form එක
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildSectionCard("Basic Information", [
                      Row(
                        children: [
                          Expanded(
                              child: _buildTextField(
                                  "Part Label", "Select part type",
                                  isDropdown: true)),
                          SizedBox(width: 20),
                          Expanded(
                              child: _buildTextField(
                                  "Category", "Select category",
                                  isDropdown: true)),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildTextField("Display Name",
                          "e.g., Premium Ceramic Brake Pads - Front"),
                      SizedBox(height: 20),
                      _buildTextField("Description",
                          "Describe the part, its features, and condition...",
                          maxLines: 4),
                    ]),
                    SizedBox(height: 20),
                    _buildSectionCard("Compatible Models", [
                      Wrap(
                        spacing: 40,
                        children: [
                          _buildCheckbox("Toyota Corolla"),
                          _buildCheckbox("Toyota Vitz"),
                          _buildCheckbox("Toyota Axio"),
                          _buildCheckbox("Toyota Premio"),
                          _buildCheckbox("Honda Fit"),
                          _buildCheckbox("Honda Civic"),
                        ],
                      ),
                    ]),
                    SizedBox(height: 20),
                    _buildSectionCard("Pricing & Stock", [
                      Row(
                        children: [
                          Expanded(child: _buildTextField("Price (LKR)", "0")),
                          SizedBox(width: 20),
                          Expanded(
                              child: _buildTextField("Stock Quantity", "0")),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(width: 30),

              // දකුණු පැත්තේ Image Upload සහ Buttons
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file, size: 50, color: Colors.grey),
                          SizedBox(height: 10),
                          Text("Upload Image",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("PNG, JPG up to 5MB",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildActionButton(
                        "Publish Listing", Color(0xFF1A3D7C), Colors.white),
                    SizedBox(height: 10),
                    _buildActionButton(
                        "Save", Colors.grey.shade200, Colors.black),
                    SizedBox(height: 10),
                    _buildActionButton(
                        "Cancel", Colors.grey.shade300, Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool isDropdown = false, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: isDropdown ? Icon(Icons.arrow_drop_down) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: false, onChanged: (v) {}),
        Text(label, style: TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildActionButton(String label, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
