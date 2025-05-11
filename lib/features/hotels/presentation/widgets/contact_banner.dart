import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class ContactBanner extends StatelessWidget {
  const ContactBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device (narrow screen)
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Container(
      width: double.infinity,
      height: isMobile ? 200 : 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${AppConstants.imagePath}/header__bg.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Whether you have questions, need assistance, or simply want to share.',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}