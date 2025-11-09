import 'package:flutter/material.dart';
import '../pages/splash_page.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';
import '../pages/riwayat_page.dart';
import '../pages/qr_page.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const riwayat = '/riwayat';
  static const qr = '/qr';

  static final routes = <String, WidgetBuilder>{
    splash: (_) => const SplashPage(),
    login: (_) => const LoginPage(),
    home: (_) => const HomePage(),
    riwayat: (_) => const RiwayatPage(),
    qr: (_) => const QrPage(),
  };
}