import 'package:flutter/material.dart';

class ParrainageEntreprise extends StatefulWidget {
  const ParrainageEntreprise({super.key});

  @override
  State<ParrainageEntreprise> createState() => _ParrainageState();
}

class _ParrainageState extends State<ParrainageEntreprise> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Parrainage"),
      ),
    );
  }
}