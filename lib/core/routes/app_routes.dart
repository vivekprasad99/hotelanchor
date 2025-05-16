import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/gallery_screen.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/restaurant/restaurant_screen.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/room/room_detail_screen.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/room/rooms_listing_screen.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/service/service_screen.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/blog/blog_screen.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/event/event_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/auth_screen.dart';
import '../../features/hotels/presentation/screens/hotel_listing_screen.dart';
import '../../features/hotels/presentation/screens/about_screen.dart';
import '../../features/hotels/presentation/screens/contact/contact_screen.dart';

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
  static const String roomDetail = '/room-detail';
  static const String roomsListing = '/rooms-listing';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Extract arguments if available
    final args = settings.arguments as Map<String, dynamic>?;

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
      case gallery:
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      case service:
        return MaterialPageRoute(builder: (_) => const ServiceScreen());
      case blog:
        return MaterialPageRoute(builder: (_) => const BlogScreen());
      case restaurant:
        return MaterialPageRoute(builder: (_) => const RestaurantScreen());
      case event:
        return MaterialPageRoute(builder: (_) => const EventScreen());
      case contact:
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      case roomDetail:
        // Get the room type from arguments, default to 'deluxe' if not provided
        final roomType = args?['roomType'] as String? ?? 'deluxe';
        return MaterialPageRoute(
          builder: (_) => RoomDetailScreen(roomType: roomType),
        );
      case roomsListing:
        return MaterialPageRoute(builder: (_) => const RoomsListingScreen());
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
