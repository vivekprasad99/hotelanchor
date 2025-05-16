import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';

class SpecialOffersSection extends StatelessWidget {
  const SpecialOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Special Offer header with arrow
          Row(
            children: [
              const Icon(
                Icons.arrow_forward,
                size: 16,
                color: Color(0xFFB08968),
              ),
              const SizedBox(width: 8),
              Text(
                'Special Offer',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.brown[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Main heading
          const Text(
            'Special Offer',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),

          // Offer description
          Text(
            'Experience the ultimate in luxury and relaxation with our exclusive special offer! Book your stay now and enjoy 20% off our best available rates.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Family Fun Package
          _buildOfferCard(
            context,
            title: 'Family Fun Package',
            image: '${AppConstants.imagePath}/1.webp',
            features: [
              '15% off on family suites',
              'Free meals for kids under 12',
              'Complimentary tickets',
              'In-hotel entertainment pack',
              'Daily family-friendly activities',
            ],
          ),
          const SizedBox(height: 24),

          // Spa Retreat
          _buildOfferCard(
            context,
            title: 'Spa Retreat',
            image: '${AppConstants.imagePath}/3.webp',
            features: [
              'A two-night stay in a premium room',
              'Daily spa treatments',
              'Healthy breakfast and lunch options',
              'Access to all spa facilities',
              '20% off for stays of 7 nights or more',
            ],
          ),
          const SizedBox(height: 24),

          // Business Traveler Special
          _buildOfferCard(
            context,
            title: 'Business Traveler Special',
            image: '${AppConstants.imagePath}/2.webp',
            features: [
              '10% off on executive rooms',
              'Complimentary high-speed Wi-Fi',
              'Access to the business lounge',
              'Free airport shuttle service',
              'Daily laundry service',
            ],
          ),
          const SizedBox(height: 24),

          // Romantic Getaway
          _buildOfferCard(
            context,
            title: 'Romantic Getaway',
            image: '${AppConstants.imagePath}/4.webp',
            features: [
              'A two-night stay in a deluxe suite',
              'A bottle of champagne and chocolates',
              'Romantic dinner for two',
              'Couples massage at our spa',
              'Late checkout option',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard(
    BuildContext context, {
    required String title,
    required String image,
    required List<String> features,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
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

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                ),
                const SizedBox(height: 12),

                // Features
                ...features
                    .map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              size: 16,
                              color: Color(0xFFB08968),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),

                const SizedBox(height: 16),

                // Book Now button with WhatsApp integration
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.contact);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB08968),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
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
