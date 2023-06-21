import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';


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

