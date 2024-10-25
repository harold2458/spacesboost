import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/animated.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
<<<<<<< HEAD

=======
 
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
<<<<<<< HEAD
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
=======
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff072858)),
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
        useMaterial3: true,
      ),
      home: const Animated(),
      debugShowCheckedModeBanner: false, // Enlève le bandeau de debug
    );
  }
}
