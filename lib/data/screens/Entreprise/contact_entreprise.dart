import 'package:flutter/material.dart';

class ContactEntreprise extends StatefulWidget {
  const ContactEntreprise({super.key});

  @override
  State<ContactEntreprise> createState() => _ContactEntrepriseState();
}

class _ContactEntrepriseState extends State<ContactEntreprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff072858),
        centerTitle: true,
        leading:  IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
               Navigator.of(context).pop();
            },
          ),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}