import 'package:flutter/material.dart';

class AideEntreprise extends StatefulWidget {
  const AideEntreprise({super.key});

  @override
  State<AideEntreprise> createState() => _AideEntrepriseState();
}

class _AideEntrepriseState extends State<AideEntreprise> {

 

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
