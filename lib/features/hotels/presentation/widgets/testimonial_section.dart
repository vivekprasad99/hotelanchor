import 'package:flutter/material.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _testimonials = [
    {
      'image': 'assets/images/author-2x.webp',
      'rating': 5,
      'quote':
          'Choosing Hotel Anchor was one of the best decisions we\'ve ever made. They have proven to be a reliable and innovative partner, always ready to tackle new challenges with and expertise. Their commitment to and delivering tailored service is exceptional.',
      'name': 'Emran Hossain',
      'position': 'CEO of Apex Solutions',
    },
    {
      'image': 'assets/images/author-5.webp',
      'rating': 5,
      'quote':
          'Our stay at Hotel Anchor exceeded all expectations. The rooms were immaculate, the staff attentive, and the dining experience was world-class. We\'ll definitely be returning for our next business retreat.',
      'name': 'Sarah Johnson',
      'position': 'Marketing Director, Global Tech',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Testimonial heading with arrow
        Row(
          children: [
            Icon(Icons.arrow_forward, size: 16, color: Colors.brown[400]),
            const SizedBox(width: 8),
            Text(
              'Testimonial',
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // What Our Client Say heading
        const Text(
          'What Our Client Say',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
            height: 1.3,
          ),
        ),
        const SizedBox(height: 32),

        // Testimonial carousel
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _testimonials.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildTestimonialCard(_testimonials[index]);
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _testimonials.length,
            (index) => _buildIndicator(index == _currentPage),
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialCard(Map<String, dynamic> testimonial) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Client photo
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(testimonial['image']),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 24),

          // Testimonial content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Star rating
                Row(
                  children: List.generate(
                    testimonial['rating'],
                    (index) => const Icon(
                      Icons.star,
                      color: Color(0xFFFFB800),
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Quote
                Text(
                  testimonial['quote'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.6,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),

                // Name
                Text(
                  testimonial['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1931),
                  ),
                ),
                const SizedBox(height: 4),

                // Position
                Text(
                  testimonial['position'],
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFB08968) : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
