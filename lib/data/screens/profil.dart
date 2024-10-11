import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset('assets/logos/icon.png'),
          ),),
        body: const Center(child: Text('Profil'))
    );
  }
}
