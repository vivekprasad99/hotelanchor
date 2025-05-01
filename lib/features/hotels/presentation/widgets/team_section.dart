import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if device is in portrait or landscape
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine number of columns based on screen width
    int crossAxisCount = 2;
    if (screenWidth > 600) {
      crossAxisCount = 4;
    } else if (screenWidth <= 320) {
      crossAxisCount = 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Team heading with arrows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back, size: 16, color: Color(0xFFB08968)),
            const SizedBox(width: 8),
            Text(
              'Our Team',
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 16, color: Color(0xFFB08968)),
          ],
        ),
        const SizedBox(height: 16),

        // Meet The Team heading
        const Text(
          'Meet The Team',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
            height: 1.3,
          ),
        ),
        const SizedBox(height: 32),

        // Team members grid
        isPortrait ? _buildTeamGrid(crossAxisCount) : _buildTeamRow(),
      ],
    );
  }

  Widget _buildTeamGrid(int crossAxisCount) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 24,
      childAspectRatio: 0.7,
      children: _buildTeamMembers(),
    );
  }

  Widget _buildTeamRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildTeamMembers(),
    );
  }

  List<Widget> _buildTeamMembers() {
    return [
      _buildTeamMember(
        image: 'assets/images/team_1.webp',
        name: 'John Doe',
        position: 'Manager',
      ),
      _buildTeamMember(
        image: 'assets/images/team_2.webp',
        name: 'Jane Smith',
        position: 'Assistant Manager',
      ),
      _buildTeamMember(
        image: 'assets/images/team_3.webp',
        name: 'Mike Johnson',
        position: 'General Manager',
      ),
      _buildTeamMember(
        image: 'assets/images/team_4.webp',
        name: 'Sarah Williams',
        position: 'Quality Inspector',
      ),
    ];
  }

  Widget _buildTeamMember({
    required String image,
    required String name,
    required String position,
  }) {
    return Column(
      children: [
        // Team member photo
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, width: 140, height: 140, fit: BoxFit.cover),
        ),
        const SizedBox(height: 12),

        // Name
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1931),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),

        // Position
        Text(
          position,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),

        // Social media icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(FontAwesomeIcons.facebook),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.twitter),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.instagram),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(child: FaIcon(icon, size: 14, color: Colors.black87)),
    );
  }
}
