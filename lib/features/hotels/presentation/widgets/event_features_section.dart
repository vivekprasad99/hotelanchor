import 'package:flutter/material.dart';

class EventFeaturesSection extends StatelessWidget {
  const EventFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device (narrow screen)
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Why Choose Our Events',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          isMobile ? _buildMobileFeaturesList() : _buildDesktopFeaturesList(),
        ],
      ),
    );
  }

  Widget _buildMobileFeaturesList() {
    return Column(
      children: [
        _buildFeatureItem(
          icon: Icons.security,
          title: '24-Hour Security',
          description:
              'A 24-hour security service provides and surveillance, properties, or sensitive information around the clock.',
        ),
        const SizedBox(height: 30),
        _buildFeatureItem(
          icon: Icons.wifi,
          title: 'Free Wifi',
          description:
              'Free Wi-Fi has become an essential service in our increasingly connected world. It by people to access the internet',
        ),
        const SizedBox(height: 30),
        _buildFeatureItem(
          icon: Icons.hotel,
          title: 'Quality Room',
          description:
              'A fitness center is a vibrant and dynamic environment designed to promote health and Fitness Center well-being.',
        ),
        const SizedBox(height: 30),
        _buildFeatureItem(
          icon: Icons.airport_shuttle,
          title: 'Airport transport',
          description:
              'Airport transportation plays a crucial role in travel experiences for passengers. It various services, including taxis, ride-sharing',
        ),
      ],
    );
  }

  Widget _buildDesktopFeaturesList() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.security,
            title: '24-Hour Security',
            description:
                'A 24-hour security service provides and surveillance, properties, or sensitive information around the clock.',
          ),
        ),
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.wifi,
            title: 'Free Wifi',
            description:
                'Free Wi-Fi has become an essential service in our increasingly connected world. It by people to access the internet',
          ),
        ),
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.hotel,
            title: 'Quality Room',
            description:
                'A fitness center is a vibrant and dynamic environment designed to promote health and Fitness Center well-being.',
          ),
        ),
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.airport_shuttle,
            title: 'Airport transport',
            description:
                'Airport transportation plays a crucial role in travel experiences for passengers. It various services, including taxis, ride-sharing',
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFB08968), width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, size: 30, color: const Color(0xFFB08968)),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
