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
       appBar: AppBar(
          title: const Text('Aide', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFF072858),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
