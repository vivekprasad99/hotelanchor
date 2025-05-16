import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';

class HotelRoomsSection extends StatefulWidget {
  const HotelRoomsSection({super.key});

  @override
  State<HotelRoomsSection> createState() => _HotelRoomsSectionState();
}

class _HotelRoomsSectionState extends State<HotelRoomsSection> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> rooms = [
    {
      'name': 'The King Room',
      'image': 'king-room.jpeg',
      'size': '35 sqm',
      'capacity': '6 Person',
    },
    {
      'name': 'The Deluxe Room',
      'image': 'delux-room.jpeg',
      'size': '35 sqm',
      'capacity': '2 Person',
    },
    {
      'name': 'The Executive Room',
      'image': 'executive-room.jpeg',
      'size': '35 sqm',
      'capacity': '4 Person',
    },
    {
      'name': 'The Suite Room',
      'image': 'suite-room.jpeg',
      'size': '35 sqm',
      'capacity': '5 Person',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Room section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Room label with arrow
              Row(
                children: [
                  Icon(Icons.arrow_forward, size: 16, color: Colors.brown[400]),
                  const SizedBox(width: 8),
                  Text(
                    'Room',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.brown[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Our Rooms heading
              const Text(
                'Our Rooms',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A1931),
                ),
              ),
              const SizedBox(height: 16),

              // Room description
              Text(
                'At Hotel Anchor, we believe that a great stay begins with a great room. Whether you\'re here for a short visit or a long stay, our rooms are designed with your comfort in mind. From modern amenities to thoughtful details, each room offers a peaceful retreat where you can unwind after a busy day.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),

        // Room carousel
        CarouselSlider.builder(
          itemCount: rooms.length,
          options: CarouselOptions(
            height: 320,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: isMobile ? 0.8 : 0.4,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildRoomCard(rooms[index]);
          },
        ),

        // Carousel indicators
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              rooms.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == entry.key
                            ? const Color(0xFFB08968)
                            : Colors.grey.shade300,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildRoomCard(Map<String, dynamic> room) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Room image
            Positioned.fill(
              child: Image.asset(
                '${AppConstants.imagePath}/${room['image']}',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Dark gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Room details
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Room name
                    Text(
                      room['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Room details row
                    Row(
                      children: [
                        // Room size
                        Row(
                          children: [
                            const Icon(
                              Icons.aspect_ratio,
                              color: Colors.white70,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              room['size'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),

                        // Room capacity
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.white70,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              room['capacity'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Room price
                    Text(
                      "Price",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
