import 'package:flutter/material.dart';

class ValidationCommande extends StatefulWidget {
  const ValidationCommande({super.key});

  @override
  State<ValidationCommande> createState() => _ValidationCommandeState();
}

class _ValidationCommandeState extends State<ValidationCommande> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
          title: const Text('valiadation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFF072858),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: Center(
        child: Text("valiadation"),
      ),
    );
  }
}