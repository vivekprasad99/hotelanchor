import 'package:flutter/material.dart';
import 'package:hotelanchor/core/constants/app_constants.dart';

class GalleryDetailScreen extends StatelessWidget {
  final String imagePath;
  final String tag;

  const GalleryDetailScreen({
    Key? key,
    required this.imagePath,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 4.0,
          child: Hero(
            tag: tag,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
