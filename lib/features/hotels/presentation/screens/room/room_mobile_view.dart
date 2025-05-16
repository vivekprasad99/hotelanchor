import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class RoomMobileView extends StatelessWidget {
  final String roomType;

  const RoomMobileView({super.key, required this.roomType});

  @override
  Widget build(BuildContext context) {
    // Room details based on room type
    final Map<String, dynamic> roomDetails = _getRoomDetails(roomType);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero image with room name overlay
          Stack(
            alignment: Alignment.center,
            children: [
              // Background image
              Image.asset(
                roomDetails['heroImage'],
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              // Dark overlay
              Container(
                width: double.infinity,
                height: 220,
                color: Colors.black.withOpacity(0.4),
              ),
              // Room name and description
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${roomDetails['name']} Room',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      roomDetails['shortDescription'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getRoomDetails(String roomType) {
    switch (roomType.toLowerCase()) {
      case 'deluxe':
        return {
          'name': 'Deluxe',
          'heroImage': '${AppConstants.imagePath}/header__bg.webp',
          'shortDescription':
              'A step up from the standard room, often with better views, more space, and additional amenities.',
        };
      default:
        // Default to Deluxe if room type not recognized
        return _getRoomDetails('deluxe');
    }
  }
}
