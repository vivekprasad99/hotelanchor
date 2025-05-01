import 'package:flutter/material.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/auth_screen.dart';
import '../../features/hotels/presentation/screens/hotel_listing_screen.dart';
import '../../features/hotels/presentation/screens/about_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String hotels = '/hotels';
  static const String about = '/about';
  static const String gallery = '/gallery';
  static const String restaurant = '/restaurant';
  static const String event = '/event';
  static const String blog = '/blog';
  static const String service = '/service';
  static const String contact = '/contact';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case home:
      case hotels:
        return MaterialPageRoute(builder: (_) => const HotelListingScreen());
      case about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
