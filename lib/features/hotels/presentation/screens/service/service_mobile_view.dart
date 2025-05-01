import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';

class ServiceMobileView extends StatelessWidget {
  const ServiceMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner image with overlay text (exactly as shown in the image)
          Stack(
            alignment: Alignment.center,
            children: [
              // Background image
              Image.asset(
                '${AppConstants.imagePath}/header__bg.webp', // Using existing header__bg.webp image
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
              // Text content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Our Service',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'At Anchor we pride ourselves on delivering an exceptional experience.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Service features grid - based on the image
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // First row
                Row(
                  children: [
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.wifi,
                        title: 'All A/C Rooms with Wi-Fi',
                        description:
                            'Enjoy ultimate comfort in our well-appointed air conditioned rooms, designed to provide a restful and comforting stay with Wi-Fi.',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.power,
                        title: '24 hour power backup',
                        description:
                            'With our reliable 24-hour power backup, you can rest assured that you won\'t experience any interruptions during your stay.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Second row
                Row(
                  children: [
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.fitness_center,
                        title: 'Fitness Center',
                        description:
                            'A fitness center is a vibrant and dynamic environment designed to promote health and Fitness Center well-being.',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.business_center,
                        title: 'Banquet & Conference Hall',
                        description:
                            'Perfect for corporate events, weddings, or any special occasion, our spacious banquet and conference halls.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Third row
                Row(
                  children: [
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.restaurant,
                        title: 'Retruant and rooftop space',
                        description:
                            'Relish a variety of delicious cuisines in our in-house restaurant, offering both local and international dishes prepared by our expert chefs.',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.videocam,
                        title: 'CCTV Surveillance',
                        description:
                            'Your safety and security are our top priority. Our premises are under continuous CCTV surveillance to ensure a secure and safe environment.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Fourth row
                Row(
                  children: [
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.cleaning_services,
                        title: 'Daily Housekeeping',
                        description:
                            'Our housekeeping team ensures that your room is clean, comfortable, and well-maintained every day, so you can relax and enjoy your stay.',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildServiceFeature(
                        icon: Icons.local_parking,
                        title: 'Lift Facilities & Free Parking',
                        description:
                            'We offer ample parking space at no additional charge, so you can enjoy a stress-free experience when visiting.',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Our Services section (from the second image)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Our Services heading with arrow
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Our Services',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Our Services title
                const Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Hotel and restaurant section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel and restaurant subtitle
                    const Text(
                      'Hotel and restaurant',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Hotel and restaurant title
                    const Text(
                      'Hotel and restaurant',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1931),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Hotel and restaurant content
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side - image
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              '${AppConstants.imagePath}/3.webp', // Add this image to assets
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Right side - text
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'At Hotel Anchor, we provide a seamless, luxurious experience with a focus on comfort and relaxation. Our rooms come with Wi-Fi, 24-hour power backup, and CCTV surveillance. Your stay extends to our modern banquet and conference halls, and you can enjoy a variety of local and international cuisines at our restaurant. We also offer amenities like CCTV surveillance and on-site security. Additional services include free parking, lift facilities, and housekeeping to ensure your stay is comfortable and hassle-free.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Read More button
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Read More',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFD4AF37),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Romantic Getaway section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Romantic Getaway subtitle
                    const Text(
                      'Romantic Getaway',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Romantic Getaway title
                    const Text(
                      'Romantic Getaway',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1931),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Romantic Getaway content
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side - text
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hotel Anchor offers a memorable escape for lovebirds. Our Romantic Getaway package includes a decorated room, a breakfast in bed, complete with a bottle of champagne and chocolates to welcome you. Enjoy a scenic location for that special romantic experience. Our attentive staff ensures your privacy while being available to assist with any special requests. Whether you\'re celebrating an anniversary, honeymoon, or simply want to spend quality time with your special someone, our romantic getaway is the perfect choice.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Read More button
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Read More',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFD4AF37),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Right side - image
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              '${AppConstants.imagePath}/4.webp', // Add this image to assets
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceFeature({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Icon(
          icon,
          size: 28,
          color: const Color(0xFFD4AF37), // Gold color
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
        Text(
          description,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
