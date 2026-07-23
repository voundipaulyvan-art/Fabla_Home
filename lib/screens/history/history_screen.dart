import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/delivery.dart';
import '../../widgets/status_badge.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _tab = 0;
  final _tabs = ['Tout', 'En cours', 'Terminées', 'Annulées'];

  Color _statusColor(String s) {
    switch (s) {
      case 'Livré': return AppColors.success;
      case 'En cours': return AppColors.accent;
      case 'Annulé': return AppColors.error;
      default: return AppColors.textSecondary;
    }
  }

  List<Delivery> get _filtered {
    if (_tab == 0) return Delivery.mockDeliveries;
    final map = {1: 'En cours', 2: 'Livré', 3: 'Annulé'};
    return Delivery.mockDeliveries.where((d) => d.status == map[_tab]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white,
        title: const Text('Historique', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(children: _tabs.asMap().entries.map((e) {
                final active = _tab == e.key;
                return GestureDetector(
                  onTap: () => setState(() => _tab = e.key),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: active ? AppColors.accent : AppColors.background,
                      borderRadius: BorderRadius.circular(20)),
                    child: Text(e.value, style: TextStyle(
                      color: active ? Colors.white : AppColors.textSecondary,
                      fontWeight: active ? FontWeight.bold : FontWeight.normal, fontSize: 13)),
                  ),
                );
              }).toList()),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final d = _filtered[i];
                final color = _statusColor(d.status);
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
                  child: Row(children: [
                    Container(width: 48, height: 48, decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Text(d.icon, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)))),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(d.id, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(d.route, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                      Text(d.date, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                      const SizedBox(height: 2),
                      Text(d.price, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ])),
                    StatusBadge(label: d.status, color: color, textColor: Colors.white),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
