import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/app_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final methods = [
      {'icon': '🟠', 'name': 'Orange Money', 'sub': 'Paiement instantané'},
      {'icon': '🟡', 'name': 'MTN Mobile Money', 'sub': 'Paiement instantané'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Paiement', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
              child: const Column(children: [
                Text('Montant total', style: TextStyle(color: Colors.white60, fontSize: 14)),
                SizedBox(height: 8),
                Text('2 500 XAF', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Livraison #FBL-2847', style: TextStyle(color: Colors.white54, fontSize: 13)),
              ]),
            ),
            const SizedBox(height: 28),
            const Align(alignment: Alignment.centerLeft,
              child: Text('Choisir un moyen de paiement', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            const SizedBox(height: 16),
            ...methods.asMap().entries.map((e) {
              final i = e.key; final m = e.value;
              return GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _selected == i ? AppColors.accent : AppColors.border, width: _selected == i ? 2 : 1),
                  ),
                  child: Row(children: [
                    Text(m['icon']!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 16),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(m['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(m['sub']!, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                    ])),
                    Container(width: 20, height: 20,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                        border: Border.all(color: _selected == i ? AppColors.accent : AppColors.border, width: 2),
                        color: _selected == i ? AppColors.accent : Colors.transparent),
                      child: _selected == i ? const Icon(Icons.check, size: 12, color: Colors.white) : null),
                  ]),
                ),
              );
            }),
            const SizedBox(height: 24),
            AppButton(label: 'Payer 2 500 XAF', onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('✅ Paiement effectué avec succès !'), backgroundColor: AppColors.success));
            }),
            const SizedBox(height: 16),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.lock, size: 14, color: AppColors.textSecondary),
              SizedBox(width: 4),
              Text('Paiement sécurisé & chiffré', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
            ]),
          ],
        ),
      ),
    );
  }
}
