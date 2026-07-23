import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/constants/app_routes.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_client_screen.dart';
import 'screens/payment/payment_screen.dart';
import 'screens/driver/driver_dashboard_screen.dart';
import 'screens/delivery/create_delivery_screen.dart';
import 'screens/tracking/tracking_screen.dart';
import 'screens/history/history_screen.dart';
import 'screens/ratings/ratings_screen.dart';

void main() {
  runApp(const FablaHomeApp());
}

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
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.welcome: (context) => const WelcomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeClientScreen(),
        AppRoutes.payment: (context) => const PaymentScreen(),
        AppRoutes.driver: (context) => const DriverDashboardScreen(),
        AppRoutes.createDelivery: (context) => const CreateDeliveryScreen(),
        AppRoutes.tracking: (context) => const TrackingScreen(),
        AppRoutes.history: (context) => const HistoryScreen(),
        AppRoutes.ratings: (context) => const RatingsScreen(),
      },
    );
  }
}
