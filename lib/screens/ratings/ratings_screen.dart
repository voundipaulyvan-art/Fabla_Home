import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/delivery.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white,
        title: const Text('Évaluations', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
              child: const Column(children: [
                Text('Note globale', style: TextStyle(color: AppColors.textSecondary)),
                SizedBox(height: 8),
                Text('4.8', style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                Text('★★★★★', style: TextStyle(color: AppColors.warning, fontSize: 24)),
                Text('(24 évaluations)', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              ]),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: RatingBar.mockBars.map((b) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(children: [
                  SizedBox(width: 28, child: Text(b.label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))),
                  const SizedBox(width: 8),
                  Expanded(child: Stack(children: [
                    Container(height: 10, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(5))),
                    FractionallySizedBox(widthFactor: b.percentage,
                      child: Container(height: 10, decoration: BoxDecoration(color: AppColors.warning, borderRadius: BorderRadius.circular(5)))),
                  ])),
                  const SizedBox(width: 8),
                  SizedBox(width: 32, child: Text(b.value, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))),
                ]),
              )).toList()),
            ),
            const SizedBox(height: 16),
            const Align(alignment: Alignment.centerLeft,
              child: Text('Derniers avis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            const SizedBox(height: 12),
            ...Review.mockReviews.map((r) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    CircleAvatar(backgroundColor: AppColors.primary, radius: 22,
                      child: Text(r.initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    const SizedBox(width: 12),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(r.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(List.filled(r.stars, '★').join(), style: const TextStyle(color: AppColors.warning, fontSize: 14)),
                    ]),
                  ]),
                  Text(r.date, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ]),
                const SizedBox(height: 10),
                Text(r.comment, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
