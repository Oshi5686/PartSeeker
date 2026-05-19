import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Toggle switches සඳහා variables
  bool _isNotificationEnabled = true;
  bool _isDarkMode = false;
  bool _isBiometricEnabled = List.castFrom([false]).first ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- PROFILE SECTION ---
              _buildSectionTitle('Account Profile'),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'User Name',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'user@example.com',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                        onPressed: () {
                          // Edit profile action
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // --- APP SETTINGS SECTION ---
              _buildSectionTitle('App Settings'),
              const SizedBox(height: 10),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      secondary: const Icon(Icons.notifications_active_outlined, color: Colors.orange),
                      title: const Text('Push Notifications'),
                      subtitle: const Text('Stay updated with latest alerts'),
                      value: _isNotificationEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isNotificationEnabled = value;
                        });
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      secondary: const Icon(Icons.dark_mode_outlined, color: Colors.purple),
                      title: const Text('Dark Mode'),
                      subtitle: const Text('Reduce eye strain at night'),
                      value: _isDarkMode,
                      onChanged: (bool value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // --- SECURITY & PRIVACY SECTION ---
              _buildSectionTitle('Security & Privacy'),
              const SizedBox(height: 10),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      secondary: const Icon(Icons.fingerprint, color: Colors.green),
                      title: const Text('Biometric Lock'),
                      subtitle: const Text('Fingerprint or Face ID login'),
                      value: _isBiometricEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isBiometricEnabled = value;
                        });
                      },
                    ),
                    const Divider(height: 1),
                    _buildListTile(
                      icon: Icons.lock_outline,
                      iconColor: Colors.redAccent,
                      title: 'Change Password',
                      onTap: () {
                        // Change password navigation
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // --- MORE INFO SECTION ---
              _buildSectionTitle('More Options'),
              const SizedBox(height: 10),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    _buildListTile(
                      icon: Icons.help_outline,
                      iconColor: Colors.blueGrey,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _buildListTile(
                      icon: Icons.info_outline,
                      iconColor: Colors.teal,
                      title: 'About App',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),

              // --- LOGOUT BUTTON ---
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Logout logic here
                    },
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      'Log Out',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Section Title එකක් හදාගන්න වෙනම Widget එකක්
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
        letterSpacing: 0.5,
      ),
    );
  }

  // සාමාන්‍ย Row එකක් (Arrow button එකක් තියෙන) හදාගන්න widget එකක්
  Widget _buildListTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}