import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_drawer.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/about_us_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_room_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/special_offers_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_gallery_section.dart';

class HotelListingScreen extends StatefulWidget {
  const HotelListingScreen({Key? key}) : super(key: key);

  @override
  State<HotelListingScreen> createState() => _HotelListingScreenState();
}

class _HotelListingScreenState extends State<HotelListingScreen> {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on selected index
    if (index == 0) {
      // Home is already showing, just close drawer
      Navigator.pop(context);
    } else {
      // For other options, first close drawer
      Navigator.pop(context);

      // Then navigate based on index
      switch (index) {
        case 1: // About
          Navigator.pushNamed(context, AppRoutes.about);
          break;
        case 2: // Gallery
          Navigator.pushNamed(context, AppRoutes.gallery);
          break;
        case 31: // Restaurant
          Navigator.pushNamed(context, AppRoutes.restaurant);
          break;
        case 32: // Event
          Navigator.pushNamed(context, AppRoutes.event);
          break;
        case 4: // Blog
          Navigator.pushNamed(context, AppRoutes.blog);
          break;
        case 5: // Service
          Navigator.pushNamed(context, AppRoutes.service);
          break;
        case 6: // Contact
          Navigator.pushNamed(context, AppRoutes.contact);
          break;
        // Other cases will be added later
      }
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
      appBar: AppBar(title: const Text('Hotel Anchor')),
      drawer: HotelDrawer(
        selectedIndex: _selectedIndex,
        isExpanded: _isExpanded,
        onItemTapped: _onItemTapped,
        onExpansionChanged: _onExpansionChanged,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Carousel Banner with Text and Button
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: CarouselSlider(
                items: [
                  // Single carousel item with text and button overlay
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          '${AppConstants.imagePath}/banner-1.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Dark Overlay
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      // Text and Button
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 32),
                          const Text(
                            'Welcome to Our Hotel Anchor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.roomsListing,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB08968),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Discover Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1.0,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 5),
                ),
              ),
            ),

            // About Us Section
            const AboutUsSection(),

            // Hotel Facilities Section
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: Colors.brown[400],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.brown[400],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.brown[400],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Hotel Facilities heading
                  const Center(
                    child: Text(
                      'Hotel Facilities',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1931),
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Facilities grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.62,
                    children: [
                      _buildFacilityItem(
                        icon: Icons.ac_unit,
                        title: 'All A/C Rooms with Wi-Fi',
                        description:
                            'Enjoy ultimate comfort in our well-appointed and air-conditioned rooms designed to provide a restful and refreshing stay with Wi-Fi.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.power,
                        title: '24 hour power backup',
                        description:
                            'With our reliable 24-hour power backup, you can rest assured that you won\'t experience any interruptions during your stay.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.meeting_room,
                        title: 'Banquet & Conference Hall',
                        description:
                            'Perfect for corporate events, weddings, or any special occasions, we offer spacious banquet and conference halls.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.restaurant,
                        title: 'Restaurant and rooftop space',
                        description:
                            'Relish a variety of delicious cuisines from our in-house restaurant, offering both local and international dishes prepared by our expert chefs.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.security,
                        title: 'CCTV Surveillance',
                        description:
                            'Your safety and security are our top priority. Our premises are under continuous CCTV surveillance to ensure a secure and safe environment.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.cleaning_services,
                        title: 'Daily Housekeeping',
                        description:
                            'Our housekeeping team ensures that your room is clean, comfortable, and well-maintained every day, so you can relax and enjoy your stay.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.directions_car,
                        title: 'Lift Facilities & Free Parking',
                        description:
                            'We offer ample parking space at no additional charge, so you can enjoy a hassle-free experience after arriving.',
                      ),
                      _buildFacilityItem(
                        icon: Icons.airport_shuttle,
                        title: 'Pickup & Drop Facility',
                        description:
                            'We provide convenient pick-up and drop services to and from major locations, ensuring a seamless journey from the moment you arrive.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Hotel Rooms Section
            const HotelRoomsSection(),

            // Special Offers Section
            const SpecialOffersSection(),

            // Gallery Section
            const HotelGallerySection(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilityItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD4AF37), width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, size: 30, color: const Color(0xFFD4AF37)),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Description - No fixed height, no scrolling
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
