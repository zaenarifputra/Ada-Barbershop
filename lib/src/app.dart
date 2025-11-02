import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'routes/app_routes.dart';

class AdaBarbershopApp extends StatelessWidget {
  const AdaBarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ada Barbershop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}