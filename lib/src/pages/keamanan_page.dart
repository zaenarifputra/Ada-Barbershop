import 'package:flutter/material.dart';
import 'settings_page.dart';

class KeamananPage extends StatefulWidget {
  const KeamananPage({super.key});

  @override
  State<KeamananPage> createState() => _KeamananPageState();
}

class _KeamananPageState extends State<KeamananPage> {
  bool rememberPassword = false;
  bool faceId = false;
  bool biometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Keamanan",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Foto profil dan nama tengah
            Column(
              children: const [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/image/profil.png'),
                ),
                SizedBox(height: 12),
                Text(
                  "Ahmad Sahroni",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Kapster",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Container menu keamanan
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _switchItem(
                    icon: Icons.lock_outline,
                    text: "Ingat Kata Sandi",
                    value: rememberPassword,
                    onChanged: (val) {
                      setState(() => rememberPassword = val);
                    },
                  ),
                  const Divider(height: 1),
                  _switchItem(
                    icon: Icons.face_retouching_natural,
                    text: "ID Wajah",
                    value: faceId,
                    onChanged: (val) {
                      setState(() => faceId = val);
                    },
                  ),
                  const Divider(height: 1),
                  _switchItem(
                    icon: Icons.fingerprint_outlined,
                    text: "Biometrik",
                    value: biometric,
                    onChanged: (val) {
                      setState(() => biometric = val);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switchItem({
    required IconData icon,
    required String text,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        activeTrackColor: Colors.blue,
        inactiveThumbColor: Colors.grey[300],
        inactiveTrackColor: Colors.grey[400],
      ),
    );
  }
}
