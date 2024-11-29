import 'package:flutter/material.dart';

class PerformanceEntreprise extends StatefulWidget {
  const PerformanceEntreprise({super.key});

  @override
  State<PerformanceEntreprise> createState() => _PerformanceEntrepriseState();
}

class _PerformanceEntrepriseState extends State<PerformanceEntreprise> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Performance"),
      ),
    );
  }
}