import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class HotelGallerySection extends StatefulWidget {
  const HotelGallerySection({super.key});

  @override
  State<HotelGallerySection> createState() => _HotelGallerySectionState();
}

class _HotelGallerySectionState extends State<HotelGallerySection> {
  int _currentIndex = 0;

  // List of gallery images
  final List<String> galleryImages = [
    'gallery_1.jpeg',
    'gallery_2.jpeg',
    'gallery_3.jpeg',
    'gallery_4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      children: [
        // Gallery banner
        const SizedBox(height: 32),

        // Gallery header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Color(0xFFB08968),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      color: const Color(0xFFB08968),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Color(0xFFB08968),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Our Gallery',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),

        // Gallery carousel
        CarouselSlider.builder(
          itemCount: galleryImages.length,
          options: CarouselOptions(
            height: isMobile ? 200 : 350,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: isMobile ? 0.8 : 0.5,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
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
                child: Image.asset(
                  '${AppConstants.imagePath}/${galleryImages[index]}',
                  fit: BoxFit.cover,
                  width: double.infinity,
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
            );
          },
        ),

        // Carousel indicators
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              galleryImages.asMap().entries.map((entry) {
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
}
