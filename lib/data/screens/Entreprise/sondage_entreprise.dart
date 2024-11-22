import 'package:flutter/material.dart';

class SondageEntreprise extends StatefulWidget {
  const SondageEntreprise({super.key});

  @override
  State<SondageEntreprise> createState() => _SondageEntrepriseState();
}

class _SondageEntrepriseState extends State<SondageEntreprise> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Sondage"),
      ),
    );
  }
}