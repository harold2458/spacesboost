import 'package:flutter/material.dart';

class AdminStatistiques extends StatefulWidget {
  const AdminStatistiques({super.key});

  @override
  State<AdminStatistiques> createState() => _AdminStatistiquesState();
}

class _AdminStatistiquesState extends State<AdminStatistiques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Statistiques'),),
    );
  }
}
