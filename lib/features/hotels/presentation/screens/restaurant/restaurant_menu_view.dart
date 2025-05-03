import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class RestaurantMenuView extends StatefulWidget {
  const RestaurantMenuView({super.key});

  @override
  State<RestaurantMenuView> createState() => _RestaurantMenuViewState();
}

class _RestaurantMenuViewState extends State<RestaurantMenuView> {
  String _selectedCategory = 'Small Plates';

  final List<String> _categories = [
    'Small Plates',
    'Cold Appetizers',
    'Vegetarian & Vegan',
    'Burgers & Sandwiches',
    'Dips & Spreads',
    'Seafood Specialties',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu heading
            Row(
              children: [
                Icon(Icons.arrow_forward, size: 16, color: Colors.brown[400]),
                const SizedBox(width: 8),
                Text(
                  'Menu',
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
              'Restaurant Menu',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1931),
              ),
            ),

            const SizedBox(height: 12),

            // Description text
            const Text(
              'Our rooms offer a harmonious blend of comfort and elegance, designed to provide an exceptional stay for every guest.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // Category selection - horizontal scrollable
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == _selectedCategory;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelected
                                ? const Color(0xFFB78A28)
                                : Colors.grey[200],
                        foregroundColor:
                            isSelected ? Colors.white : Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(category),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Menu items
            _buildMenuItem(
              image: '${AppConstants.imagePath}/hotel_food_1.jpg',
              title: 'Tuscan Herb-Crusted Chicken',
              description: 'Salted caramel Puff pastry,salad',
              price: '699',
            ),

            const Divider(height: 24),

            _buildMenuItem(
              image: '${AppConstants.imagePath}/hotel_food_2.jpg',
              title: 'Classic Bolognese with Fresh',
              description: 'Salted caramel Puff pastry,salad',
              price: '699',
            ),

            const Divider(height: 24),

            _buildMenuItem(
              image: '${AppConstants.imagePath}/hotel_food_3.jpg',
              title: 'Tuscan Herb-Crusted Chicken',
              description: 'Salted caramel Puff pastry,salad',
              price: '699',
            ),

            const Divider(height: 24),

            _buildMenuItem(
              image: '${AppConstants.imagePath}/hotel_food_4.jpg',
              title: 'Classic Bolognese with Fresh',
              description: 'Salted caramel Puff pastry,salad',
              price: '699',
            ),

            const Divider(height: 24),

            _buildMenuItem(
              image: '${AppConstants.imagePath}/hotel_food_5.jpg',
              title: 'Tuscan Herb-Crusted Chicken',
              description: 'Salted caramel Puff pastry,salad',
              price: '699',
            ),

            const Divider(height: 24),

            _buildMenuItem(
              image: '${AppConstants.imagePath}/hotel_food_6.jpg',
              title: 'Classic Bolognese with Fresh',
              description: 'Salted caramel Puff pastry,salad',
              price: '699',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String image,
    required String title,
    required String description,
    required String price,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Food image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
        ),

        const SizedBox(width: 16),

        // Food details
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
                description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),

        // Price
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
          ),
        ),
      ],
    );
  }
}
