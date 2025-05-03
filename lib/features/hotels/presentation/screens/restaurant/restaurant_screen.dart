import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_drawer.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/restaurant/restaurant_mobile_view.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int _selectedIndex = 3; // 3 for Restaurant in drawer
  bool _isExpanded = false;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Already on Restaurant screen, just close drawer
      Navigator.pop(context);
      return;
    }

    setState(() {
      _selectedIndex = index;
    });

    // Close drawer first
    Navigator.pop(context);

    // Handle navigation based on selected index
    if (index == 0) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      // Navigate to About
      Navigator.pushReplacementNamed(context, '/about');
    } else if (index == 2) {
      // Navigate to Gallery
      Navigator.pushReplacementNamed(context, '/gallery');
    } else if (index == 4) {
      // Navigate to Blog
      Navigator.pushReplacementNamed(context, '/blog');
    } else if (index == 5) {
      // Navigate to Services
      Navigator.pushReplacementNamed(context, '/services');
    }
  }

  void _onExpansionChanged(bool expanded) {
    setState(() {
      _isExpanded = expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Restaurant')),
      drawer: HotelDrawer(
        selectedIndex: _selectedIndex,
        isExpanded: _isExpanded,
        onItemTapped: _onItemTapped,
        onExpansionChanged: _onExpansionChanged,
      ),
      body: const RestaurantMobileView(),
    );
  }
}
