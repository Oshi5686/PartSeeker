import 'package:flutter/material.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  int _selectedIndex = 0;

  final List<String> _menuItems = [
    'Dashboard',
    'Inventory',
    'Add Listing',
    'Messages',
    'Pickup Requests',
    'Shop Profile',
    'Settings',
  ];

  final List<IconData> _menuIcons = [
    Icons.dashboard,
    Icons.inventory_2,
    Icons.add_circle_outline,
    Icons.message,
    Icons.local_shipping,
    Icons.store,
    Icons.settings,
  ];

  // Colors from Figma
  static const Color primaryBlue = Color(0xFF0D3178);
  /*static const Color accentBlue = Color(0xFF0F3B66);*/
  static const Color lightGrey = Color(0xFFD9D9D9);
  static const Color cardBorder = Color(0xFF638CE5);
  static const Color bgColor = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          // ===== LEFT SIDEBAR =====
          Container(
            width: 220,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.settings,
                            color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'PartSeeker',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                const SizedBox(height: 8),

                // Menu Items
                Expanded(
                  child: ListView.builder(
                    itemCount: _menuItems.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedIndex = index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 3),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? primaryBlue : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _menuIcons[index],
                                size: 20,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _menuItems[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Logout
                const Divider(height: 1),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: Colors.grey[600]),
                        const SizedBox(width: 12),
                        Text('Logout',
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 14)),
                      ],
                    ),
                  ),
                ),

                // Version
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: Text('2026 Partseeker Seller',
                      style: TextStyle(fontSize: 11, color: Colors.grey[400])),
                ),
              ],
            ),
          ),

          // ===== MAIN CONTENT =====
          Expanded(
            child: Column(
              children: [
                // TOP NAVBAR
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Row(
                    children: [
                      // Search bar
                      Expanded(
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F2F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search parts, customer..',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 14),
                              prefixIcon: Icon(Icons.search,
                                  color: Colors.grey[400], size: 20),
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Notification
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F2F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                            const Icon(Icons.notifications_outlined, size: 22),
                      ),
                      const SizedBox(width: 16),

                      // User info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Hill Country Auto Mart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('Garage Owner',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: lightGrey,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome + Add New Part Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Welcome back, Hill Country Auto Mart',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  'Your shop is performing well today. You have 12 pending inquiries that need your attention.',
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 13),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.white),
                              label: const Text('Add New Part',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryBlue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // STAT CARDS
                        Row(
                          children: [
                            _statCard('Total Listings', '48', cardBorder),
                            const SizedBox(width: 14),
                            _statCard('Low Stock Items', '7', Colors.orange),
                            const SizedBox(width: 14),
                            _statCard('Out of Stock', '3', Colors.red),
                            const SizedBox(width: 14),
                            _statCard('New Inquiries', '12', Colors.green),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // BOTTOM TWO COLUMNS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // LEFT — Recent Listings + Tip + Pickup Schedule
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  // Recent Listings
                                  _sectionCard(
                                    title: 'Recent Listings',
                                    subtitle:
                                        'Review and manage your most recent inventory updates.',
                                    action: 'View All →',
                                    child: Column(
                                      children: [
                                        _listingHeader(),
                                        _listingRow(
                                            'Brake Rotor - Front Left',
                                            'Braking System',
                                            '\$85.00',
                                            'In Stock',
                                            Colors.green),
                                        _listingRow(
                                            'Bosch S4 Battery',
                                            'Electrical',
                                            '\$120.00',
                                            'Low Stock',
                                            Colors.orange),
                                        _listingRow(
                                            'LED Headlight Assembly',
                                            'Lighting',
                                            '\$210.00',
                                            'Out of Stock',
                                            Colors.red),
                                        _listingRow(
                                            'Air Filter - Performance',
                                            'Intake',
                                            '\$45.00',
                                            'In Stock',
                                            Colors.green),
                                        _listingRow(
                                            'Radiator Fan Motor',
                                            'Cooling',
                                            '\$135.00',
                                            'In Stock',
                                            Colors.green),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Pro Tip
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEAF0FB),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: cardBorder.withOpacity(0.3)),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.lightbulb_outline,
                                            color: primaryBlue, size: 20),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  'Pro Tip: Inventory Management',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13)),
                                              Text(
                                                'Items listed with clear, high-resolution photos sell 45% faster. Consider updating the images for your low Stock items.',
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Pickup Schedule
                                  _sectionCard(
                                    title: 'Pickup Schedule',
                                    child: Column(
                                      children: [
                                        _pickupRow(
                                            'David Ma', 'Colombo', 'Pending'),
                                        _pickupRow('Fiona Albert', 'Kandy',
                                            'Confirmed'),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                              'See Full Schedule →',
                                              style: TextStyle(
                                                  color: primaryBlue,
                                                  fontSize: 13)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),

                            // RIGHT — Customer Inquiries
                            Expanded(
                              flex: 2,
                              child: _sectionCard(
                                title: 'Customer Inquiries',
                                action: '2 New',
                                child: Column(
                                  children: [
                                    _inquiryCard(
                                        'W. M Bandara',
                                        'Re: Brake Rotor',
                                        '"Is this brake rotor available for pickup tomorrow?"',
                                        '12M Ago'),
                                    const SizedBox(height: 12),
                                    _inquiryCard(
                                        'Akash Perera',
                                        'Re: Battery',
                                        '"What is the warranty period for this unit?"',
                                        '3H Ago'),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Colors.grey[300]!),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14),
                                        ),
                                        child: const Text(
                                            'Manage All Inquiries',
                                            style: TextStyle(
                                                color: Colors.black87)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // FOOTER
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('2026 PartSeeker Seller Dashboard',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Row(
                        children: ['Privacy Policy', 'Term & Condition', 'Help']
                            .map((t) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(t,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          );
                        }).toList(),
                      ),
                      const Text('version 1.0.0',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===== HELPER WIDGETS =====

  Widget _statCard(String title, String value, Color borderColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    String? subtitle,
    String? action,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              if (action != null)
                Text(action,
                    style: const TextStyle(color: primaryBlue, fontSize: 13)),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(color: Colors.grey[500], fontSize: 12)),
          ],
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _listingHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children:
            ['Part Name', 'Category', 'Price', 'Status', 'Action'].map((h) {
          return Expanded(
            child: Text(h,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500])),
          );
        }).toList(),
      ),
    );
  }

  Widget _listingRow(
      String name, String cat, String price, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
              child: Row(children: [
            Container(
                width: 30,
                height: 30,
                color: Colors.grey[200],
                child: const Icon(Icons.image, size: 16, color: Colors.grey)),
            const SizedBox(width: 8),
            Expanded(child: Text(name, style: const TextStyle(fontSize: 13))),
          ])),
          Expanded(
              child: Text(cat,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]))),
          Expanded(child: Text(price, style: const TextStyle(fontSize: 13))),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status,
                style: TextStyle(
                    color: statusColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold)),
          )),
          Expanded(child: Icon(Icons.more_horiz, color: Colors.grey[400])),
        ],
      ),
    );
  }

  Widget _pickupRow(String name, String location, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.person, size: 16, color: Colors.grey)),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
              Text(location,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500])),
            ],
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: status == 'Confirmed'
                  ? Colors.green.withOpacity(0.1)
                  : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: status == 'Confirmed' ? Colors.green : Colors.orange,
                )),
          ),
        ],
      ),
    );
  }

  Widget _inquiryCard(
      String name, String subject, String message, String time) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(time,
                        style:
                            TextStyle(fontSize: 11, color: Colors.grey[400])),
                  ],
                ),
                Text(subject,
                    style: const TextStyle(
                        color: primaryBlue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(message,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
