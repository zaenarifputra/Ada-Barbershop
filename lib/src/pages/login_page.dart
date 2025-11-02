import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../routes/app_routes.dart';
import '../theme/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool showPassword = false;

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // layout card di tengah dengan logo atas
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            children: [
              // logo kecil
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset('assets/image/loglogin.png', width: 200, height: 200),
              ),
              const SizedBox(height: 80),

              // card form
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Login', style: AppTextStyle.heading1),
                      const SizedBox(height: 8),
                      // email
                      TextField(
                        controller: emailC,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // password
                      TextField(
                        controller: passC,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() => showPassword = !showPassword),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      PrimaryButton(
                        text: 'Masuk',
                        onPressed: () {
                          // untuk demo, langsung ke home
                          Navigator.pushReplacementNamed(context, AppRoutes.home);
                        },
                      ),
                      const SizedBox(height: 8),

                      TextButton(
                        onPressed: () {
                          // contoh: forgot password / show dialog
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Lupa Password'),
                              content: const Text('Fitur lupa password belum diimplementasikan.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))
                              ],
                            ),
                          );
                        },
                        child: const Text('Lupa password?'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
