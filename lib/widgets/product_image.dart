import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Helper widget to display images with fallback to icon
class ProductImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData fallbackIcon;

  const ProductImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.fallbackIcon = Icons.shopping_bag,
  });

  @override
  Widget build(BuildContext context) {
    // Check if image is a network URL
    final bool isNetworkImage =
        imagePath.startsWith('http://') || imagePath.startsWith('https://');

    if (isNetworkImage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildFallback();
          },
          errorBuilder: (context, error, stackTrace) {
            return _buildFallback();
          },
        ),
      );
    }

    // Check if the image path exists for asset images
    return FutureBuilder<bool>(
      future: _checkImageExists(imagePath),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return _buildFallback();
              },
            ),
          );
        }
        return _buildFallback();
      },
    );
  }

  Widget _buildFallback() {
    final double iconSize = width != null && width! > 0
        ? width! * 0.5
        : (height != null && height! > 0 ? height! * 0.5 : 50.0);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE1F5FE), Color(0xFFB3E5FC)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(fallbackIcon, size: iconSize, color: Color(0xFF1E88E5)),
    );
  }

  Future<bool> _checkImageExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (e) {
      return false;
    }
  }
}
