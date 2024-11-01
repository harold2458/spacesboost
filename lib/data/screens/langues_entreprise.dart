import 'package:flutter/material.dart';

class LanguesEntreprise extends StatefulWidget {
  const LanguesEntreprise({super.key});

  @override
  State<LanguesEntreprise> createState() => _LanguesState();
}

class _LanguesState extends State<LanguesEntreprise> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("langues"),
      ),
    );
  }
}