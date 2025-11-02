import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // 🔹 Setup animasi fade-in
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Mulai animasi saat splash dimuat
    _controller.forward();

    // 🔹 Navigasi otomatis ke halaman login
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1️⃣ Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0B3B6F),
                  Color(0xFF2B2E97),
                  Color(0xFF1B4BFF),
                ],
              ),
            ),
          ),

          // 2️⃣ Background image overlay (bgsplash.png)
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/image/splash.png', // pastikan nama file-nya benar
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 3️⃣ Logo dengan fade-in animation
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                'assets/image/logada.png',
                width: 240,
                height: 240,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
