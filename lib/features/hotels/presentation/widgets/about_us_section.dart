import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
              onPressed: () => _openWhatsApp(),
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

  // Method to open WhatsApp with the given number
  Future<void> _openWhatsApp() async {
    final phoneNumber =
        "919341282117"; // +91 93412 82117 in international format
    final message = "Hello, I'm interested in booking a special offer package.";

    // Try different URL schemes for WhatsApp
    final List<Uri> uriOptions = [
      // Standard wa.me link
      Uri.parse(
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
      ),

      // Direct WhatsApp intent
      Uri.parse(
        "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}",
      ),

      // Direct WhatsApp Business intent
      Uri.parse(
        "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}",
      ),
    ];

    bool launched = false;
    for (var uri in uriOptions) {
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          launched = true;
          break;
        }
      } catch (e) {
        // Continue to next option
        print("Failed to launch $uri: $e");
      }
    }

    // If all WhatsApp options failed, try phone call as fallback
    if (!launched) {
      final phoneUrl = Uri.parse("tel:+$phoneNumber");
      try {
        if (await canLaunchUrl(phoneUrl)) {
          await launchUrl(phoneUrl);
        } else {
          throw 'Could not launch WhatsApp or make a call';
        }
      } catch (e) {
        print("Failed to launch phone call: $e");
        // Show a snackbar or dialog to inform the user
        // that we couldn't open WhatsApp or make a call
      }
    }
  }
}
