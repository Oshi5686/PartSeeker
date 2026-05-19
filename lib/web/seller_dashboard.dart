/*import 'package:flutter/material.dart';

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
}*/

/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'inventory_page.dart'; // 🎯 Inventory Page එක හරියටම Import කරගන්න

class SellerDashboardPage extends StatefulWidget {
  final String sellerId; // Auth පිටුවෙන් ලැබෙන Firebase Document ID එක

  const SellerDashboardPage({super.key, required this.sellerId});

  @override
  State<SellerDashboardPage> createState() => _SellerDashboardPageState();
}

class _SellerDashboardPageState extends State<SellerDashboardPage> {
  String _businessName = "Loading...";
  String _businessType = "Seller";
  bool _isDataLoading = true;

  // Add New Part Form Controllers
  final _formKey = GlobalKey<FormState>();
  final _partNameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  String _partStatus = 'In Stock';

  @override
  void initState() {
    super.initState();
    _fetchSellerData();
  }

  // 🎯 Firebase එකෙන් දැනට ලොග් වුණු Seller ගේ නම සහ වර්ගය ලබා ගැනීම
  Future<void> _fetchSellerData() async {
    try {
      // 💡 විසඳුම: .document() වෙනුවට .doc() ලෙස වෙනස් කරන ලදී
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('sellers')
          .doc(widget.sellerId)
          .get(); // .get() එකත් මෙතනට අනිවාර්යයි දත්ත කියවන්න

      if (doc.exists && mounted) {
        setState(() {
          _businessName = doc.get('businessName') ?? 'Unknown Shop';
          _businessType = doc.get('businessType') ?? 'Seller';
          _isDataLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _businessName = "Error Loading";
          _isDataLoading = false;
        });
      }
    }
  }

  // 🎯 "Add New Part" Popup එක හරහා දත්ත Firebase 'parts' Collection එකට දැමීම
  Future<void> _addNewPartToFirebase() async {
    if (!_formKey.currentState!.validate()) return;

    // Loading එකක් පෙන්වන්න කලින් Popup එක වහනවා
    Navigator.of(context).pop();
    
    try {
      await FirebaseFirestore.instance.collection('parts').add({
        'sellerId': widget.sellerId,
        'partName': _partNameController.text.trim(),
        'category': _categoryController.text.trim(),
        'price': double.tryParse(_priceController.text.trim()) ?? 0.0,
        'quantity': int.tryParse(_quantityController.text.trim()) ?? 0,
        'status': _partStatus,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New part added successfully!'), backgroundColor: Colors.green),
        );
      }

      // Controllers Clear කිරීම
      _partNameController.clear();
      _categoryController.clear();
      _priceController.clear();
      _quantityController.clear();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add part: $e'), backgroundColor: Colors.redAccent),
        );
      }
    }
  }

  // 🎯 Figma එකේ විදිහට "Add New Part" Dialog Form එක
  void _showAddNewPartDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Add New Spare Part', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D3178))),
          content: SizedBox(
            width: 450,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPopupField('Part Name', _partNameController, 'e.g Brake Rotor - Front Left'),
                    const SizedBox(height: 14),
                    _buildPopupField('Category', _categoryController, 'e.g Braking System / Electrical'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(child: _buildPopupField('Price (LKR)', _priceController, 'e.g 8500', isNumber: true)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildPopupField('Quantity', _quantityController, 'e.g 5', isNumber: true)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('Status', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _partStatus,
                      decoration: _popupInputDecoration(''),
                      items: ['In Stock', 'Low Stock', 'Out of Stock'].map((String val) {
                        return DropdownMenuItem<String>(value: val, child: Text(val));
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _partStatus = value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
            ),
            ElevatedButton(
              onPressed: _addNewPartToFirebase,
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D3178), foregroundColor: Colors.white),
              child: const Text('Add Part'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Row(
        children: [
          // 1. Sidebar Panel
          _buildSidebar(),

          // 2. Main Content Dashboard
          Expanded(
            child: Column(
              children: [
                _buildTopAppBar(),
                Expanded(
                  child: _isDataLoading
                      ? const Center(child: CircularProgressIndicator(color: Color(0xFF0D3178)))
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildWelcomeSection(),
                              const SizedBox(height: 24),
                              _buildSummaryStatsGrid(),
                              const SizedBox(height: 28),
                              _buildBottomRowGrid(),
                            ],
                          ),
                        ),
                ),
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 260,
      color: const Color(0xFF0D3178),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Image.asset('assets/images/logo.png', width: 32, height: 32, errorBuilder: (c, e, s) => const Icon(Icons.settings, color: Colors.white)),
                const SizedBox(width: 10),
                const Text('PartSeeker', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _sidebarItem(Icons.dashboard, 'Dashboard', isActive: true, onTap: () {}),
          _sidebarItem(Icons.inventory, 'Inventory', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryPage()));
          }),
          _sidebarItem(Icons.add_box, 'Add Listing', onTap: _showAddNewPartDialog),
          _sidebarItem(Icons.message, 'Messages', onTap: () {}),
          _sidebarItem(Icons.local_shipping, 'Pickup Requests', onTap: () {}),
          _sidebarItem(Icons.store, 'Shop Profile', onTap: () {}),
          _sidebarItem(Icons.settings, 'Settings', onTap: () {}),
          const Spacer(),
          _sidebarItem(Icons.logout, 'Logout', color: Colors.white70, onTap: () => Navigator.of(context).pop()),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title, {bool isActive = false, Color? color, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        leading: Icon(icon, color: color ?? (isActive ? Colors.orange : Colors.white70), size: 20),
        title: Text(title, style: TextStyle(color: color ?? Colors.white, fontSize: 14, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search parts, customer..',
                prefixIcon: Icon(Icons.search, size: 20, color: Colors.black45),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.black70)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_businessName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                  Text(_businessType, style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(width: 12),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF0D3178),
                child: Icon(Icons.person, color: Colors.white, size: 18),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back, $_businessName', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF111111))),
            const SizedBox(height: 4),
            const Text('Your shop is performing well today. You have 12 pending inquiries that need your attention.', style: TextStyle(color: Colors.black54, fontSize: 13)),
          ],
        ),
        ElevatedButton.icon(
          onPressed: _showAddNewPartDialog,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0D3178),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Add New Part', style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _buildSummaryStatsGrid() {
    return Row(
      children: [
        Expanded(child: _statCard('Total Listings', '48', Colors.blue.shade700)),
        const SizedBox(width: 16),
        Expanded(child: _statCard('Low Stock Items', '7', Colors.orange.shade700)),
        const SizedBox(width: 16),
        Expanded(child: _statCard('Out of Stock', '3', Colors.red.shade700)),
        const SizedBox(width: 16),
        Expanded(child: _statCard('New Inquiries', '12', Colors.green.shade700)),
      ],
    );
  }

  Widget _statCard(String title, String count, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Text(count, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildBottomRowGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildRecentListingsTable()),
        const SizedBox(width: 20),
        Expanded(flex: 4, child: _buildCustomerInquiriesPanel()),
      ],
    );
  }

  Widget _buildRecentListingsTable() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Listings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(color: Color(0xFF0D3178)))),
            ],
          ),
          const SizedBox(height: 10),
          Table(
            columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(2), 2: FlexColumnWidth(2), 3: FlexColumnWidth(1.5)},
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey.shade50),
                children: const [
                  Padding(padding: EdgeInsets.all(10), child: Text('Part Name', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Price', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Status', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                ],
              ),
              _tableRow('Brake Rotor - Front Left', 'Braking System', 'LKR 85.00', 'In Stock', Colors.green),
              _tableRow('Bosch S4 Battery', 'Electrical', 'LKR 120.00', 'Low Stock', Colors.orange),
              _tableRow('LED Headlight Assembly', 'Lighting', 'LKR 210.00', 'Out of Stock', Colors.red),
            ],
          )
        ],
      ),
    );
  }

  TableRow _tableRow(String name, String cat, String price, String status, Color statusColor) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(12), child: Text(name, style: const TextStyle(fontSize: 13))),
        Padding(padding: const EdgeInsets.all(12), child: Text(cat, style: const TextStyle(fontSize: 13, color: Colors.black54))),
        Padding(padding: const EdgeInsets.all(12), child: Text(price, style: const TextStyle(fontSize: 13))),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: statusColor)),
        ),
      ],
    );
  }

  Widget _buildCustomerInquiriesPanel() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Customer Inquiries', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
                child: const Text('2 New', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              )
            ],
          ),
          const SizedBox(height: 16),
          _inquiryTile('W. M Bandara', 'Re: Brake Rotor', '"Is this brake rotor available for pickup tomorrow?"', '12M Ago'),
          const Divider(),
          _inquiryTile('Akash Perera', 'Re: Battery', '"What is the warranty period for this unit?"', '3H Ago'),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade300)),
              child: const Text('Manage All Inquiries', style: TextStyle(color: Colors.black87)),
            ),
          )
        ],
      ),
    );
  }

  Widget _inquiryTile(String user, String topic, String msg, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 16, backgroundColor: Colors.black12, child: Icon(Icons.person, size: 16, color: Colors.black54)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(user, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(time, style: const TextStyle(fontSize: 11, color: Colors.black38)),
                  ],
                ),
                Text(topic, style: const TextStyle(color: Color(0xFF0D3178), fontWeight: FontWeight.w600, fontSize: 12)),
                const SizedBox(height: 2),
                Text(msg, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: Colors.black54, style: FontStyle.italic)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      border: Border(top: BorderSide(color: Colors.grey.shade200)),
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('2026 Partseeker Seller Dashboard', style: TextStyle(fontSize: 12, color: Colors.black54)),
          Text('version 1.0.0', style: TextStyle(fontSize: 12, color: Colors.black45)),
        ],
      ),
    );
  }

  Widget _buildPopupField(String label, TextEditingController controller, String hint, {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: _popupInputDecoration(hint),
          validator: (value) => value == null || value.trim().isEmpty ? 'Required field' : null,
        ),
      ],
    );
  }

  InputDecoration _popupInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF0D3178))),
    );
  }
}*/
/*import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.settings, color: Colors.white, size: 20),
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
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? primaryBlue : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _menuIcons[index],
                                size: 20,
                                color: isSelected ? Colors.white : Colors.grey[600],
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _menuItems[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? Colors.white : Colors.grey[800],
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
                  onTap: () {
                    // මෙතැනදී Auth Page එකට ආපසු යාමට සකසන්න
                    Navigator.pop(context); 
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: Colors.grey[600]),
                        const SizedBox(width: 12),
                        Text('Logout', style: TextStyle(color: Colors.grey[800], fontSize: 14)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Row(
                    children: [
                      // Dynamic Title based on selection (පිටුවේ නම වැටෙන කොටස)
                      Text(
                        _menuItems[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 20),
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
                              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                              prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 12),
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
                        child: const Icon(Icons.notifications_outlined, size: 22),
                      ),
                      const SizedBox(width: 16),

                      // User info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Hill Country Auto Mart',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('Garage Owner',
                              style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: lightGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT (තෝරාගන්නා පිටුව අනුව වෙනස් වන කොටස)
                Expanded(
                  child: _buildBodyContent(),
                ),

                // FOOTER
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('2026 PartSeeker Seller Dashboard',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Row(
                        children: ['Privacy Policy', 'Term & Condition', 'Help'].map((t) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(t, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          );
                        }).toList(),
                      ),
                      const Text('version 1.0.0', style: TextStyle(fontSize: 12, color: Colors.grey)),
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

  // පිටු අතර මාරු වන ශ්‍රිතය (Switch Views)
  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardView();
      case 1:
        return _buildInventoryView();
      case 2:
        return _buildAddListingView();
      default:
        return Center(
          child: Text(
            '${_menuItems[_selectedIndex]} Page Coming Soon...',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
    }
  }

  // 1. DASHBOARD VIEW
  Widget _buildDashboardView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome back, Hill Country Auto Mart',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    'Your shop is performing well today. You have 12 pending inquiries that need your attention.',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2; // Add Listing පිටුවට මාරු වේ
                  });
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add New Part', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _sectionCard(
                      title: 'Recent Listings',
                      subtitle: 'Review and manage your most recent inventory updates.',
                      action: 'View All →',
                      child: Column(
                        children: [
                          _listingHeader(),
                          _listingRow('Brake Rotor - Front Left', 'Braking System', '\$85.00', 'In Stock', Colors.green),
                          _listingRow('Bosch S4 Battery', 'Electrical', '\$120.00', 'Low Stock', Colors.orange),
                          _listingRow('LED Headlight Assembly', 'Lighting', '\$210.00', 'Out of Stock', Colors.red),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF0FB),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cardBorder.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_outline, color: primaryBlue, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pro Tip: Inventory Management',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                Text(
                                  'Items listed with clear, high-resolution photos sell 45% faster. Consider updating the images for your low Stock items.',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: _sectionCard(
                  title: 'Customer Inquiries',
                  action: '2 New',
                  child: Column(
                    children: [
                      _inquiryCard('W. M Bandara', 'Re: Brake Rotor', '"Is this brake rotor available for pickup tomorrow?"', '12M Ago'),
                      const SizedBox(height: 12),
                      _inquiryCard('Akash Perera', 'Re: Battery', '"What is the warranty period for this unit?"', '3H Ago'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. INVENTORY VIEW
  Widget _buildInventoryView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'All Inventory Items',
        subtitle: 'Manage and update your stock availability and pricing.',
        child: Column(
          children: [
            _listingHeader(),
            _listingRow('Brake Rotor - Front Left', 'Braking System', '\$85.00', 'In Stock', Colors.green),
            _listingRow('Bosch S4 Battery', 'Electrical', '\$120.00', 'Low Stock', Colors.orange),
            _listingRow('LED Headlight Assembly', 'Lighting', '\$210.00', 'Out of Stock', Colors.red),
            _listingRow('Air Filter - Performance', 'Intake', '\$45.00', 'In Stock', Colors.green),
            _listingRow('Radiator Fan Motor', 'Cooling', '\$135.00', 'In Stock', Colors.green),
          ],
        ),
      ),
    );
  }

  // 3. ADD LISTING VIEW (Figma UI එකට ගැලපෙන Form එක)
  Widget _buildAddListingView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'Create New Part Listing',
        subtitle: 'Fill in the details below to add a new product to your shop.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Part Name', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'e.g., Toyota Corolla Brake Pad',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: ['Braking System', 'Electrical', 'Lighting', 'Engine']
                            .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                            .toList(),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price (\$)', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          hintText: '0.00',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // Listing එකක් Add වූ පසු නැවත Inventory වෙත යාමට
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Part Added Successfully!')),
                  );
                  setState(() {
                    _selectedIndex = 1; // Inventory පිටුවට මාරු වේ
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryBlue),
                child: const Text('Publish Listing', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
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
            Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87)),
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              if (action != null) Text(action, style: const TextStyle(color: primaryBlue, fontSize: 13)),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
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
        children: ['Part Name', 'Category', 'Price', 'Status', 'Action'].map((h) {
          return Expanded(
            child: Text(h,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[500])),
          );
        }).toList(),
      ),
    );
  }

  Widget _listingRow(String name, String cat, String price, String status, Color statusColor) {
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
          Expanded(child: Text(cat, style: TextStyle(fontSize: 12, color: Colors.grey[600]))),
          Expanded(child: Text(price, style: const TextStyle(fontSize: 13))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(status,
                  style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(child: Icon(Icons.more_horiz, color: Colors.grey[400])),
        ],
      ),
    );
  }

  Widget _inquiryCard(String name, String subject, String message, String time) {
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
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(time, style: TextStyle(fontSize: 11, color: Colors.grey[400])),
                  ],
                ),
                Text(subject,
                    style: const TextStyle(color: primaryBlue, fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(message, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';

class SellerDashboard extends StatefulWidget {
  final String? sellerId; // ✅ Fix: sellerId parameter add කළා

  const SellerDashboard({super.key, this.sellerId}); // ✅ Fix: const constructor

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

  static const Color primaryBlue = Color(0xFF0D3178);
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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      Text(
                        _menuItems[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 20),
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
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: lightGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT
                Expanded(
                  child: _buildBodyContent(),
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

  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardView();
      case 1:
        return _buildInventoryView();
      case 2:
        return _buildAddListingView();
      default:
        return Center(
          child: Text(
            '${_menuItems[_selectedIndex]} Page Coming Soon...',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
    }
  }

  Widget _buildDashboardView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome back, Hill Country Auto Mart',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    'Your shop is performing well today. You have 12 pending inquiries.',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add New Part',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
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
                          _listingRow('Bosch S4 Battery', 'Electrical',
                              '\$120.00', 'Low Stock', Colors.orange),
                          _listingRow('LED Headlight Assembly', 'Lighting',
                              '\$210.00', 'Out of Stock', Colors.red),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF0FB),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cardBorder.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_outline,
                              color: primaryBlue, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pro Tip: Inventory Management',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                Text(
                                  'Items listed with clear photos sell 45% faster.',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'All Inventory Items',
        subtitle: 'Manage and update your stock availability and pricing.',
        child: Column(
          children: [
            _listingHeader(),
            _listingRow('Brake Rotor - Front Left', 'Braking System', '\$85.00',
                'In Stock', Colors.green),
            _listingRow('Bosch S4 Battery', 'Electrical', '\$120.00',
                'Low Stock', Colors.orange),
            _listingRow('LED Headlight Assembly', 'Lighting', '\$210.00',
                'Out of Stock', Colors.red),
            _listingRow('Air Filter - Performance', 'Intake', '\$45.00',
                'In Stock', Colors.green),
            _listingRow('Radiator Fan Motor', 'Cooling', '\$135.00', 'In Stock',
                Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildAddListingView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'Create New Part Listing',
        subtitle:
            'Fill in the details below to add a new product to your shop.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Part Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'e.g., Toyota Corolla Brake Pad',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: [
                          'Braking System',
                          'Electrical',
                          'Lighting',
                          'Engine'
                        ]
                            .map((label) => DropdownMenuItem(
                                value: label, child: Text(label)))
                            .toList(),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price (\$)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: '0.00',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Part Added Successfully!')),
                  );
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryBlue),
                child: const Text('Publish Listing',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            ),
          ),
          Expanded(child: Icon(Icons.more_horiz, color: Colors.grey[400])),
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
*/

/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellerDashboard extends StatefulWidget {
  final String? sellerId;

  const SellerDashboard({super.key, this.sellerId});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  int _selectedIndex = 0;

  // 🎯 Firebase එකෙන් load වෙන seller data
  String _businessName = 'Loading...';
  String _businessType = '';
  bool _isLoadingData = true;

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

  static const Color primaryBlue = Color(0xFF0D3178);
  static const Color lightGrey = Color(0xFFD9D9D9);
  static const Color cardBorder = Color(0xFF638CE5);
  static const Color bgColor = Color(0xFFF5F7FA);

  @override
  void initState() {
    super.initState();
    _loadSellerData(); // 🎯 Page open වෙනකොටම Firebase data load කරනවා
  }

  // 🎯 Firebase Firestore එකෙන් Seller Data Load කරන Function
  Future<void> _loadSellerData() async {
    if (widget.sellerId == null) {
      setState(() {
        _businessName = 'Unknown Seller';
        _businessType = '';
        _isLoadingData = false;
      });
      return;
    }

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('sellers')
          .doc(widget.sellerId)
          .get();

      if (doc.exists && mounted) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          _businessName = data['businessName'] ?? 'Unknown';
          _businessType = data['businessType'] ?? '';
          _isLoadingData = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _businessName = 'Error Loading';
          _businessType = '';
          _isLoadingData = false;
        });
      }
    }
  }

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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      Text(
                        _menuItems[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 20),
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

                      // 🎯 Firebase එකෙන් ආපු Seller Name සහ Business Type
                      _isLoadingData
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: primaryBlue),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _businessName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  _businessType,
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 12),
                                ),
                              ],
                            ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: lightGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT
                Expanded(child: _buildBodyContent()),

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

  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardView();
      case 1:
        return _buildInventoryView();
      case 2:
        return _buildAddListingView();
      default:
        return Center(
          child: Text(
            '${_menuItems[_selectedIndex]} Page Coming Soon...',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
    }
  }

  Widget _buildDashboardView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🎯 Firebase එකෙන් ආපු Business Name welcome message එකේ show කරනවා
                  Text(
                    'Welcome back, $_businessName',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your shop is performing well today. You have 12 pending inquiries.',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => setState(() => _selectedIndex = 2),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add New Part',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
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
                          _listingRow('Bosch S4 Battery', 'Electrical',
                              '\$120.00', 'Low Stock', Colors.orange),
                          _listingRow('LED Headlight Assembly', 'Lighting',
                              '\$210.00', 'Out of Stock', Colors.red),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF0FB),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cardBorder.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_outline,
                              color: primaryBlue, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pro Tip: Inventory Management',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                Text(
                                  'Items listed with clear photos sell 45% faster.',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'All Inventory Items',
        subtitle: 'Manage and update your stock availability and pricing.',
        child: Column(
          children: [
            _listingHeader(),
            _listingRow('Brake Rotor - Front Left', 'Braking System', '\$85.00',
                'In Stock', Colors.green),
            _listingRow('Bosch S4 Battery', 'Electrical', '\$120.00',
                'Low Stock', Colors.orange),
            _listingRow('LED Headlight Assembly', 'Lighting', '\$210.00',
                'Out of Stock', Colors.red),
            _listingRow('Air Filter - Performance', 'Intake', '\$45.00',
                'In Stock', Colors.green),
            _listingRow('Radiator Fan Motor', 'Cooling', '\$135.00', 'In Stock',
                Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildAddListingView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'Create New Part Listing',
        subtitle:
            'Fill in the details below to add a new product to your shop.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Part Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'e.g., Toyota Corolla Brake Pad',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: [
                          'Braking System',
                          'Electrical',
                          'Lighting',
                          'Engine'
                        ]
                            .map((label) => DropdownMenuItem(
                                value: label, child: Text(label)))
                            .toList(),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price (\$)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: '0.00',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Part Added Successfully!')),
                  );
                  setState(() => _selectedIndex = 1);
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryBlue),
                child: const Text('Publish Listing',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            ),
          ),
          Expanded(child: Icon(Icons.more_horiz, color: Colors.grey[400])),
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
*/

/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 🌟 ඔයා හදපු අලුත් Pages දෙක නිවැරදිව Import කරගත්තා:
import 'messages_page.dart';
import 'pickup_requests_page.dart';

class SellerDashboard extends StatefulWidget {
  final String? sellerId;

  const SellerDashboard({super.key, this.sellerId});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  int _selectedIndex = 0;

  // 🎯 Firebase එකෙන් load වෙන seller data
  String _businessName = 'Loading...';
  String _businessType = '';
  bool _isLoadingData = true;

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

  static const Color primaryBlue = Color(0xFF0D3178);
  static const Color lightGrey = Color(0xFFD9D9D9);
  static const Color cardBorder = Color(0xFF638CE5);
  static const Color bgColor = Color(0xFFF5F7FA);

  @override
  void initState() {
    super.initState();
    _loadSellerData(); // 🎯 Page open වෙනකොටම Firebase data load කරනවා
  }

  // 🎯 Firebase Firestore එකෙන් Seller Data Load කරන Function
  Future<void> _loadSellerData() async {
    if (widget.sellerId == null) {
      setState(() {
        _businessName = 'Unknown Seller';
        _businessType = '';
        _isLoadingData = false;
      });
      return;
    }

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('sellers')
          .doc(widget.sellerId)
          .get();

      if (doc.exists && mounted) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          _businessName = data['businessName'] ?? 'Unknown';
          _businessType = data['businessType'] ?? '';
          _isLoadingData = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _businessName = 'Error Loading';
          _businessType = '';
          _isLoadingData = false;
        });
      }
    }
  }

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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      Text(
                        _menuItems[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 20),
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

                      // 🎯 Firebase එකෙන් ආපු Seller Name සහ Business Type
                      _isLoadingData
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: primaryBlue),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _businessName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  _businessType,
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 12),
                                ),
                              ],
                            ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: lightGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT (මෙතනින් තමයි වෙනස් පිටු load වෙන්නේ)
                Expanded(child: _buildBodyContent()),

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

  // 🌟 පිටු සම්බන්ධ කරන ප්‍රධානම තැන (Updated!)
  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardView();
      case 1:
        return _buildInventoryView();
      case 2:
        return _buildAddListingView();
      case 3:
        return const MessagesPage(); // 🎯 Index 3 ක්ලික් වූ විට අලුත් Messages පිටුව පෙන්වයි
      case 4:
        return const PickupRequestsPage(); // 🎯 Index 4 ක්ලික් වූ විට අලුත් Pickup Requests පිටුව පෙන්වයි
      default:
        // තවමත් සාදා නොමැති පිටු (Shop Profile, Settings) සඳහා පමණක් මෙය ක්‍රියාත්මක වේ
        return Center(
          child: Text(
            '${_menuItems[_selectedIndex]} Page Coming Soon...',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
    }
  }

  Widget _buildDashboardView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, $_businessName',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your shop is performing well today. You have 12 pending inquiries.',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => setState(() => _selectedIndex = 2),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add New Part',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
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
                          _listingRow('Bosch S4 Battery', 'Electrical',
                              '\$120.00', 'Low Stock', Colors.orange),
                          _listingRow('LED Headlight Assembly', 'Lighting',
                              '\$210.00', 'Out of Stock', Colors.red),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF0FB),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cardBorder.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_outline,
                              color: primaryBlue, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pro Tip: Inventory Management',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                Text(
                                  'Items listed with clear photos sell 45% faster.',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'All Inventory Items',
        subtitle: 'Manage and update your stock availability and pricing.',
        child: Column(
          children: [
            _listingHeader(),
            _listingRow('Brake Rotor - Front Left', 'Braking System', '\$85.00',
                'In Stock', Colors.green),
            _listingRow('Bosch S4 Battery', 'Electrical', '\$120.00',
                'Low Stock', Colors.orange),
            _listingRow('LED Headlight Assembly', 'Lighting', '\$210.00',
                'Out of Stock', Colors.red),
            _listingRow('Air Filter - Performance', 'Intake', '\$45.00',
                'In Stock', Colors.green),
            _listingRow('Radiator Fan Motor', 'Cooling', '\$135.00', 'In Stock',
                Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildAddListingView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'Create New Part Listing',
        subtitle:
            'Fill in the details below to add a new product to your shop.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Part Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'e.g., Toyota Corolla Brake Pad',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: [
                          'Braking System',
                          'Electrical',
                          'Lighting',
                          'Engine'
                        ]
                            .map((label) => DropdownMenuItem(
                                value: label, child: Text(label)))
                            .toList(),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price (\$)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: '0.00',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Part Added Successfully!')),
                  );
                  setState(() => _selectedIndex = 1);
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryBlue),
                child: const Text('Publish Listing',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            ),
          ),
          Expanded(child: Icon(Icons.more_horiz, color: Colors.grey[400])),
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
}*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'messages_page.dart';
import 'pickup_requests_page.dart';
import 'shop_profile_page.dart';
import 'settings_page.dart';

class SellerDashboard extends StatefulWidget {
  final String? sellerId;

  const SellerDashboard({super.key, this.sellerId});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  int _selectedIndex = 0;

  String _businessName = 'Loading...';
  String _businessType = '';
  bool _isLoadingData = true;

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

  static const Color primaryBlue = Color(0xFF0D3178);
  static const Color lightGrey = Color(0xFFD9D9D9);
  static const Color cardBorder = Color(0xFF638CE5);
  static const Color bgColor = Color(0xFFF5F7FA);

  @override
  void initState() {
    super.initState();
    _loadSellerData();
  }

  Future<void> _loadSellerData() async {
    if (widget.sellerId == null) {
      setState(() {
        _businessName = 'Unknown Seller';
        _businessType = '';
        _isLoadingData = false;
      });
      return;
    }

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('sellers')
          .doc(widget.sellerId)
          .get();

      if (doc.exists && mounted) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          _businessName = data['businessName'] ?? 'Unknown';
          _businessType = data['businessType'] ?? '';
          _isLoadingData = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _businessName = 'Error Loading';
          _businessType = '';
          _isLoadingData = false;
        });
      }
    }
  }

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
                // 🖼️ Logo Section (Updated with Assets Image)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.store,
                                  color: primaryBlue, size: 24);
                            },
                          ),
                        ),
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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      Text(
                        _menuItems[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 20),
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
                      _isLoadingData
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: primaryBlue),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _businessName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  _businessType,
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 12),
                                ),
                              ],
                            ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: lightGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT
                Expanded(child: _buildBodyContent()),

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

  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardView();
      case 1:
        return _buildInventoryView();
      case 2:
        return _buildAddListingView();
      case 3:
        return const MessagesPage();
      case 4:
        return const PickupRequestsPage();
      case 5:
        return ShopProfilePage(sellerId: widget.sellerId);
      case 6:
        return const SettingsPage();
      default:
        return Center(
          child: Text(
            '${_menuItems[_selectedIndex]} Page Not Found',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
    }
  }

  Widget _buildDashboardView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, $_businessName',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your shop is performing well today. You have 12 pending inquiries.',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => setState(() => _selectedIndex = 2),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add New Part',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
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
                              '\LKR 85.00',
                              'In Stock',
                              Colors.green),
                          _listingRow('Bosch S4 Battery', 'Electrical',
                              '\LKR 120.00', 'Low Stock', Colors.orange),
                          _listingRow('LED Headlight Assembly', 'Lighting',
                              '\LKR 210.00', 'Out of Stock', Colors.red),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF0FB),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cardBorder.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_outline,
                              color: primaryBlue, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pro Tip: Inventory Management',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                Text(
                                  'Items listed with clear photos sell 45% faster.',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'All Inventory Items',
        subtitle: 'Manage and update your stock availability and pricing.',
        child: Column(
          children: [
            _listingHeader(),
            _listingRow('Brake Rotor - Front Left', 'Braking System',
                '\LKR 15000.00', 'In Stock', Colors.green),
            _listingRow('Bosch S4 Battery', 'Electrical', '\LKR 25000.00',
                'Low Stock', Colors.orange),
            _listingRow('LED Headlight Assembly', 'Lighting', '\LKR 18500.00',
                'Out of Stock', Colors.red),
            _listingRow('Air Filter - Performance', 'Intake', '\LKR 12200.00',
                'In Stock', Colors.green),
            _listingRow('Radiator Fan Motor', 'Cooling', '\LKR 11000.00',
                'In Stock', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildAddListingView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: _sectionCard(
        title: 'Create New Part Listing',
        subtitle:
            'Fill in the details below to add a new product to your shop.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Part Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'e.g., Toyota Corolla Brake Pad',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: [
                          'Braking System',
                          'Electrical',
                          'Lighting',
                          'Engine'
                        ]
                            .map((label) => DropdownMenuItem(
                                value: label, child: Text(label)))
                            .toList(),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price (LKR)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: '0.00',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Part Added Successfully!')),
                  );
                  setState(() => _selectedIndex = 1);
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryBlue),
                child: const Text('Publish Listing',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            ),
          ),
          Expanded(child: Icon(Icons.more_horiz, color: Colors.grey[400])),
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
