import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';

class RoomsListingScreen extends StatelessWidget {
  const RoomsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OUR ROOMS'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0A1931),
        elevation: 0,
      ),
      body: const RoomsListingMobileView(),
    );
  }
}

class RoomsListingMobileView extends StatelessWidget {
  const RoomsListingMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rooms = [
      {
        'name': 'The Deluxe Room',
        'image': '${AppConstants.imagePath}/delux-room.jpeg',
        'size': '35 sqm',
        'capacity': '2 Persons',
        'description':
            'Our rooms offer a harmonious blend of comfort and elegance, designed to provide an exceptional stay for every guest.',
        'type': 'deluxe',
      },
      {
        'name': 'The Executive Room',
        'image': '${AppConstants.imagePath}/executive-room.jpeg',
        'size': '40 sqm',
        'capacity': '2 Persons',
        'description':
            'Our rooms offer a harmonious blend of comfort and elegance, designed to provide an exceptional stay for every guest.',
        'type': 'executive',
      },
      {
        'name': 'The Suite Room',
        'image': '${AppConstants.imagePath}/suite-room.jpeg',
        'size': '50 sqm',
        'capacity': '3 Persons',
        'description':
            'Our rooms offer a harmonious blend of comfort and elegance, designed to provide an exceptional stay for every guest.',
        'type': 'suite',
      },
      {
        'name': 'The King Room',
        'image': '${AppConstants.imagePath}/king-room.jpeg',
        'size': '45 sqm',
        'capacity': '2 Persons',
        'description':
            'Our rooms offer a harmonious blend of comfort and elegance, designed to provide an exceptional stay for every guest.',
        'type': 'king',
      },
      {
        'name': 'The Double Rooms',
        'image': '${AppConstants.imagePath}/about-2.jpeg',
        'size': '38 sqm',
        'capacity': '4 Persons',
        'description':
            'Our rooms offer a harmonious blend of comfort and elegance, designed to provide an exceptional stay for every guest.',
        'type': 'double',
      },
    ];

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
              // Centered text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Deluxe Rooms',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'A step up from the standard room, often with better views, more space, and additional amenities.',
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

          // Room cards - Using ListView instead of GridView to avoid overflow issues
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildRoomCard(context, rooms[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCard(BuildContext context, Map<String, dynamic> room) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              room['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          // Room details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Room name
                Text(
                  room['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                ),

                const SizedBox(height: 8),

                // Room size and capacity
                Row(
                  children: [
                    Text(
                      room['size'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      room['capacity'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Room description
                Text(
                  room['description'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                // Book now button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.roomDetail,
                        arguments: {'roomType': room['type']},
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFB08968),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: Color(0xFFB08968)),
                      ),
                    ),
                    child: const Text(
                      'BOOK NOW',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
