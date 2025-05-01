import 'package:flutter/material.dart';

class HotelFacilitiesSection extends StatelessWidget {
  const HotelFacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Facilities heading with arrow
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back, size: 16, color: Colors.brown[400]),
            const SizedBox(width: 8),
            Text(
              'Facilities',
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 16, color: Colors.brown[400]),
          ],
        ),
        const SizedBox(height: 16),

        // Hotel Facilities heading
        const Center(
          child: Text(
            'Hotel Facilities',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 24),

        _buildFacilitiesGrid(),
      ],
    );
  }

  Widget _buildFacilitiesGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.7,
      children: [
        _buildFacilityItem(
          icon: Icons.ac_unit,
          title: 'All A/C Rooms with Wi-Fi',
          description:
              'Relax in our spacious, air-conditioned rooms with free high-speed internet, perfect for both work and relaxation.',
          iconColor: const Color(0xFFD4AF37),
        ),
        _buildFacilityItem(
          icon: Icons.power,
          title: '24 Hour Power Backup',
          description:
              'No more worries to your stay with our reliable power backup system.',
          iconColor: const Color(0xFFD4AF37),
        ),
        _buildFacilityItem(
          icon: Icons.meeting_room,
          title: 'Banquet & Conference Halls',
          description:
              'Perfect for weddings, corporate events, and other special occasions, our versatile event spaces are equipped with modern amenities.',
          iconColor: const Color(0xFFD4AF37),
        ),
        _buildFacilityItem(
          icon: Icons.restaurant,
          title: 'Restaurant & Rooftop Lounge',
          description:
              'Savor exquisite dishes at our restaurant or unwind at the rooftop lounge with panoramic city views.',
          iconColor: const Color(0xFFD4AF37),
        ),
      ],
    );
  }

  Widget _buildFacilityItem({
    required IconData icon,
    required String title,
    required String description,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: iconColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),
          const SizedBox(height: 8),

          // Description
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                height: 1.4,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
