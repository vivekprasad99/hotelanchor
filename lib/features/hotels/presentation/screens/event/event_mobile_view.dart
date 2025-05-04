import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class EventMobileView extends StatelessWidget {
  const EventMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner image with overlay text
          Stack(
            alignment: Alignment.center,
            children: [
              // Background image
              Image.asset(
                '${AppConstants.imagePath}/header__bg.webp',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              // Dark overlay
              Container(
                width: double.infinity,
                height: 220,
                color: Colors.black.withOpacity(0.5),
              ),

              // Text overlay
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Our diverse range of activities is designed to offer something for everyone.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
