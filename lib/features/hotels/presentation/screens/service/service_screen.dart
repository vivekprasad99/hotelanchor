import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_drawer.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/service/service_mobile_view.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _selectedIndex = 5; // 5 for Service in drawer
  bool _isExpanded = false;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Already on Service screen, just close drawer
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
      appBar: AppBar(title: const Text('Our Services')),
      drawer: HotelDrawer(
        selectedIndex: _selectedIndex,
        isExpanded: _isExpanded,
        onItemTapped: _onItemTapped,
        onExpansionChanged: _onExpansionChanged,
      ),
      body: const ServiceMobileView(),
    );
  }
}
