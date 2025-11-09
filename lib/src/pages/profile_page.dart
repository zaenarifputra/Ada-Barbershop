import 'package:flutter/material.dart';
import 'home_page.dart'; // pastikan file ini sesuai dengan lokasi HomePage kamu

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController(text: "1400101");
    final emailController = TextEditingController(text: "ahmadroni@gmail.com");
    final phoneController = TextEditingController(text: "0882006873819");
    final passwordController = TextEditingController(text: "123456");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profil",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // kembali ke HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/image/profil.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child:
                        const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Ahmad Sahroni",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Kapster",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              _buildTextField(
                label: "ID",
                icon: Icons.badge_outlined,
                controller: idController,
                readOnly: true,
              ),
              const SizedBox(height: 16),

              _buildTextField(
                label: "Email",
                icon: Icons.email_outlined,
                controller: emailController,
                readOnly: true,
              ),
              const SizedBox(height: 16),

              _buildTextField(
                label: "Phone",
                icon: Icons.phone_outlined,
                controller: phoneController,
                readOnly: true,
              ),
    
              
              const SizedBox(height: 16),

              _buildTextField(
                label: "Password",
                icon: Icons.lock_outline,
                controller: passwordController,
                obscure: true,
                readOnly: true,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    bool readOnly = false,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          readOnly: readOnly,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            suffixIcon:
                suffixIcon != null ? Icon(suffixIcon, color: Colors.grey) : null,
            filled: readOnly,
            fillColor: readOnly ? Colors.grey[200] : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}
