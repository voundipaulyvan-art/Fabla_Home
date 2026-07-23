import 'package:flutter/material.dart';

void main() {
  runApp(const FablaHomeApp());
}

// ─── COULEURS ───────────────────────────────────────────────
class AppColors {
  static const Color primary = Color(0xFF1A1A2E);
  static const Color accent = Color(0xFFF97316);
  static const Color background = Color(0xFFF8F9FA);
  static const Color card = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFEAB308);
  static const Color error = Color(0xFFEF4444);
  static const Color border = Color(0xFFE5E7EB);
}

// ─── APP ────────────────────────────────────────────────────
class FablaHomeApp extends StatelessWidget {
  const FablaHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabla Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeClientScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/driver': (context) => const DriverDashboardScreen(),
        '/create-delivery': (context) => const CreateDeliveryScreen(),
        '/tracking': (context) => const TrackingScreen(),
        '/history': (context) => const HistoryScreen(),
        '/ratings': (context) => const RatingsScreen(),
      },
    );
  }
}

// ─── WIDGETS COMMUNS ────────────────────────────────────────
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final bool outlined;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    if (outlined) {
      return SizedBox(
        width: double.infinity,
        height: 56,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.accent),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(label, style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w600, fontSize: 16)),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.accent,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  const StatusBadge({super.key, required this.label, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12)),
    );
  }
}

// ─── 01. SPLASH ─────────────────────────────────────────────
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Text('FH', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 24),
            const Text('FABLA HOME', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 3)),
            const SizedBox(height: 8),
            const Text('"Votre colis, notre mission."', style: TextStyle(color: Colors.white54, fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 24, height: 8, decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 6),
                Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 6),
                Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.circular(4))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── 02. BIENVENUE ──────────────────────────────────────────
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header illustratif
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
          // Contenu
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
                  AppButton(label: 'Se connecter', onPressed: () => Navigator.pushNamed(context, '/login')),
                  const SizedBox(height: 12),
                  AppButton(label: 'Créer un compte', onPressed: () => Navigator.pushNamed(context, '/login'), outlined: true),
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

// ─── 03. CONNEXION ──────────────────────────────────────────
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
              AppButton(label: 'Se connecter', onPressed: () => Navigator.pushNamed(context, '/home')),
              const SizedBox(height: 24),
              Row(children: [
                const Expanded(child: Divider()),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('ou', style: TextStyle(color: AppColors.textSecondary))),
                const Expanded(child: Divider()),
              ]),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Pas encore de compte ?", style: TextStyle(color: AppColors.textSecondary)),
                TextButton(onPressed: () {}, child: const Text("S'inscrire", style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold))),
              ]),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/driver'),
                child: const Text("Accès livreur →", style: TextStyle(color: AppColors.textSecondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── 04. ACCUEIL CLIENT ─────────────────────────────────────
class HomeClientScreen extends StatelessWidget {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'icon': '📦', 'label': 'Nouvelle\nlivraison', 'route': '/create-delivery'},
      {'icon': '🔍', 'label': 'Suivre\nun colis', 'route': '/tracking'},
      {'icon': '📋', 'label': 'Historique', 'route': '/history'},
      {'icon': '⭐', 'label': 'Évaluations', 'route': '/ratings'},
    ];

    return Scaffold(
      body: Column(
        children: [
          // Header
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
          // Body
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
                    onTap: () => Navigator.pushNamed(context, '/tracking'),
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
          if (i == 2) Navigator.pushNamed(context, '/history');
        },
      ),
    );
  }
}

// ─── 05. PAIEMENT ───────────────────────────────────────────
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

// ─── 06. DASHBOARD LIVREUR ──────────────────────────────────
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
            onPressed: () => Navigator.pushNamed(context, '/tracking'),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: const Text('Accepter', style: TextStyle(color: Colors.white)),
          )),
        ]),
      ]),
    );
  }
}

// ─── 07. CRÉER LIVRAISON ────────────────────────────────────
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
            // Stepper
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _stepCircle(1, 'Adresses', _step > 1),
              _stepLine(_step > 1),
              _stepCircle(2, 'Colis', _step > 2),
              _stepLine(_step > 2),
              _stepCircle(3, 'Confirmation', false),
            ]),
            const SizedBox(height: 24),
            // Adresses
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
            AppButton(label: 'Continuer →', onPressed: () => Navigator.pushNamed(context, '/payment')),
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

// ─── 08. SUIVI TEMPS RÉEL ───────────────────────────────────
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
          // Carte simulée
          Container(
            height: 280,
            color: const Color(0xFFE8F0E8),
            child: Stack(
              children: [
                // Grille simulée
                CustomPaint(painter: MapGridPainter(), size: const Size(double.infinity, 280)),
                // Icônes
                Positioned(left: 80, top: 130, child: _mapPin('🏠', AppColors.primary)),
                Positioned(left: 220, top: 115, child: _mapPin('🛵', AppColors.accent, large: true)),
                Positioned(right: 40, top: 120, child: _mapPin('📍', AppColors.error)),
                // ETA
                Positioned(top: 16, right: 16,
                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)]),
                    child: const Text('⏱ ~12 min', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)))),
              ],
            ),
          ),
          // Panneau inférieur
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
                  // Progression
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
                  // Livreur
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

// ─── 09. HISTORIQUE ─────────────────────────────────────────
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _tab = 0;
  final _tabs = ['Tout', 'En cours', 'Terminées', 'Annulées'];
  final _deliveries = [
    {'id': '#FBL-2847', 'route': 'Akwa → Bonamoussadi', 'date': "Aujourd'hui, 14:32", 'price': '2 500 XAF', 'status': 'Livré', 'icon': '✓'},
    {'id': '#FBL-2846', 'route': 'Bali → Ndokoti', 'date': "Aujourd'hui, 11:05", 'price': '3 200 XAF', 'status': 'Livré', 'icon': '✓'},
    {'id': '#FBL-2845', 'route': 'Makepe → Logbassa', 'date': 'Hier, 16:48', 'price': '1 800 XAF', 'status': 'En cours', 'icon': '🛵'},
    {'id': '#FBL-2843', 'route': 'Japoma → Cité SIC', 'date': 'Hier, 09:12', 'price': '2 100 XAF', 'status': 'Annulé', 'icon': '✕'},
    {'id': '#FBL-2840', 'route': 'Deido → Bonaberi', 'date': 'Lundi, 13:20', 'price': '4 500 XAF', 'status': 'Livré', 'icon': '✓'},
  ];

  Color _statusColor(String s) {
    switch (s) {
      case 'Livré': return AppColors.success;
      case 'En cours': return AppColors.accent;
      case 'Annulé': return AppColors.error;
      default: return AppColors.textSecondary;
    }
  }

  List<Map<String, String>> get _filtered {
    if (_tab == 0) return _deliveries;
    final map = {1: 'En cours', 2: 'Livré', 3: 'Annulé'};
    return _deliveries.where((d) => d['status'] == map[_tab]).toList();
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
                final color = _statusColor(d['status']!);
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
                  child: Row(children: [
                    Container(width: 48, height: 48, decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Text(d['icon']!, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)))),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(d['id']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(d['route']!, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                      Text(d['date']!, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                      const SizedBox(height: 2),
                      Text(d['price']!, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ])),
                    StatusBadge(label: d['status']!, color: color, textColor: Colors.white),
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

// ─── 10. ÉVALUATIONS ────────────────────────────────────────
class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {'initials': 'DS', 'name': 'Djamila S.', 'date': '2 juin', 'stars': 5, 'comment': 'Livraison rapide et soignée ! Je recommande vivement.'},
      {'initials': 'JM', 'name': 'Joyce M.', 'date': '1 juin', 'stars': 5, 'comment': 'Très professionnel, colis bien emballé à la réception.'},
      {'initials': 'AN', 'name': 'Alex N.', 'date': '30 mai', 'stars': 4, 'comment': 'Bon service, juste quelques minutes de retard.'},
    ];
    final bars = [
      {'label': '5★', 'pct': 0.75, 'val': '75%'},
      {'label': '4★', 'pct': 0.15, 'val': '15%'},
      {'label': '3★', 'pct': 0.06, 'val': '6%'},
      {'label': '2★', 'pct': 0.02, 'val': '2%'},
      {'label': '1★', 'pct': 0.02, 'val': '2%'},
    ];

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
            // Note globale
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
              child: Column(children: [
                const Text('Note globale', style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 8),
                const Text('4.8', style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                const Text('★★★★★', style: TextStyle(color: AppColors.warning, fontSize: 24)),
                const Text('(24 évaluations)', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              ]),
            ),
            const SizedBox(height: 16),
            // Barres
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: bars.map((b) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(children: [
                  SizedBox(width: 28, child: Text(b['label'] as String, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))),
                  const SizedBox(width: 8),
                  Expanded(child: Stack(children: [
                    Container(height: 10, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(5))),
                    FractionallySizedBox(widthFactor: b['pct'] as double,
                      child: Container(height: 10, decoration: BoxDecoration(color: AppColors.warning, borderRadius: BorderRadius.circular(5)))),
                  ])),
                  const SizedBox(width: 8),
                  SizedBox(width: 32, child: Text(b['val'] as String, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))),
                ]),
              )).toList()),
            ),
            const SizedBox(height: 16),
            const Align(alignment: Alignment.centerLeft,
              child: Text('Derniers avis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            const SizedBox(height: 12),
            ...reviews.map((r) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    CircleAvatar(backgroundColor: AppColors.primary, radius: 22,
                      child: Text(r['initials'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    const SizedBox(width: 12),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(r['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('★' * (r['stars'] as int), style: const TextStyle(color: AppColors.warning, fontSize: 14)),
                    ]),
                  ]),
                  Text(r['date'] as String, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ]),
                const SizedBox(height: 10),
                Text(r['comment'] as String, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
