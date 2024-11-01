import 'package:flutter/material.dart';

class AdminDistribution extends StatefulWidget {
  const AdminDistribution({super.key});

  @override
  State<AdminDistribution> createState() => _AdminDistributionState();
}

class _AdminDistributionState extends State<AdminDistribution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Distribution'),),
    );
  }
}
