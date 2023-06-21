library gradient_icon;

import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Gradient gradient;
  final double size;

  const GradientIcon({
    required this.icon,
    required this.gradient,
    this.size = 25,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the CustomPaint with RepaintBoundary to optimize repaint behavior
    return RepaintBoundary(
      child: CustomPaint(
        size: Size(size, size),
        painter: _GradientIconPainter(
          icon: icon,
          gradient: gradient,
          iconSize: size,
        ),
      ),
    );
  }
}

class _GradientIconPainter extends CustomPainter {
  final IconData? icon;
  final Gradient? gradient;
  final double? iconSize;

  _GradientIconPainter({
    Listenable? repaint,
    required this.icon,
    required this.gradient,
    required this.iconSize,
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
    final offset = Offset(xCenter, yCenter + 8);

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
