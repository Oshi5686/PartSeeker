/*import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  // Figma එකේ තියෙන විදියටම Data ටික මෙතන තියෙනවා
  final List<Map<String, dynamic>> inventoryItems = [
    {
      "label": "Brake Pad",
      "name": "Premium Ceramic Brake Pads - Front",
      "category": "Brake System",
      "price": "4,500",
      "stock": "25 in stock",
      "statusColor": Colors.green,
      "updated": "28 Mar"
    },
    {
      "label": "Oil Filter",
      "name": "Genuine Oil Filter - Toyota",
      "category": "Filters",
      "price": "850",
      "stock": "Low: 3",
      "statusColor": Colors.orange,
      "updated": "27 Mar"
    },
    {
      "label": "Shock Absorber",
      "name": "KYB Gas Shock Absorber - Rear",
      "category": "Suspension",
      "price": "12,500",
      "stock": "Out of Stock",
      "statusColor": Colors.red,
      "updated": "26 Mar"
    },
    {
      "label": "Alternator",
      "name": "Rebuilt Alternator 80A",
      "category": "Electrical",
      "price": "18,500",
      "stock": "8 in stock",
      "statusColor": Colors.green,
      "updated": "25 Mar"
    },
    {
      "label": "Timing Belt",
      "name": "Gates Timing Belt Kit",
      "category": "Engine Parts",
      "price": "8,900",
      "stock": "Low: 2",
      "statusColor": Colors.orange,
      "updated": "24 Mar"
    },
    {
      "label": "Radiator",
      "name": "Aluminum Radiator - Manual",
      "category": "Cooling System",
      "price": "22,000",
      "stock": "Low: 4",
      "statusColor": Colors.orange,
      "updated": "23 Mar"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section (Figma එකේ උඩ තියෙන කොටස)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Inventory", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download),
                  label: Text("Export CSV"),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Add New Part"),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A3D7C), foregroundColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),

        // Search & Filter Box
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search by part name or label...",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(width: 10),
              _buildDropdown("All Categories"),
              SizedBox(width: 10),
              _buildDropdown("All Stock"),
            ],
          ),
        ),
        SizedBox(height: 25),

        // Inventory Table
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Part Label', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Display Name', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Category', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Price (LKR)', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Stock', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: inventoryItems.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item['label'], style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500))),
                    DataCell(Text(item['name'])),
                    DataCell(Chip(label: Text(item['category'], style: TextStyle(fontSize: 12)), backgroundColor: Colors.grey.shade100)),
                    DataCell(Text(item['price'])),
                    DataCell(Text(item['stock'], style: TextStyle(color: item['statusColor'], fontWeight: FontWeight.bold))),
                    DataCell(Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit, size: 20), onPressed: () {}),
                        IconButton(icon: Icon(Icons.delete, size: 20, color: Colors.red), onPressed: () {}),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        underline: SizedBox(),
        hint: Text(hint),
        items: [],
        onChanged: (value) {},
      ),
    );
  }
}*/

