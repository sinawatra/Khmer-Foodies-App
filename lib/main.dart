import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      title: 'Khmer Foodies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // ✅ Wrapped inside MaterialApp
    );
  }
}
