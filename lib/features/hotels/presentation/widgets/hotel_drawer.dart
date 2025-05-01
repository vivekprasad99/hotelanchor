import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';

class HotelDrawer extends StatelessWidget {
  final int selectedIndex;
  final bool isExpanded;
  final Function(int) onItemTapped;
  final Function(bool) onExpansionChanged;

  const HotelDrawer({
    Key? key,
    required this.selectedIndex,
    required this.isExpanded,
    required this.onItemTapped,
    required this.onExpansionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '${AppConstants.imagePath}/logo.png',
                  width: 70,
                  height: 70,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hotel Anchor',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              // Navigate to home screen
              onItemTapped(0);
              // No need to use Navigator here as it's handled in _onItemTapped
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            selected: selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            selected: selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
              Navigator.pushReplacementNamed(context, '/gallery');
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.pages),
            title: const Text('Pages'),
            initiallyExpanded: isExpanded,
            onExpansionChanged: onExpansionChanged,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 72),
                title: const Text('Restaurant'),
                selected: selectedIndex == 31,
                onTap: () => onItemTapped(31),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 72),
                title: const Text('Event'),
                selected: selectedIndex == 32,
                onTap: () => onItemTapped(32),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Blog'),
            selected: selectedIndex == 4,
            onTap: () => onItemTapped(4),
          ),
          ListTile(
            leading: const Icon(Icons.room_service),
            title: const Text('Service'),
            selected: selectedIndex == 5,
            onTap: () => onItemTapped(5),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            selected: selectedIndex == 6,
            onTap: () => onItemTapped(6),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Ranchi'),
            enabled: false,
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('93412 82117'),
            enabled: false,
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('65131 01329'),
            enabled: false,
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('hotelanchorranchi@gmail.com'),
            enabled: false,
            dense: true,
          ),
        ],
      ),
    );
  }
}
