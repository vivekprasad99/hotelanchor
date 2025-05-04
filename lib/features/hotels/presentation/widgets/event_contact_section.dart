import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class EventContactSection extends StatelessWidget {
  const EventContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device (narrow screen)
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${AppConstants.imagePath}/cta__bg.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reach Out to Us Today and Join Our Event',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 24),

        _buildContactCard(
          icon: Icons.phone,
          title: 'Reservation By Phone',
          content: '06513101329',
          onTap: () => _launchUrl('tel:06513101329'),
        ),

        const SizedBox(height: 16),

        _buildContactCard(
          icon: Icons.email,
          title: 'Reservation By Email',
          content: 'lorem@gmail.com',
          onTap: () => _launchUrl('mailto:lorem@gmail.com'),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reach Out to Us Today and Join Our Event',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(
              child: _buildContactCard(
                icon: Icons.phone,
                title: 'Reservation By Phone',
                content: '06513101329',
                onTap: () => _launchUrl('tel:06513101329'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildContactCard(
                icon: Icons.email,
                title: 'Reservation By Email',
                content: 'lorem@gmail.com',
                onTap: () => _launchUrl('mailto:lorem@gmail.com'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
