import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_routes.dart';
import '../../widgets/status_badge.dart';

class HomeClientScreen extends StatelessWidget {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'icon': '📦', 'label': 'Nouvelle\nlivraison', 'route': AppRoutes.createDelivery},
      {'icon': '🔍', 'label': 'Suivre\nun colis', 'route': AppRoutes.tracking},
      {'icon': '📋', 'label': 'Historique', 'route': AppRoutes.history},
      {'icon': '⭐', 'label': 'Évaluations', 'route': AppRoutes.ratings},
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                      Text('Bonjour, Paul 👋', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Que souhaitez-vous faire ?', style: TextStyle(color: Colors.white60, fontSize: 14)),
                    ]),
                    CircleAvatar(backgroundColor: AppColors.accent,
                      child: const Text('PY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: const Row(children: [
                    Text('🔍', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Text('Rechercher une livraison...', style: TextStyle(color: Colors.white54)),
                  ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Actions rapides', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.3,
                    children: actions.map((a) => GestureDetector(
                      onTap: () => Navigator.pushNamed(context, a['route']!),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]),
                        padding: const EdgeInsets.all(16),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(a['icon']!, style: const TextStyle(fontSize: 28)),
                          Text(a['label']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                        ]),
                      ),
                    )).toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text('Dernière livraison', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.tracking),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                            Text('#FBL-2847', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 4),
                            Text('Akwa → Bonamoussadi', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                          ]),
                          const StatusBadge(label: 'En cours', color: AppColors.accent, textColor: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Text('🏠', style: TextStyle(fontSize: 20)), label: 'Accueil'),
          BottomNavigationBarItem(icon: Text('📦', style: TextStyle(fontSize: 20)), label: 'Colis'),
          BottomNavigationBarItem(icon: Text('🕒', style: TextStyle(fontSize: 20)), label: 'Historique'),
          BottomNavigationBarItem(icon: Text('👤', style: TextStyle(fontSize: 20)), label: 'Profil'),
        ],
        onTap: (i) {
          if (i == 2) Navigator.pushNamed(context, AppRoutes.history);
        },
      ),
    );
  }
}
