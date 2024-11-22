import 'package:flutter/material.dart';

class SupportEntreprise extends StatefulWidget {
  const SupportEntreprise({super.key});

  @override
  State<SupportEntreprise> createState() => _SupportEntrepriseState();
}

class _SupportEntrepriseState extends State<SupportEntreprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text("welcome to startup support page"),
      ),
    );
  }
}