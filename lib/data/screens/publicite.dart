import 'package:flutter/material.dart';

class Publicite extends StatefulWidget {
  const Publicite({super.key});

  @override
  State<Publicite> createState() => _PubliciteState();
}

class _PubliciteState extends State<Publicite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Cree une publicite',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff072858),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/logos/icon.jpg',
              height: 300,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                print("Menu icon clicked");
              },
            ),
          ]),
    );
  }
}
