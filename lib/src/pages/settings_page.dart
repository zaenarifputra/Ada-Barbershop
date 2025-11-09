import 'package:flutter/material.dart';
import 'home_page.dart';
import 'keamanan_page.dart'; 
import 'bantuan_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
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
              MaterialPageRoute(builder: (context) => HomePage()), // ❌ hapus const
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Foto profil & nama
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

            // 🔐 Menu Keamanan
            ListTile(
              leading: const Icon(Icons.security, color: Colors.black),
              title: const Text(
                "Keamanan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeamananPage()),
                );
              },
            ),

            const Divider(),

            // ⚙️ Menu Pengaturan lainnya (contoh)
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.black),
              title: const Text(
                "Bantuan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push (
                    context,
                    MaterialPageRoute(builder: (context) => const BantuanPage()),
                );
                // aksi lainnya nanti
              },
            ),

            const Divider(),

            // 🚪 Logout
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
