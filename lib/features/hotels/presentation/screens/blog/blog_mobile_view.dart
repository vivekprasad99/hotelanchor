import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class BlogMobileView extends StatelessWidget {
  const BlogMobileView({super.key});

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
                    'Our Blog',
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
                      'Discover The blog where luxury, comfort, and adventure come together.',
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

          // Main content area with blog posts and sidebar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Blog posts section
                _buildBlogPosts(),

                const SizedBox(height: 32),

                // Sidebar section
                _buildSidebar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogPosts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First blog post
        _buildBlogPost(
          image: '${AppConstants.imagePath}/luxury_hotel_1.webp',
          category: 'Luxury Hotel',
          title:
              'Discover Luxury: A Journey Through Our Hotel\'s Unique Offerings',
          description:
              'In today\'s world where comfort, aesthetics, beauty all walk hand in hand to establish a luxury. Whether it\'s a weekend getaway or a long-term stay, we focus on bringing in the ultimate comfort that feels like home away from home.',
          author: 'Matthew Pery',
          date: '10 Min Read',
        ),

        const SizedBox(height: 24),

        // Second blog post
        _buildBlogPost(
          image: '${AppConstants.imagePath}/luxury_hotel_2.webp',
          category: 'Luxury Hotel',
          title: 'Exclusive Deals: How to Make the Most of Your Stay at Bekimi',
          description:
              'In today\'s world where comfort, aesthetics, beauty all walk hand in hand to establish a luxury. Whether it\'s a weekend getaway or a long-term stay, we focus on bringing in the ultimate comfort that feels like home away from home.',
          author: 'Matthew Pery',
          date: '10 Min Read',
        ),
      ],
    );
  }

  Widget _buildBlogPost({
    required String image,
    required String category,
    required String title,
    required String description,
    required String author,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Blog image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 12),

        // Category
        Text(
          category,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),

        const SizedBox(height: 8),

        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
            height: 1.3,
          ),
        ),

        const SizedBox(height: 8),

        // Description
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 12),

        // Author and read time
        Row(
          children: [
            // Author avatar
            const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 16, color: Colors.white),
            ),

            const SizedBox(width: 8),

            // Author name
            Text(
              author,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),

            const SizedBox(width: 16),

            // Read time icon
            const Icon(Icons.access_time, size: 14, color: Colors.grey),

            const SizedBox(width: 4),

            // Read time
            Text(
              date,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const Spacer(),

            // Read more button
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

        const SizedBox(height: 16),

        // Divider
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }

  Widget _buildSidebar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search section
          const Text(
            'Search',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),

          const SizedBox(height: 12),

          // Search input
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Categories section
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),

          const SizedBox(height: 12),

          // Categories list
          _buildCategoryItem('Adventure Travel', '(15)'),
          _buildCategoryItem('Wellness & Mindfulness', '(8)'),
          _buildCategoryItem('Culinary World', '(5)'),
          _buildCategoryItem('Luxury Hotels', '(10)'),
          _buildCategoryItem('Solo Traveling Guide', '(6)'),

          const SizedBox(height: 24),

          // Latest posts section
          const Text(
            'Latest Post',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),

          const SizedBox(height: 12),

          // Latest posts list
          _buildLatestPostItem(
            image: '${AppConstants.imagePath}/luxury_hotel_1.webp',
            title: 'Top 10 Reasons Making Luxe Staying at Bekimi',
            date: '10 Min Read',
          ),

          _buildLatestPostItem(
            image: '${AppConstants.imagePath}/luxury_hotel_2.webp',
            title: 'Top 10 Reasons Making Luxe Staying at Bekimi',
            date: '10 Min Read',
          ),

          _buildLatestPostItem(
            image: '${AppConstants.imagePath}/luxury_hotel_2.webp',
            title: 'Top 10 Reasons Making Luxe Staying at Bekimi',
            date: '10 Min Read',
          ),

          const SizedBox(height: 24),

          // Tags section
          const Text(
            'Tags',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1931),
            ),
          ),

          const SizedBox(height: 12),

          // Tags cloud
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTag('Hotel Tips'),
              _buildTag('Travel Blog'),
              _buildTag('Luxury Experience'),
              _buildTag('Hotel Guide'),
              _buildTag('Luxury Rooms'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, String count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Text(count, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildLatestPostItem({
    required String image,
    required String title,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Post image
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),

          const SizedBox(width: 12),

          // Post details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0A1931),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                // Read time
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: Colors.grey),

                    const SizedBox(width: 4),

                    Text(
                      date,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
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

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 12, color: Colors.black54),
      ),
    );
  }
}
