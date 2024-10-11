import 'package:flutter/material.dart';

class Sponsoring extends StatefulWidget {
  const Sponsoring({super.key});

  @override
  State<Sponsoring> createState() => _SponsoringState();
}

class _SponsoringState extends State<Sponsoring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset('assets/images/parrainage.png'),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          const Text('Partager', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff072858)
          ),),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () { }, icon: Image.asset('assets/images/twitter.png'),),
              const SizedBox(width: 20),
              IconButton(onPressed: () { }, icon: Image.asset('assets/images/linkedin.png'),),
              const SizedBox(width: 20),
              IconButton(onPressed: () { }, icon: Image.asset('assets/images/whatsapp.png'),),
              const SizedBox(width: 20),
              IconButton(onPressed: () { }, icon: Image.asset('assets/images/facebook.png'),),
            ],
          )
        ]
      )
    );
  }
}
