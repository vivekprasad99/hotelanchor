import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class PulseLoadingWidget extends StatefulWidget {
  final double size;
  final Color? color;

  const PulseLoadingWidget({super.key, this.size = 100.0, this.color});

  @override
  State<PulseLoadingWidget> createState() => _PulseLoadingWidgetState();
}

class _PulseLoadingWidgetState extends State<PulseLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: widget.size,
        height: widget.size,
        padding: EdgeInsets.all(widget.size * 0.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (widget.color ?? Theme.of(context).colorScheme.primary)
              .withOpacity(0.1),
        ),
        child: Image.asset(
          '${AppConstants.imagePath}/logo.png',
          width: widget.size * 0.8,
          height: widget.size * 0.8,
        ),
      ),
    );
  }
}
