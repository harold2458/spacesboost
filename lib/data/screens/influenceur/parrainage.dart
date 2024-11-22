import 'package:flutter/material.dart';

class Parrainage extends StatefulWidget {
  const Parrainage({super.key});

  @override
  State<Parrainage> createState() => _ParrainageState();
}

class _ParrainageState extends State<Parrainage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Parrainage"),
      ),
    );
  }
}