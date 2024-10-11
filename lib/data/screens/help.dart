import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Aide', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
    centerTitle: true,
    backgroundColor: const Color(0XFFFCBC1C),
    leading: Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Image.asset('assets/logos/icon.png'),
    ),),
    body: const Center(child: Text('Aide'))
    );
  }
}
