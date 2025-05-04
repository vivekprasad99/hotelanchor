import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/event/event_detail_view.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/event_contact_section.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/event_features_section.dart';

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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Our diverse range of activities is designed to offer something for everyone.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Featured events section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured events heading
                const Text(
                  'Featured Events',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                ),

                const SizedBox(height: 16),

                // First featured event - Charity Gala
                _buildFeaturedEvent(
                  context,
                  eventId: 'charity_gala',
                  imageUrl: '${AppConstants.imagePath}/event_1.webp',
                  title: 'A Night of Hope: Our Charity Gala Room',
                  description:
                      'Step into an evening of elegance, compassion, and unforgettable memories at Hotel Anchor\'s Charity Gala Room, designed to inspire and uplift. The sophisticated space transforms into a beacon of hope for charitable causes.',
                  stats: [
                    {'value': '1000+', 'label': 'Guest Served'},
                    {'value': '100+', 'label': 'Service Days'},
                    {'value': '10+', 'label': 'Special Events'},
                  ],
                ),

                const SizedBox(height: 24),

                // Second featured event - Food & Wine Festival
                _buildFeaturedEvent(
                  context,
                  eventId: 'food_wine_festival',
                  imageUrl: '${AppConstants.imagePath}/event_2.webp',
                  title:
                      'Taste of Luxury: Food & Wine Festival at Hotel Anchor',
                  description:
                      'Indulge your senses in a celebration of culinary excellence at the Taste of Luxury Food & Wine Festival. This annual gathering brings together renowned chefs, vintage wineries, fine food, and enthusiasts.',
                  stats: [
                    {'value': '500+', 'label': 'Guests Per Day'},
                    {'value': '70+', 'label': 'Specialty Food'},
                    {'value': '45+', 'label': 'Special Wines'},
                  ],
                ),

                const SizedBox(height: 32),

                EventContactSection(),
                const SizedBox(height: 32),

                EventFeaturesSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedEvent(
    BuildContext context, {
    required String eventId,
    required String imageUrl,
    required String title,
    required String description,
    required List<Map<String, String>> stats,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      stats.map((stat) {
                        return Column(
                          children: [
                            Text(
                              stat['value']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A1931),
                              ),
                            ),
                            Text(
                              stat['label']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEventCard(
    BuildContext context, {
    required String imageUrl,
    required String title,
    required String date,
    required String time,
  }) {
    return GestureDetector(
      onTap: () {
        // Add navigation to event detail view here
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A1931),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$date at $time',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
