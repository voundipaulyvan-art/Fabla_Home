class Delivery {
  final String id;
  final String route;
  final String date;
  final String price;
  final String status;
  final String icon;

  const Delivery({
    required this.id,
    required this.route,
    required this.date,
    required this.price,
    required this.status,
    required this.icon,
  });

  static const List<Delivery> mockDeliveries = [
    Delivery(id: '#FBL-2847', route: 'Akwa → Bonamoussadi', date: "Aujourd'hui, 14:32", price: '2 500 XAF', status: 'Livré', icon: '✓'),
    Delivery(id: '#FBL-2846', route: 'Bali → Ndokoti', date: "Aujourd'hui, 11:05", price: '3 200 XAF', status: 'Livré', icon: '✓'),
    Delivery(id: '#FBL-2845', route: 'Makepe → Logbassa', date: 'Hier, 16:48', price: '1 800 XAF', status: 'En cours', icon: '🛵'),
    Delivery(id: '#FBL-2843', route: 'Japoma → Cité SIC', date: 'Hier, 09:12', price: '2 100 XAF', status: 'Annulé', icon: '✕'),
    Delivery(id: '#FBL-2840', route: 'Deido → Bonaberi', date: 'Lundi, 13:20', price: '4 500 XAF', status: 'Livré', icon: '✓'),
  ];
}

class Review {
  final String initials;
  final String name;
  final String date;
  final int stars;
  final String comment;

  const Review({
    required this.initials,
    required this.name,
    required this.date,
    required this.stars,
    required this.comment,
  });

  static const List<Review> mockReviews = [
    Review(initials: 'DS', name: 'Djamila S.', date: '2 juin', stars: 5, comment: 'Livraison rapide et soignée ! Je recommande vivement.'),
    Review(initials: 'JM', name: 'Joyce M.', date: '1 juin', stars: 5, comment: 'Très professionnel, colis bien emballé à la réception.'),
    Review(initials: 'AN', name: 'Alex N.', date: '30 mai', stars: 4, comment: 'Bon service, juste quelques minutes de retard.'),
  ];
}

class RatingBar {
  final String label;
  final double percentage;
  final String value;

  const RatingBar({
    required this.label,
    required this.percentage,
    required this.value,
  });

  static const List<RatingBar> mockBars = [
    RatingBar(label: '5★', percentage: 0.75, value: '75%'),
    RatingBar(label: '4★', percentage: 0.15, value: '15%'),
    RatingBar(label: '3★', percentage: 0.06, value: '6%'),
    RatingBar(label: '2★', percentage: 0.02, value: '2%'),
    RatingBar(label: '1★', percentage: 0.02, value: '2%'),
  ];
}
