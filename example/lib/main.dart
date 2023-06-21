import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gradient Icons'),
        ),
        body: const Center(
            child: GradientIcon(
          icon: Icons.home,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          size: 50,
        )),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Gradient gradient;
  final double size;

  const GradientIcon(
      {required this.icon, required this.gradient, this.size = 25, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: CustomPaint(
      size: Size(size, size),
      painter:
          _GradientIconPainter(icon: icon, gradient: gradient, iconSize: size),
    ));
  }
}

class _GradientIconPainter extends CustomPainter {
  final IconData? icon;
  final Gradient? gradient;
  final double? iconSize;

  _GradientIconPainter(
      {Listenable? repaint,
      @required this.icon,
      @required this.gradient,
      @required this.iconSize})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint _gradientShaderPaint = Paint();
    _gradientShaderPaint.shader = gradient!
        .createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    final TextPainter _textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: String.fromCharCode(icon!.codePoint),
          style: TextStyle(
              foreground: _gradientShaderPaint,
              fontFamily: icon!.fontFamily,
              fontSize: iconSize),
        ));
    _textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final xCenter = (size.width - _textPainter.width) / 2;
    final yCenter = (size.height - _textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter + 8);
    _textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(_GradientIconPainter oldDelegate) {
    return icon != oldDelegate.icon ||
        gradient != oldDelegate.gradient ||
        iconSize != oldDelegate.iconSize;
  }
}
