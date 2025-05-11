import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelLocationInfo extends StatefulWidget {
  const HotelLocationInfo({super.key});

  @override
  State<HotelLocationInfo> createState() => _HotelLocationInfoState();
}

class _HotelLocationInfoState extends State<HotelLocationInfo> {
  // Hotel Anchor coordinates in Ranchi
  static const LatLng _hotelLocation = LatLng(
    23.3700,
    85.3400,
  ); // Approximate coordinates

  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('hotel_anchor'),
        position: _hotelLocation,
        infoWindow: const InfoWindow(
          title: 'Hotel Anchor',
          snippet: 'Tiril Rd, Kokar, Ranchi, Jharkhand 834001',
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device (narrow screen)
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.white,
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map section
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _buildGoogleMap(250),
          ),
        ),
        const SizedBox(height: 24),

        // Hotel Info Center
        _buildInfoSection(
          title: 'Hotel Info Center',
          items: [
            InfoItem(label: 'Open Hours:', value: 'Monday - Sunday'),
            InfoItem(label: 'Telephone:', value: '93412 82117', isPhone: true),
            InfoItem(label: 'Fax:', value: '65131 01329'),
            InfoItem(
              label: 'Email:',
              value: 'hotelanchorranchi@gmail.com',
              isEmail: true,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Hotel Location
        _buildInfoSection(
          title: 'Hotel Location',
          items: [
            InfoItem(
              label: 'Address:',
              value: 'Tiril Rd, Kokar, Ranchi, Jharkhand 834001',
              isAddress: true,
            ),
            InfoItem(label: 'Telephone:', value: '93412 82117', isPhone: true),
            InfoItem(label: 'Fax:', value: '65131 01329'),
            InfoItem(
              label: 'Email:',
              value: 'hotelanchorranchi@gmail.com',
              isEmail: true,
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Directions button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _launchMaps('Hotel Anchor, Ranchi, Jharkhand'),
            icon: const Icon(Icons.directions),
            label: const Text('Get Directions'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB08968),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map section (left side)
        Expanded(
          flex: 1,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildGoogleMap(400),
            ),
          ),
        ),

        const SizedBox(width: 24),

        // Info sections (right side)
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hotel Info Center
              _buildInfoSection(
                title: 'Hotel Info Center',
                items: [
                  InfoItem(label: 'Open Hours:', value: 'Monday - Sunday'),
                  InfoItem(
                    label: 'Telephone:',
                    value: '93412 82117',
                    isPhone: true,
                  ),
                  InfoItem(label: 'Fax:', value: '65131 01329'),
                  InfoItem(
                    label: 'Email:',
                    value: 'hotelanchorranchi@gmail.com',
                    isEmail: true,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Hotel Location
              _buildInfoSection(
                title: 'Hotel Location',
                items: [
                  InfoItem(
                    label: 'Address:',
                    value: 'Tiril Rd, Kokar, Ranchi, Jharkhand 834001',
                    isAddress: true,
                  ),
                  InfoItem(
                    label: 'Telephone:',
                    value: '93412 82117',
                    isPhone: true,
                  ),
                  InfoItem(label: 'Fax:', value: '65131 01329'),
                  InfoItem(
                    label: 'Email:',
                    value: 'hotelanchorranchi@gmail.com',
                    isEmail: true,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Directions button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      () => _launchMaps('Hotel Anchor, Ranchi, Jharkhand'),
                  icon: const Icon(Icons.directions),
                  label: const Text('Get Directions'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB08968),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(double height) {
    return SizedBox(
      height: height,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _hotelLocation,
          zoom: 15,
        ),
        markers: _markers,
        mapType: MapType.normal,
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required List<InfoItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => _buildInfoRow(item)).toList(),
      ],
    );
  }

  Widget _buildInfoRow(InfoItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              item.label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0A1931),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (item.isPhone) {
                  _launchUrl('tel:${item.value}');
                } else if (item.isEmail) {
                  _launchUrl('mailto:${item.value}');
                } else if (item.isAddress) {
                  _launchMaps(item.value);
                }
              },
              child: Text(
                item.value,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      (item.isPhone || item.isEmail || item.isAddress)
                          ? const Color(0xFFB08968)
                          : Colors.black87,
                  decoration:
                      (item.isPhone || item.isEmail || item.isAddress)
                          ? TextDecoration.underline
                          : null,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFB08968),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchMaps(String query) async {
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );

    if (!await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch maps');
    }
  }
}

class InfoItem {
  final String label;
  final String value;
  final bool isPhone;
  final bool isEmail;
  final bool isAddress;

  InfoItem({
    required this.label,
    required this.value,
    this.isPhone = false,
    this.isEmail = false,
    this.isAddress = false,
  });
}
