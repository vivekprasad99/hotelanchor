import 'package:flutter/material.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';
import 'package:hotelanchor/core/widgets/spinkit_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(); // Start the animation

    _navigateToNext();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToNext() async {
    // Reduced delay to 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      // Changed login to auth since that's the correct route name
      Navigator.pushReplacementNamed(context, AppRoutes.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using SpinKitLogoWidget with animation
            ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
              ),
              child: const SpinKitLogoWidget(size: 120),
            ),
            const SizedBox(height: 24),
            FadeTransition(
              opacity: _controller,
              child: Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
