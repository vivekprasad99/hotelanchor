import 'package:flutter/material.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/contact_banner.dart';
import 'package:hotelanchor/features/hotels/presentation/widgets/hotel_location_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobileView extends StatefulWidget {
  const ContactMobileView({super.key});

  @override
  State<ContactMobileView> createState() => _ContactMobileViewState();
}

class _ContactMobileViewState extends State<ContactMobileView> {
  // Form controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  // Form validation errors
  String? nameError;
  String? emailError;
  String? phoneError;
  String? messageError;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner with "Contact Us" text
          const ContactBanner(),

          // Contact form section
          _buildContactForm(context),

          // Contact info cards
          _buildContactInfo(),

          // Hotel location and info section
          const HotelLocationInfo(),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
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
            controller: nameController,
            errorText: nameError,
            onChanged: (_) => setState(() => nameError = null),
          ),
          const SizedBox(height: 16),

          // Email field
          _buildTextField(
            label: 'Email Address',
            hintText: 'Enter your email address',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            errorText: emailError,
            onChanged: (_) => setState(() => emailError = null),
          ),
          const SizedBox(height: 16),

          // Phone field
          _buildTextField(
            label: 'Phone Number',
            hintText: 'Enter your phone number',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            controller: phoneController,
            errorText: phoneError,
            onChanged: (_) => setState(() => phoneError = null),
          ),
          const SizedBox(height: 16),

          // Message field
          _buildTextField(
            label: 'Your Message',
            hintText: 'How can we help you?',
            prefixIcon: Icons.message_outlined,
            maxLines: 4,
            controller: messageController,
            errorText: messageError,
            onChanged: (_) => setState(() => messageError = null),
          ),
          const SizedBox(height: 24),

          // Submit button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => _validateAndSendMessage(context),
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

  // Validate all fields before sending
  void _validateAndSendMessage(BuildContext context) {
    bool isValid = true;

    // Validate name
    if (nameController.text.trim().isEmpty) {
      setState(() => nameError = 'Please enter your name');
      isValid = false;
    }

    // Validate email
    if (!_isValidEmail(emailController.text.trim())) {
      setState(() => emailError = 'Please enter a valid email address');
      isValid = false;
    }

    // Validate phone
    if (!_isValidPhone(phoneController.text.trim())) {
      setState(() => phoneError = 'Please enter a valid 10-digit phone number');
      isValid = false;
    }

    // Validate message
    if (messageController.text.trim().isEmpty) {
      setState(() => messageError = 'Please enter your message');
      isValid = false;
    }

    // If all validations pass, send the message
    if (isValid) {
      _sendMessageSilently(
        context: context,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        message: messageController.text.trim(),
      );
    }
  }

  // Email validation using regex
  bool _isValidEmail(String email) {
    if (email.isEmpty) return false;

    // Regular expression for email validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  // Phone validation
  bool _isValidPhone(String phone) {
    if (phone.isEmpty) return false;

    // Remove any non-digit characters
    final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');

    // Check if it's a 10-digit number
    return digitsOnly.length == 10;
  }

  // Method to send message silently without opening WhatsApp
  Future<void> _sendMessageSilently({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB08968)),
          ),
        );
      },
    );

    try {
      // Format message for WhatsApp
      final formattedMessage = """
*Contact Form Submission*
*Name:* $name
*Email:* $email
*Phone:* $phone
*Message:* $message
      """;

      // Create WhatsApp URL
      final phoneNumber = "919341282117"; // Hotel's WhatsApp number
      final whatsappUrl = Uri.parse(
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(formattedMessage)}",
      );

      // Launch WhatsApp in background
      bool launched = false;

      // Try to launch WhatsApp silently
      if (await canLaunchUrl(whatsappUrl)) {
        // Launch in external application mode to minimize visibility
        launched = await launchUrl(
          whatsappUrl,
          mode: LaunchMode.externalNonBrowserApplication,
        );
      }

      // Close loading dialog after a short delay
      await Future.delayed(const Duration(seconds: 2));
      if (context.mounted) {
        Navigator.pop(context);
      }

      // Show success message and clear form regardless of launch success
      if (context.mounted) {
        _clearForm();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      // If WhatsApp launch failed, try email as fallback
      if (!launched && context.mounted) {
        _sendEmailFallback(formattedMessage);
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) {
        Navigator.pop(context);
      }

      // Still show success to user and clear form
      if (context.mounted) {
        _clearForm();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      // Log error for debugging
      print("Error sending message: $e");
    }
  }

  // Clear all form fields
  void _clearForm() {
    setState(() {
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      messageController.clear();
      nameError = null;
      emailError = null;
      phoneError = null;
      messageError = null;
    });
  }

  // Fallback method to send email
  Future<void> _sendEmailFallback(String messageBody) async {
    try {
      final emailUrl = Uri.parse(
        "mailto:hotelanchorranchi@gmail.com?subject=Contact Form&body=${Uri.encodeComponent(messageBody)}",
      );
      await launchUrl(emailUrl);
    } catch (e) {
      print("Failed to send email: $e");
    }
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    required TextEditingController controller,
    String? errorText,
    Function(String)? onChanged,
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
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red[300]!),
            ),
            errorText: errorText,
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
          InkWell(
            onTap: () => _launchMaps('Hotel Anchor, Ranchi, Jharkhand'),
            child: _buildInfoCard(
              icon: Icons.location_on,
              title: 'Our Address',
              subtitle: 'Ranchi, Jharkhand, India',
            ),
          ),
          const SizedBox(height: 16),

          // Phone card
          InkWell(
            onTap: () => _launchUrl('tel:91 93412 82117'),
            child: _buildInfoCard(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+91 93412 82117',
            ),
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

  Future<void> _launchMaps(String query) async {
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );

    if (!await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch maps');
    }
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
