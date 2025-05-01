import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class CustomLoadingWidget extends StatefulWidget {
  final double size;
  final Color? color;

  const CustomLoadingWidget({super.key, this.size = 100.0, this.color});

  @override
  State<CustomLoadingWidget> createState() => _CustomLoadingWidgetState();
}

class _CustomLoadingWidgetState extends State<CustomLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer circle
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.color ?? Theme.of(context).colorScheme.primary,
                width: 4,
              ),
            ),
          ),
          // Logo
          Image.asset(
            '${AppConstants.imagePath}/logo.png',
            width: widget.size * 0.7,
            height: widget.size * 0.7,
          ),
        ],
      ),
    );
  }
}
