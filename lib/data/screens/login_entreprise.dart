import 'package:flutter/material.dart';

class LoginEntrprise extends StatefulWidget {
  const LoginEntrprise({super.key});

  @override
  State<LoginEntrprise> createState() => _LoginEntrpriseState();
}

class _LoginEntrpriseState extends State<LoginEntrprise> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Welcome to startup login page"),),
    );
  }
}