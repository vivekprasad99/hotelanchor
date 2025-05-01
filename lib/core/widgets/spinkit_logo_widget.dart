import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class SpinKitLogoWidget extends StatelessWidget {
  final double size;
  final Color? color;

  const SpinKitLogoWidget({super.key, this.size = 100.0, this.color});

  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context).colorScheme.primary;

    return Stack(
      alignment: Alignment.center,
      children: [
        SpinKitDualRing(color: color ?? defaultColor, size: size, lineWidth: 4),
        Image.asset(
          '${AppConstants.imagePath}/logo.png',
          width: size * 0.8,
          height: size * 0.8,
        ),
      ],
    );
  }
}
