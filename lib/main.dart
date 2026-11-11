import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: appTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Shop App'),
        ),
      ),
    );
  }
}
