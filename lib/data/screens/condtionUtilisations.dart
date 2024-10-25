import 'package:flutter/material.dart';

class ConditionUtilisations extends StatefulWidget {
  const ConditionUtilisations({super.key});

  @override
  State<ConditionUtilisations> createState() => _ConditionUtilisationsState();
}

class _ConditionUtilisationsState extends State<ConditionUtilisations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("condition"),
      ),
    );
  }
}