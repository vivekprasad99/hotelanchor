import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/contact_banner.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_location_info.dart';

class ContactMobileView extends StatelessWidget {
  const ContactMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner with "Contact Us" text
          const ContactBanner(),

          // Contact form section
          _buildContactForm(),

          // Contact info cards
          _buildContactInfo(),

          // Hotel location and info section
          const HotelLocationInfo(),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Fill out the form below and we\'ll get back to you as soon as possible.',
            style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
          ),
          const SizedBox(height: 24),

          // Name field
          _buildTextField(
            label: 'Your Name',
            hintText: 'Enter your full name',
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 16),

          // Email field
          _buildTextField(
            label: 'Email Address',
            hintText: 'Enter your email address',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          // Phone field
          _buildTextField(
            label: 'Phone Number',
            hintText: 'Enter your phone number',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),

          // Message field
          _buildTextField(
            label: 'Your Message',
            hintText: 'How can we help you?',
            prefixIcon: Icons.message_outlined,
            maxLines: 4,
          ),
          const SizedBox(height: 24),

          // Submit button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB08968),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Send Message',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),
          const SizedBox(height: 24),

          // Address card
          _buildInfoCard(
            icon: Icons.location_on,
            title: 'Our Address',
            subtitle: 'Ranchi, Jharkhand, India',
          ),
          const SizedBox(height: 16),

          // Phone card
          _buildInfoCard(
            icon: Icons.phone,
            title: 'Phone Number',
            subtitle: '+91 93412 82117',
          ),
          const SizedBox(height: 16),

          // Email card
          _buildInfoCard(
            icon: Icons.email,
            title: 'Email Address',
            subtitle: 'hotelanchorranchi@gmail.com',
          ),

          const SizedBox(height: 24),

          // Social media section
          const Text(
            'Follow Us',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),
          const SizedBox(height: 16),

          // Social media icons
          Row(
            children: [
              _buildSocialIcon(Icons.facebook),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.camera_alt), // Instagram
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.phone), // WhatsApp
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.grey[300],
      child: const Center(
        child: Text(
          'Google Map will be displayed here',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0A1931),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon, color: const Color(0xFFB08968)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFB08968), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFB08968).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFB08968), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFB08968),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
