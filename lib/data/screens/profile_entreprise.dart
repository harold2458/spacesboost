import 'package:flutter/material.dart';

class ProfileEntreprise extends StatefulWidget {
  const ProfileEntreprise({super.key});

  @override
  State<ProfileEntreprise> createState() => _ProfilState();
}

class _ProfilState extends State<ProfileEntreprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}