/*import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Background එකේ උඩින් තියෙන ලා නිල් පාට රවුම
          Positioned(
            top: -100,
            left: MediaQuery.of(context).size.width / 2 - 175,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color(0xFFD6EAF8), // ලා නිල් පාට
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset('assets/images/logo.png', height: 80),
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

          // 2. මැද තියෙන Log In / Sign Up Form එක
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250), // උඩ රවුමට ඉඩ තැබීමට

                  // --- අලුත් වෙනස: Toggle Switch එක Rectangle එකෙන් එළියට ගත්තා ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _buildToggleSwitch(context),
                  ),

                  const SizedBox(height: 20), // Switch එක සහ Box එක අතර පරතරය

                  // Form එක තියෙන සුදු පාට Rectangle එක
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Input Fields
                        _buildTextField("Email or Username"),
                        _buildTextField("Password", isPassword: true),

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
                          onPressed: () {},
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

                        const SizedBox(height: 25),

                        // Google Sign-In Button
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

  // Toggle Switch එක (Log In / Sign Up)
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage())),
              child: const Center(
                  child: Text("Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    );
  }

  // Text Field හදන Helper
  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
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

  // Google Sign-In Button
  Widget _buildGoogleSignInButton() {
    return OutlinedButton(
      onPressed: () {
        print("Google Sign-In clicked");
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
              height: 24),
          const SizedBox(width: 10),
          const Text("Continue with Google",
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Password එක හංගන්න පාවිච්චි කරන variable එක
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Background එකේ උඩින් තියෙන ලා නිල් පාට රවුම
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
                  Image.asset('assets/images/logo.png', height: 80),
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

          // 2. මැද තියෙන Form එක
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),

                  // Toggle Switch (Rectangle එකෙන් එළියේ)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _buildToggleSwitch(context),
                  ),

                  const SizedBox(height: 20),

                  // සුදු පාට Rectangle එක
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
                        // Email Field
                        _buildTextField("Email or Username"),

                        // Password Field (ඇස සහිතව)
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
                          onPressed: () {},
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

                        const SizedBox(height: 25),

                        // Google Button
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

  // --- Widgets ---

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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage())),
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

  // මෙන්න Password එක හදන විදිය (Hide/Show ඇස සහිතව)
  Widget _buildPasswordField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: _isObscured, // Hide/Show කරන variable එක
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
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
              height: 24),
          const SizedBox(width: 10),
          const Text("Continue with Google",
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'signup_page.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
          // Background circle
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
                  Image.asset('assets/images/logo.png', height: 80),
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

          // Main Form
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),

                  // Toggle Switch
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _buildToggleSwitch(context),
                  ),

                  const SizedBox(height: 20),

                  // White Card
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
                          onPressed: () {},
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

                        // Google Button
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
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage())),
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
        // Google Sign In logic
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Text(
              "G",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4285F4),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text("Continue with Google",
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}
