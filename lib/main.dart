import 'package:flutter/material.dart';
import 'package:medical/home_page.dart';
import 'package:medical/product_screen.dart';

import 'package:medical/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Store',
      home: HomePage(),
    );
  }
}
