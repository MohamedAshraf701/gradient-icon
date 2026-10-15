/// A Flutter library for creating gradient icons.
///
/// The `gradient_icon` library provides a `GradientIcon` widget that allows you to display icons with a gradient effect.
/// It utilizes the `CustomPaint` widget to paint the icon with a gradient shader, providing a visually appealing representation.
///
/// Usage:
/// 1. Import the `gradient_icon` library.
/// 2. Use the `GradientIcon` widget by providing the `icon`, `gradient`, and optionally the `size` parameters.
///    - `icon`: The IconData representing the desired icon.
///    - `gradient`: The Gradient object defining the gradient colors and stops.
///    - `size`: The size of the icon (default is 25).
/// 3. Embed the `GradientIcon` widget within your UI to display the gradient icon.
///
/// Note: This library requires the `flutter` package.
library gradient_icon;

import 'package:flutter/material.dart';

/// A widget for displaying icons with a gradient effect.
///
/// The `GradientIcon` widget paints the provided `icon` with a `gradient` shader,
/// creating a gradient effect on the icon. The `size` parameter determines the
/// size of the icon widget.
class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Gradient gradient;
  final double size;
  final Offset? offset;

  /// Constructs a new `GradientIcon` widget.
  ///
  /// - `icon`: The IconData representing the desired icon.
  /// - `gradient`: The Gradient object defining the gradient colors and stops.
  /// - `size`: The size of the icon (default is 25).
  /// - `key`: An optional key to identify this widget.
  const GradientIcon({
    required this.icon,
    required this.gradient,
    this.size = 25,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the CustomPaint with RepaintBoundary to optimize repaint behavior
    return RepaintBoundary(
      child: CustomPaint(
        size: Size(size, size),
        painter: _GradientIconPainter(
            icon: icon, gradient: gradient, iconSize: size, offsets: offset),
      ),
    );
  }
}

/// The painter class responsible for painting the icon with the gradient shader.
///
/// The `_GradientIconPainter` class extends the `CustomPainter` class and is used
/// by the `GradientIcon` widget to paint the provided `icon` with a `gradient` shader.
class _GradientIconPainter extends CustomPainter {
  final IconData? icon;
  final Gradient? gradient;
  final double? iconSize;
  final Offset? offsets;

  /// Constructs a new `_GradientIconPainter` object.
  ///
  /// - `repaint`: An optional listenable object for repainting.
  /// - `icon`: The IconData representing the desired icon.
  /// - `gradient`: The Gradient object defining the gradient colors and stops.
  /// - `iconSize`: The size of the icon.
  _GradientIconPainter({
    Listenable? repaint,
    required this.icon,
    required this.gradient,
    required this.iconSize,
    this.offsets,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    // Create a Paint object to apply the gradient shader
    final Paint gradientShaderPaint = Paint();
    gradientShaderPaint.shader = gradient!
        .createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    // Create a TextPainter to render the icon character with the gradient shader
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(
            icon!.codePoint), // Convert the icon code point to a string
        style: TextStyle(
          foreground:
              gradientShaderPaint, // Apply the gradient shader as the foreground color
          fontFamily: icon!.fontFamily, // Set the icon's font family
          package: icon!.fontPackage, // Set the icon's font package
          fontSize: iconSize, // Set the icon's size
        ),
      ),
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    // Calculate the center position to horizontally and vertically align the icon
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;

    // Create an offset for the icon's position within the canvas
    final offset = offsets ?? Offset(xCenter, yCenter + 8);

    // Paint the icon on the canvas at the specified offset
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(_GradientIconPainter oldDelegate) {
    // Determine whether the painter should repaint based on changes in properties
    return icon != oldDelegate.icon ||
        gradient != oldDelegate.gradient ||
        iconSize != oldDelegate.iconSize;
  }
}
