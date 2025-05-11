import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/screens/contact/contact_mobile_view.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: const Color(0xFFB08968),
        foregroundColor: Colors.white,
      ),
      body: const ContactMobileView(),
    );
  }
}
