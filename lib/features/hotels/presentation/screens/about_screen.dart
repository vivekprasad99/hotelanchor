import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_drawer.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_facilities_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/team_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/testimonial_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_gallery_section.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedIndex = 1; // 1 for About in drawer
  bool _isExpanded = false;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Already on About screen, just close drawer
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
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
    if (index == 1) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.about);
    }
    if (index == 2) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.gallery);
    }
    if (index == 31) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.restaurant);
    }
    if (index == 32) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.event);
    }
    if (index == 4) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.blog);
    }
    if (index == 5) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.service);
    }
    if (index == 6) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.contact);
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
    // Check if device is in portrait or landscape
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      drawer: HotelDrawer(
        selectedIndex: _selectedIndex,
        isExpanded: _isExpanded,
        onItemTapped: _onItemTapped,
        onExpansionChanged: _onExpansionChanged,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Us heading with arrow
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.brown[400],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.brown[400],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Main content - adapts to orientation
                  isPortrait ? _buildPortraitLayout() : _buildLandscapeLayout(),

                  const SizedBox(height: 32),

                  // Cozy section
                  Center(
                    child: Image.asset(
                      '${AppConstants.imagePath}/sign.webp',
                      width: 120,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Hotel Facilities Section
                  const HotelFacilitiesSection(),

                  const SizedBox(height: 48),

                  const TeamSection(),

                  // Testimonial Section
                  const TestimonialSection(),

                  // Team Section
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Images stack
        _buildImagesStack(),
        const SizedBox(height: 24),

        // Heading
        const Text(
          'Welcome To Our Anchor Hotel & Restaurants',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),

        // Description
        _buildDescription(),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Images stack - takes 45% of width
        Expanded(flex: 45, child: _buildImagesStack()),
        const SizedBox(width: 24),

        // Text content - takes 55% of width
        Expanded(
          flex: 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              const Text(
                'Welcome To Our Anchor Hotel & Restaurants',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A1931),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 16),

              // Description
              _buildDescription(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImagesStack() {
    return Stack(
      children: [
        Container(height: 300, width: double.infinity),
        // Main image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            '${AppConstants.imagePath}/about-1.jpeg',
            width: MediaQuery.of(context).size.width * 0.7,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),

        // Overlapping second image
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                '${AppConstants.imagePath}/about-2.jpeg',
                width: 160,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      'At Hotel Anchor, we invite you to experience the perfect blend of elegance, modern comfort, and exceptional service. Located in the heart of the city, our hotel offers a tranquil escape for both business and leisure travelers. Whether you\'re visiting for a short stay or an extended retreat, we ensure your experience is nothing short of extraordinary. Our rooms are equipped with all the essentials: plush bedding, air conditioning, high-speed Wi-Fi, premium toiletries, and all the amenities you need to relax or stay productive. Each space is thoughtfully appointed, offering a welcoming atmosphere for every guest. Hotel Anchor is not just about luxurious accommodation; we also offer world-class dining options.',
      style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.6),
    );
  }
}
