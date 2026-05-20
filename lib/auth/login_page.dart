/*import 'package:flutter/material.dart';
import 'signup_page.dart';
import '../services/auth_service.dart';
import '../screens/buyer/buyer_home_screen.dart';

class LoginPage extends StatefulWidget {
  
  final String? scannedPart;

  const LoginPage({super.key, this.scannedPart});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background UI Circle
          Positioned(
            top: -100,
            left: MediaQuery.of(context).size.width / 2 - 175,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color(0xFFD6EAF8),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Logo එක assets වල තියෙනවා නම් පෙන්වයි
                  Image.asset('assets/images/logo.png',
                      height: 80,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.settings,
                          size: 80,
                          color: Color(0xFF1B4F72))),
                  const Text(
                    "PartSeeker",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4F72),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Login Form Section
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),

                  // Log In / Sign Up Toggle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _buildToggleSwitch(context),
                  ),

                  const SizedBox(height: 20),

                  // Login Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildTextField("Email or Username"),
                        _buildPasswordField("Password"),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Forgot Password logic
                            },
                            child: const Text("Forgot Password?",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // --- LOG IN BUTTON ---
                        ElevatedButton(
                          onPressed: () {
                            // 🚀 ඩයිනමික් ෂොප් ලිස්ට් එක වැඩ කරන්න, මෙතනින් BuyerHomeScreen එකට
                            // scannedPart එක පාස් කරනවා. AI එකෙන් මුකුත්ම ආවේ නැත්නම් default 'Brake Rotor' යනවා.
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyerHomeScreen(
                                  scannedPart:
                                      widget.scannedPart ?? "Brake Rotor",
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B4F72),
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text("Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),

                        const SizedBox(height: 20),
                        const Text("OR", style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 20),

                        // Google Sign In
                        _buildGoogleSignInButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Login සහ Sign Up අතර මාරු වීමට ටැබ් එක
  Widget _buildToggleSwitch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1B4F72),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                  child: Text("Log In",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Sign Up පිටුවට යනවා
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const Center(
                  child: Text("Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildPasswordField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: _isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildGoogleSignInButton() {
    return OutlinedButton(
      onPressed: () async {
        await _authService.signInWithGoogle();

        // 🚀 Google Login එක සාර්ථක වුණාට පස්සෙත් Home එකට ඩේටා ටික යන්න මෙතනට Navigation එක දැම්මා
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BuyerHomeScreen(
                scannedPart: widget.scannedPart ?? "Brake Rotor",
              ),
            ),
          );
        }
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.g_mobiledata, size: 30, color: Colors.blue),
          const SizedBox(width: 10),
          const Text("Continue with Google",
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'signup_page.dart';
import '../services/auth_service.dart';
import '../screens/buyer/buyer_home_screen.dart';

class LoginPage extends StatefulWidget {
  final String? scannedPart;

  const LoginPage({super.key, this.scannedPart});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  bool _isGoogleLoading = false; // ✅ Loading state
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background circle with actual logo
          Positioned(
            top: -100,
            left: MediaQuery.of(context).size.width / 2 - 175,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color(0xFFD6EAF8),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // ✅ Logo — assets/images/logo.png
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.settings,
                      size: 80,
                      color: Color(0xFF1B4F72),
                    ),
                  ),
                  const Text(
                    "PartSeeker",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4F72),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Login Form
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),

                  // Log In / Sign Up Toggle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _buildToggleSwitch(context),
                  ),

                  const SizedBox(height: 20),

                  // Login Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildTextField("Email or Username"),
                        _buildPasswordField("Password"),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Log In Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyerHomeScreen(
                                  scannedPart:
                                      widget.scannedPart ?? "Brake Rotor",
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B4F72),
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Text("OR", style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 20),

                        // ✅ Fixed Google Sign In Button
                        _buildGoogleSignInButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1B4F72),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text("Log In",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const Center(
                child: Text("Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildPasswordField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: _isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  // ✅ Fixed Google Sign In — account picker show කරනවා
  Widget _buildGoogleSignInButton() {
    return OutlinedButton(
      onPressed: _isGoogleLoading ? null : _handleGoogleSignIn,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: _isGoogleLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: Color(0xFF1B4F72)),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ Google G logo proper color
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  child: const Text(
                    'G',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4285F4),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Continue with Google",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
    );
  }

  // ✅ Google Sign In handler — account picker + error handling
  Future<void> _handleGoogleSignIn() async {
    setState(() => _isGoogleLoading = true);

    try {
      // ✅ signInWithGoogle() call — Google account picker show වෙනවා
      final user = await _authService.signInWithGoogle();

      if (!mounted) return;

      if (user != null) {
        // ✅ Login සාර්ථක — BuyerHomeScreen එකට යනවා
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BuyerHomeScreen(
              scannedPart: widget.scannedPart ?? "Brake Rotor",
            ),
          ),
        );
      } else {
        // ✅ User cancelled හෝ failed — error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text("Google Sign In cancelled or failed. Please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Google Sign In Error: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sign In Error: ${e.toString()}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isGoogleLoading = false);
      }
    }
  }
}*/

import 'package:flutter/material.dart';
import 'signup_page.dart';
import '../services/auth_service.dart';
import '../screens/buyer/buyer_home_screen.dart';

class LoginPage extends StatefulWidget {
  final String? scannedPart;

  const LoginPage({super.key, this.scannedPart});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  bool _isGoogleLoading = false; // ✅ Loading state
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background circle with actual logo
          Positioned(
            top: -100,
            left: MediaQuery.of(context).size.width / 2 - 175,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color(0xFFD6EAF8),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // ✅ Logo — assets/images/logo.png
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.settings,
                      size: 80,
                      color: Color(0xFF1B4F72),
                    ),
                  ),
                  const Text(
                    "PartSeeker",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4F72),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Login Form
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),

                  // Log In / Sign Up Toggle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _buildToggleSwitch(context),
                  ),

                  const SizedBox(height: 20),

                  // Login Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildTextField("Email or Username"),
                        _buildPasswordField("Password"),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Log In Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyerHomeScreen(
                                  scannedPart:
                                      widget.scannedPart ?? "Brake Rotor",
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B4F72),
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Text("OR", style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 20),

                        // ✅ Fixed Google Sign In Button
                        _buildGoogleSignInButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1B4F72),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text("Log In",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const Center(
                child: Text("Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildPasswordField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: _isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildGoogleSignInButton() {
    return OutlinedButton(
      onPressed: _isGoogleLoading ? null : _handleGoogleSignIn,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: _isGoogleLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: Color(0xFF1B4F72)),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ Google G logo proper color
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  child: const Text(
                    'G',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4285F4),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Continue with Google",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
    );
  }

  // ✅ Google Sign In handler — account picker + error handling
  Future<void> _handleGoogleSignIn() async {
    setState(() => _isGoogleLoading = true);

    try {
      final user = await _authService.signInWithGoogle();

      if (!mounted) return;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BuyerHomeScreen(
              scannedPart: widget.scannedPart ?? "Brake Rotor",
            ),
          ),
        );
      } else {
        // ✅ User cancelled හෝ failed — error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text("Google Sign In cancelled or failed. Please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Google Sign In Error: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sign In Error: ${e.toString()}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isGoogleLoading = false);
      }
    }
  }
}
