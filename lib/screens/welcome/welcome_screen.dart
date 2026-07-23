import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_routes.dart';
import '../../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 380,
            width: double.infinity,
            color: AppColors.primary,
            child: Stack(
              children: [
                Positioned(top: -20, right: -20,
                  child: Container(width: 200, height: 200,
                    decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.15), shape: BoxShape.circle))),
                Positioned(bottom: -20, left: -20,
                  child: Container(width: 200, height: 200,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), shape: BoxShape.circle))),
                const Center(child: Text('🛵', style: TextStyle(fontSize: 80))),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bienvenue sur', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
                  const Text('Fabla Home', style: TextStyle(color: AppColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Text('Envoyez et recevez vos colis rapidement et en toute sécurité.',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 15, height: 1.5)),
                  const Spacer(),
                  AppButton(label: 'Se connecter', onPressed: () => Navigator.pushNamed(context, AppRoutes.login)),
                  const SizedBox(height: 12),
                  AppButton(label: 'Créer un compte', onPressed: () => Navigator.pushNamed(context, AppRoutes.login), outlined: true),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
