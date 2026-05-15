import 'package:flutter/material.dart';

class PickupRequestsPage extends StatelessWidget {
  const PickupRequestsPage({super.key});

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
              "Pickup Requests",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // ඉහළින් ඇති Summary Cards
            Row(
              children: [
                _buildStatCard("Total Reservations", "5", Colors.black),
                _buildStatCard("Pending", "2", Colors.orange),
                _buildStatCard("Accepted", "1", Colors.blue),
                _buildStatCard("Completed", "1", Colors.green),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // All Reservations Table Container
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("All Reservations", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      DropdownButton<String>(
                        value: "All Status",
                        items: ["All Status", "Pending", "Accepted"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Table Header
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(2),
                      4: FlexColumnWidth(1.5),
                      5: FlexColumnWidth(1.5),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        children: [
                          _tableHeader("Reservation ID"),
                          _tableHeader("Part"),
                          _tableHeader("Qty"),
                          _tableHeader("Buyer"),
                          _tableHeader("Status"),
                          _tableHeader("Actions"),
                        ],
                      ),
                      // Data Rows
                      _buildDataRow("#RES1", "Premium Ceramic Brake Pads", "2", "Ruwan Kumara", "Pending", true),
                      _buildDataRow("#RES2", "Genuine Oil Filter - Toyota", "1", "Chaminda Perera", "Pending", true),
                      _buildDataRow("#RES3", "Gates Timing Belt Kit", "1", "Saman Jayasuriya", "Accepted", false),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 10),
              Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  TableRow _buildDataRow(String id, String part, String qty, String buyer, String status, bool showButtons) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(12.0), child: Text(id, style: const TextStyle(color: Colors.blue))),
        Padding(padding: const EdgeInsets.all(12.0), child: Text(part)),
        Padding(padding: const EdgeInsets.all(12.0), child: Text(qty)),
        Padding(padding: const EdgeInsets.all(12.0), child: Text(buyer)),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Pending" ? Colors.orange[50] : Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status, style: TextStyle(color: status == "Pending" ? Colors.orange : Colors.blue, fontSize: 12)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: showButtons 
            ? Row(
                children: [
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.symmetric(horizontal: 8)),
                    child: const Text("Accept", style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
                  const SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.symmetric(horizontal: 8)),
                    child: const Text("Reject", style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Mark Completed", style: TextStyle(fontSize: 11, color: Colors.white)),
              ),
        ),
      ],
    );
  }
}