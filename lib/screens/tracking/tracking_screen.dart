import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/status_badge.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white,
        title: const Text('Suivi en temps réel', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 280,
            color: const Color(0xFFE8F0E8),
            child: Stack(
              children: [
                CustomPaint(painter: MapGridPainter(), size: const Size(double.infinity, 280)),
                Positioned(left: 80, top: 130, child: _mapPin('🏠', AppColors.primary)),
                Positioned(left: 220, top: 115, child: _mapPin('🛵', AppColors.accent, large: true)),
                Positioned(right: 40, top: 120, child: _mapPin('📍', AppColors.error)),
                Positioned(top: 16, right: 16,
                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)]),
                    child: const Text('⏱ ~12 min', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)))),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('#FBL-2847', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const StatusBadge(label: 'En transit', color: AppColors.accent, textColor: Colors.white),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    _progressStep('✓', 'Récupéré', true, true),
                    Expanded(child: Stack(children: [
                      Container(height: 2, color: AppColors.border),
                      Container(height: 2, color: AppColors.accent, width: double.infinity),
                    ])),
                    _progressStep('🛵', 'En route', true, false),
                    Expanded(child: Container(height: 2, color: AppColors.border)),
                    _progressStep('3', 'Livré', false, false),
                  ]),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border)),
                    child: Row(children: [
                      CircleAvatar(backgroundColor: AppColors.accent,
                        child: const Text('DJ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      const SizedBox(width: 12),
                      const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Daniel Jiofack', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Moto · CM 123 AB', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        Text('⭐ 4.8', style: TextStyle(fontSize: 12)),
                      ])),
                      Container(width: 40, height: 40,
                        decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(12)),
                        child: const Center(child: Text('📞', style: TextStyle(fontSize: 18)))),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
                    child: const Row(children: [
                      Icon(Icons.circle, color: AppColors.success, size: 10),
                      SizedBox(width: 8),
                      Expanded(child: Text('Votre livreur est à 1.2 km — Mise à jour il y a 30s',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary))),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  AppButton(label: 'Confirmer la réception', onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('✅ Livraison confirmée !'), backgroundColor: AppColors.success));
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapPin(String emoji, Color color, {bool large = false}) {
    return Container(
      width: large ? 44 : 32, height: large ? 44 : 32,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8)]),
      child: Center(child: Text(emoji, style: TextStyle(fontSize: large ? 20 : 14))),
    );
  }

  Widget _progressStep(String icon, String label, bool active, bool done) {
    return Column(children: [
      Container(width: 32, height: 32,
        decoration: BoxDecoration(shape: BoxShape.circle,
          color: done || active ? AppColors.accent : AppColors.border),
        child: Center(child: Text(icon, style: const TextStyle(fontSize: 12, color: Colors.white)))),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
    ]);
  }
}

class MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey.withOpacity(0.2)..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 65) canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    for (double y = 0; y < size.height; y += 70) canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    final road = Paint()..color = Colors.white..strokeWidth = 8;
    canvas.drawLine(const Offset(0, 183), Offset(size.width, 183), road);
    canvas.drawLine(const Offset(130, 0), Offset(130, size.height), road);
    canvas.drawLine(const Offset(260, 0), Offset(260, size.height), road);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
