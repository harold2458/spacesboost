import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Parametre', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset('assets/logos/icon.png'),
          ),),
        body: const Center(child: Text('Parametre'))
    );
  }
}
