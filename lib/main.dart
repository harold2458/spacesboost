import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff072858)),
        useMaterial3: true,
      ),
      home: const Animated()
    );
  }
}

