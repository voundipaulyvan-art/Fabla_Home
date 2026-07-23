import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_routes.dart';
import '../../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.accent, width: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text('FABLA HOME', style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 2)),
              const SizedBox(height: 8),
              const Text('Connexion', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              const Text('Entrez vos identifiants pour continuer', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 40),
              TextFormField(decoration: _inputDecoration('Email', 'paul@email.com'), keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: _obscure,
                decoration: _inputDecoration('Mot de passe', '••••••••').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: AppColors.textSecondary),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Mot de passe oublié ?', style: TextStyle(color: AppColors.accent))),
              ),
              const SizedBox(height: 16),
              AppButton(label: 'Se connecter', onPressed: () => Navigator.pushNamed(context, AppRoutes.home)),
              const SizedBox(height: 24),
              const Row(children: [
                Expanded(child: Divider()),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('ou', style: TextStyle(color: AppColors.textSecondary))),
                Expanded(child: Divider()),
              ]),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Pas encore de compte ?", style: TextStyle(color: AppColors.textSecondary)),
                TextButton(onPressed: () {}, child: const Text("S'inscrire", style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold))),
              ]),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.driver),
                child: const Text("Accès livreur →", style: TextStyle(color: AppColors.textSecondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
