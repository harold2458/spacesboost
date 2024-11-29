import 'package:flutter/material.dart';

class DetailValider extends StatefulWidget {
  const DetailValider({super.key});

  @override
  State<DetailValider> createState() => _DetailValiderState();
}

class _DetailValiderState extends State<DetailValider> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("valider"),
      ),
    );
  }
}