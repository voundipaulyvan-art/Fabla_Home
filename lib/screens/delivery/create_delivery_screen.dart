import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_routes.dart';
import '../../widgets/app_button.dart';

class CreateDeliveryScreen extends StatefulWidget {
  const CreateDeliveryScreen({super.key});
  @override
  State<CreateDeliveryScreen> createState() => _CreateDeliveryScreenState();
}

class _CreateDeliveryScreenState extends State<CreateDeliveryScreen> {
  int _step = 1;
  String _type = 'Documents';

  InputDecoration _dec(String label, String hint) => InputDecoration(
    labelText: label, hintText: hint, filled: true, fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.accent, width: 2)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white,
        title: const Text('Créer une livraison', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _stepCircle(1, 'Adresses', _step > 1),
              _stepLine(_step > 1),
              _stepCircle(2, 'Colis', _step > 2),
              _stepLine(_step > 2),
              _stepCircle(3, 'Confirmation', false),
            ]),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border)),
              child: Column(children: [
                Row(children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
                  const SizedBox(width: 12),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Départ', style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                    Text('Quartier Akwa, Douala', style: TextStyle(fontWeight: FontWeight.w600)),
                  ])),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(8)),
                    child: const Text('📍 3.2 km', style: TextStyle(fontSize: 12))),
                ]),
                Container(margin: const EdgeInsets.only(left: 4, top: 4, bottom: 4), width: 2, height: 24, color: AppColors.border),
                Row(children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle)),
                  const SizedBox(width: 12),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Arrivée', style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                    Text('Bonamoussadi, Douala', style: TextStyle(fontWeight: FontWeight.w600)),
                  ])),
                ]),
              ]),
            ),
            const SizedBox(height: 20),
            const Text('Type de colis', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _type,
              decoration: _dec('', ''),
              items: ['Documents', 'Vêtements', 'Électronique', 'Nourriture', 'Autre']
                  .map((t) => DropdownMenuItem(value: t, child: Text('📦 $t'))).toList(),
              onChanged: (v) => setState(() => _type = v!),
            ),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Poids (kg)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 8),
                TextFormField(initialValue: '0.5', decoration: _dec('', '0.5 kg')),
              ])),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Valeur (XAF)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 8),
                TextFormField(initialValue: '5 000', decoration: _dec('', '5 000 XAF')),
              ])),
            ]),
            const SizedBox(height: 16),
            const Text('Description', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 3,
              decoration: _dec('', 'Détails supplémentaires sur le colis...'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
              child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Prix estimé :', style: TextStyle(fontWeight: FontWeight.w600)),
                Text('2 500 XAF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.accent)),
              ]),
            ),
            const SizedBox(height: 20),
            AppButton(label: 'Continuer →', onPressed: () => Navigator.pushNamed(context, AppRoutes.payment)),
          ],
        ),
      ),
    );
  }

  Widget _stepCircle(int n, String label, bool done) {
    final active = _step == n;
    return Column(children: [
      Container(width: 32, height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: done ? AppColors.success : (active ? AppColors.accent : AppColors.border),
        ),
        child: Center(child: done
          ? const Icon(Icons.check, size: 16, color: Colors.white)
          : Text('$n', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
    ]);
  }

  Widget _stepLine(bool done) {
    return Container(margin: const EdgeInsets.only(bottom: 18), width: 60, height: 2,
      color: done ? AppColors.success : AppColors.border);
  }
}
