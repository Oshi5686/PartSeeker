/*import 'package:flutter/material.dart';

class SellerAuthPage extends StatefulWidget {
  const SellerAuthPage({super.key});

  @override
  State<SellerAuthPage> createState() => _SellerAuthPageState();
}

class _SellerAuthPageState extends State<SellerAuthPage> {
  bool isLogin = false; // මේකෙන් තමයි Login ද Register ද කියලා තීරණය කරන්නේ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // වම් පැත්තේ නිල් පාට Panel එක (මෙය වෙනස් වෙන්නේ නැහැ)
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF1B4F72),
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Fuel Your Parts\nBusiness Growth.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  _infoItem(Icons.trending_up, "Scale your reach"),
                  _infoItem(Icons.verified_user, "Verified Transactions"),
                  _infoItem(Icons.settings, "Operations Simplified"),
                ],
              ),
            ),
          ),

          // දකුණු පැත්තේ Form එක (මෙය Login/Register අනුව වෙනස් වේ)
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Column(
                children: [
                  Text(isLogin ? "Welcome Back!" : "Seller Dashboard",
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(isLogin
                      ? "Sign in to manage your inventory"
                      : "Join as a partner to start selling"),
                  const SizedBox(height: 30),

                  // Google Sign-In Button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_\"G\"_logo.svg/1200px-Google_\"G\"_logo.svg.png',
                          height: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(isLogin
                            ? "Sign in with Google"
                            : "Continue with Google"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Row(children: [
                    Expanded(child: Divider()),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR")),
                    Expanded(child: Divider())
                  ]),
                  const SizedBox(height: 25),

                  // Register නම් විතරක් පෙනෙන කොටස (Business Type)
                  if (!isLogin) ...[
                    const Text("Select Business Type",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _typeChip("Garage Owner"),
                        _typeChip("Parts Shop"),
                        _typeChip("Individual"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _textField("Business/ Seller Name", Icons.business),
                  ],

                  // පොදු Fields (Login එකටත් Register එකටත් දෙකටම ඕන ඒවා)
                  const SizedBox(height: 10),
                  _textField("Email Address / Contact", Icons.email),
                  const SizedBox(height: 10),
                  _textField("Password", Icons.lock, isPassword: true),

                  if (!isLogin) ...[
                    const SizedBox(height: 10),
                    _textField("Location", Icons.location_on),
                  ],

                  const SizedBox(height: 30),

                  // Main Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B4F72),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(isLogin ? "Sign In" : "Continue to Dashboard",
                        style: const TextStyle(color: Colors.white)),
                  ),

                  const SizedBox(height: 20),

                  // Toggle Login / Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isLogin
                          ? "Don't have an account? "
                          : "Already have an account? "),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin; // මෙතනින් තමයි switch වෙන්නේ
                          });
                        },
                        child: Text(isLogin ? "Register" : "Sign In",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // UI Helpers
  Widget _infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 28),
          const SizedBox(width: 20),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _typeChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(label: Text(label), selected: false),
    );
  }

  Widget _textField(String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 20),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'seller_dashboard.dart'; // ← ඔයාගේ dashboard file එකේ path එක check කරන්න

class SellerAuthPage extends StatefulWidget {
  const SellerAuthPage({super.key});

  @override
  State<SellerAuthPage> createState() => _SellerAuthPageState();
}

class _SellerAuthPageState extends State<SellerAuthPage> {
  bool isLogin = false;

  void _goToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SellerDashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // වම් පැත්තේ නිල් පාට Panel එක
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF1B4F72),
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fuel Your Parts\nBusiness Growth.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _infoItem(Icons.trending_up, "Scale your reach"),
                  _infoItem(Icons.verified_user, "Verified Transactions"),
                  _infoItem(Icons.settings, "Operations Simplified"),
                ],
              ),
            ),
          ),

          // දකුණු පැත්තේ Form එක
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Column(
                children: [
                  Text(
                    isLogin ? "Welcome Back!" : "Seller Dashboard",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isLogin
                        ? "Sign in to manage your inventory"
                        : "Join as a partner to start selling",
                  ),
                  const SizedBox(height: 30),

                  // Google Sign-In Button
                  OutlinedButton(
                    onPressed: _goToDashboard,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg',
                          height: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isLogin
                              ? "Sign in with Google"
                              : "Continue with Google",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Register විතරක් පෙනෙන කොටස
                  if (!isLogin) ...[
                    const Text(
                      "Select Business Type",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _typeChip("Garage Owner"),
                        _typeChip("Parts Shop"),
                        _typeChip("Individual"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _textField("Business / Seller Name", Icons.business),
                  ],

                  // Login + Register දෙකටම ඕන Fields
                  const SizedBox(height: 10),
                  _textField("Email Address / Contact", Icons.email),
                  const SizedBox(height: 10),
                  _textField("Password", Icons.lock, isPassword: true),

                  if (!isLogin) ...[
                    const SizedBox(height: 10),
                    _textField("Location", Icons.location_on),
                  ],

                  const SizedBox(height: 30),

                  // Main Button — Dashboard එකට යනවා
                  ElevatedButton(
                    onPressed: _goToDashboard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B4F72),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      isLogin ? "Sign In" : "Continue to Dashboard",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Toggle Login / Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLogin
                            ? "Don't have an account? "
                            : "Already have an account? ",
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin ? "Register" : "Sign In",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // UI Helpers
  Widget _infoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 28),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _typeChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(label: Text(label), selected: false),
    );
  }

  Widget _textField(String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 20),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const PartSeekerApp());
}

class PartSeekerApp extends StatelessWidget {
  const PartSeekerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartSeeker Seller Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D3178)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SellerDashboardPage(),
    );
  }
}

class SellerDashboardPage extends StatefulWidget {
  const SellerDashboardPage({super.key});

  @override
  State<SellerDashboardPage> createState() => _SellerDashboardPageState();
}

class _SellerDashboardPageState extends State<SellerDashboardPage> {
  int _selectedBusinessType = 0; // 0=Garage Owner, 1=Parts Shop, 2=Individual

  final List<String> _businessTypes = [
    'Garage Owner',
    'Parts Shop',
    'Individual'
  ];

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _businessNameController.dispose();
    _contactController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────────────
            _buildHeader(),

            // ── Main content row ─────────────────────────────────────────
            _buildMainContent(),

            // ── Footer ───────────────────────────────────────────────────
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Header
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          // Logo icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF0D3178),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.settings, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),
          const Text(
            'PartSeeker',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D3178),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Main Content
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildMainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 4, child: _buildLeftPanel()),
              Expanded(flex: 5, child: _buildRightPanel()),
            ],
          );
        }

        // Narrow / phone layout – stack vertically
        return Column(
          children: [
            _buildLeftPanel(),
            _buildRightPanel(),
          ],
        );
      },
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Left blue panel
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildLeftPanel() {
    return Container(
      color: const Color(0xFF0D3178),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fuel Your Parts\nBusiness\nGrowth.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Connect with thousands of buyers looking\nfor specific automotive components every day.',
            style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
          ),
          const SizedBox(height: 32),
          _buildFeatureItem(
            icon: Icons.trending_up,
            iconColor: Colors.orange,
            title: 'Scale your reach',
            desc:
                'Get your inventory in front of local garages\nand individual DIYers instantly.',
          ),
          const SizedBox(height: 20),
          _buildFeatureItem(
            icon: Icons.verified_user,
            iconColor: Colors.redAccent,
            title: 'Verified Transactions',
            desc:
                'Secure payment handling and pickup\nverification for every single sale.',
          ),
          const SizedBox(height: 20),
          _buildFeatureItem(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            title: 'Operations Simplified',
            desc:
                'Inventory tracking, customer messaging,\nand logistics all in one dashboard.',
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String desc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: iconColor.withOpacity(0.15),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 13, height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Right white panel (registration form)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildRightPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          const Text(
            'Seller Dashboard',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111111),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Manage spare part listings, customer inquiries,\nand shop information.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
          ),
          const SizedBox(height: 28),

          // Card
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Google button ──────────────────────────────────────
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: _googleIcon(),
                  label: const Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ── Divider ────────────────────────────────────────────
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or join as a partner',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),

                const SizedBox(height: 20),

                // ── Business type selector ─────────────────────────────
                const Text(
                  'Select Business Type',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D3178),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: List.generate(_businessTypes.length, (i) {
                      final selected = _selectedBusinessType == i;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _selectedBusinessType = i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color:
                                  selected ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _businessTypes[i],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selected
                                    ? const Color(0xFF0D3178)
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 20),

                // ── Business / Seller Name ─────────────────────────────
                const Text(
                  'Business/ Seller Name',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _businessNameController,
                  decoration: _inputDecoration('e.g Hill Country Auto Mart'),
                ),

                const SizedBox(height: 16),

                // ── Contact + Location row ─────────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Number',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _contactController,
                            keyboardType: TextInputType.phone,
                            decoration: _inputDecoration('+94 00 000 0000',
                                prefixIcon: const Icon(Icons.phone_outlined,
                                    size: 18, color: Colors.black54)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Location',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _locationController,
                            decoration: _inputDecoration('City, State',
                                prefixIcon: const Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                    color: Colors.black54)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ── CTA button ─────────────────────────────────────────
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D3178),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Continue to Dashboard',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Terms note ─────────────────────────────────────────
                const Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: Colors.black45),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ── Sign in row ────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D3178),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Footer
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFooter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 500;
              final links = Row(
                mainAxisAlignment: isWide
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                children: [
                  _footerLink('Privacy Policy'),
                  const SizedBox(width: 24),
                  _footerLink('Term & Condition'),
                  const SizedBox(width: 24),
                  _footerLink('Help'),
                ],
              );

              if (isWide) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '2026 Partseeker Seller Dashboard',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    links,
                    const Text(
                      'version 1.0.0',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  const Text(
                    '2026 Partseeker Seller Dashboard',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  links,
                  const SizedBox(height: 4),
                  const Text(
                    'version 1.0.0',
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String label) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF0D3178),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Helpers
  // ─────────────────────────────────────────────────────────────────────────
  InputDecoration _inputDecoration(String hint, {Widget? prefixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF0D3178), width: 2),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  /// Simple hand-drawn Google 'G' icon using a styled container
  Widget _googleIcon() {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      alignment: Alignment.center,
      child: const Text(
        'G',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4285F4),
        ),
      ),
    );
  }
}
