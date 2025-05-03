import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/blog/blog_mobile_view.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_drawer.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  int _selectedIndex = 4; // 4 for Blog in drawer
  bool _isExpanded = false;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Already on Blog screen, just close drawer
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
    } else if (index == 3) {
      // Navigate to Services
      Navigator.pushReplacementNamed(context, '/services');
    }
    // Other navigation options will be added later
  }

  void _onExpansionChanged(bool expanded) {
    setState(() {
      _isExpanded = expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Blog')),
      drawer: HotelDrawer(
        selectedIndex: _selectedIndex,
        isExpanded: _isExpanded,
        onItemTapped: _onItemTapped,
        onExpansionChanged: _onExpansionChanged,
      ),
      body: const BlogMobileView(),
    );
  }
}
