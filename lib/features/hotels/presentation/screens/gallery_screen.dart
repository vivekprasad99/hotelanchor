import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_drawer.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_gallery_section.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/gallery_detail_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedIndex = 2; // 2 for Gallery in drawer
  bool _isExpanded = false;

  // List of gallery images
  final List<String> galleryImages = [
    'gallery_1.jpeg',
    'gallery_2.jpeg',
    'gallery_3.jpeg',
    'gallery_4.jpeg',
    'about-1.jpeg',
    'about-2.jpeg',
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Already on Gallery screen, just close drawer
      Navigator.pop(context);
      return;
    }

    setState(() {
      _selectedIndex = index;
    });

    // Close drawer first
    Navigator.pop(context);

    // Handle navigation based on selected index
    if (index == 0) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      // Navigate to About
      Navigator.pushReplacementNamed(context, '/about');
    }
    // Other navigation options will be added later
  }

  void _onExpansionChanged(bool expanded) {
    setState(() {
      _isExpanded = expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      drawer: HotelDrawer(
        selectedIndex: _selectedIndex,
        isExpanded: _isExpanded,
        onItemTapped: _onItemTapped,
        onExpansionChanged: _onExpansionChanged,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  '${AppConstants.imagePath}/gallery_banner.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black.withOpacity(0.5),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'where every image tells a story of luxury, comfort, and unparalleled hospitality',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Gallery Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Photo Gallery',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explore our hotel through these captivating images',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 24),

                  // Grid of images
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: galleryImages.length,
                    itemBuilder: (context, index) {
                      final String imagePath =
                          '${AppConstants.imagePath}/${galleryImages[index]}';
                      final String heroTag =
                          'gallery_grid_${galleryImages[index]}';

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => GalleryDetailScreen(
                                    imagePath: imagePath,
                                    tag: heroTag,
                                  ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Hero(
                            tag: heroTag,
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Carousel section for featured images
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Featured Images',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const HotelGallerySection(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
