import 'package:flutter/material.dart';

class LocalisationSelection extends StatefulWidget {
  const LocalisationSelection({super.key});

  @override
  State<LocalisationSelection> createState() => _LocalisationSelectionState();
}

class _LocalisationSelectionState extends State<LocalisationSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('localisation'),
      ),
    );
  }
}
