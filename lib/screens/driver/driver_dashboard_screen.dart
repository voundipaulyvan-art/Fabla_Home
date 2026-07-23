import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_routes.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                    Text('Daniel Jiofack', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Livreur certifié 🏍️', style: TextStyle(color: Colors.white60)),
                  ]),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.success.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                    child: const Row(children: [
                      Icon(Icons.circle, color: AppColors.success, size: 8),
                      SizedBox(width: 6),
                      Text('En ligne', style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ]),
                const SizedBox(height: 20),
                Row(children: [
                  _statCard('12 400', 'XAF/jour'),
                  const SizedBox(width: 12),
                  _statCard('7', 'Livraisons'),
                  const SizedBox(width: 12),
                  _statCard('4.9 ★', 'Note moy.'),
                ]),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Missions disponibles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  _missionCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ]),
    ));
  }

  Widget _missionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('#FBL-2848 · URGENT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.error)),
          const Text('1 800 XAF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.accent)),
        ]),
        const SizedBox(height: 6),
        const Text('📦 Documents · 0.3 kg', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        const SizedBox(height: 12),
        const Row(children: [
          Icon(Icons.circle, color: AppColors.success, size: 10),
          SizedBox(width: 8),
          Text('Départ : Akwa, Douala', style: TextStyle(fontSize: 13)),
        ]),
        Container(margin: const EdgeInsets.only(left: 4), width: 2, height: 20, color: AppColors.border),
        const Row(children: [
          Icon(Icons.location_on, color: AppColors.error, size: 12),
          SizedBox(width: 6),
          Text('Arrivée : Makepe, Douala', style: TextStyle(fontSize: 13)),
        ]),
        const SizedBox(height: 12),
        const Row(children: [
          Text('📍 2.4 km', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
          SizedBox(width: 16),
          Text('⏱ ~8 min', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.border),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: const Text('Refuser', style: TextStyle(color: AppColors.textSecondary)),
          )),
          const SizedBox(width: 12),
          Expanded(child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.tracking),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: const Text('Accepter', style: TextStyle(color: Colors.white)),
          )),
        ]),
      ]),
    );
  }
}
