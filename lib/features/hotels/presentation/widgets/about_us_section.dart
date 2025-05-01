import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Us label with arrow
          Row(
            children: [
              Icon(Icons.arrow_forward, size: 16, color: Colors.brown[400]),
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
          const SizedBox(height: 16),

          // Image with experience badge
          Stack(
            children: [
              // Main reception image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  '${AppConstants.imagePath}/about-us.jpeg',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              // Experience badge
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[700], size: 16),
                          Icon(Icons.star, color: Colors.amber[700], size: 16),
                          Icon(Icons.star, color: Colors.amber[700], size: 16),
                          Icon(Icons.star, color: Colors.amber[700], size: 16),
                          Icon(Icons.star, color: Colors.amber[700], size: 16),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '10+',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1931),
                        ),
                      ),
                      const Text(
                        'Anchor Experience',
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Main heading
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

          // Description text
          const Text(
            'At Hotel Anchor we strive to create an unforgettable experience for every guest who walks through our doors. Located in the heart of the city, our hotel combines modern luxury, impeccable service, and thoughtful amenities to offer the perfect accommodation for business travelers, vacationers, and event planners alike',
            style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
          ),
          const SizedBox(height: 24),

          // Book now button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add booking functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB08968),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Book now',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // const SizedBox(height: 32),
        ],
      ),
    );
  }
}
