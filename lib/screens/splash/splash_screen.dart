import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Text('FH', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 24),
            const Text('FABLA HOME', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 3)),
            const SizedBox(height: 8),
            const Text('"Votre colis, notre mission."', style: TextStyle(color: Colors.white54, fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 24, height: 8, decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 6),
                Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 6),
                Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.circular(4))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
