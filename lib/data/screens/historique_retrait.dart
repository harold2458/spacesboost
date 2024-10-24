import 'package:flutter/material.dart';

class HistoriqueRetrait extends StatefulWidget {
  const HistoriqueRetrait({super.key});

  @override
  State<HistoriqueRetrait> createState() => _HistoriqueRetraitState();
}

class _HistoriqueRetraitState extends State<HistoriqueRetrait> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Historique retraits', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                    spreadRadius: 2, // Rayon de diffusion
                    blurRadius: 2, // Flou de l'ombre
                    offset: const Offset(0, 2), // Décalage de l'ombre
                  ),
                ],
              ),
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
              child: Row(
                children: [
                  const Icon(Icons.local_atm, color: Colors.red,),
                  SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                  const Text(
                    'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
