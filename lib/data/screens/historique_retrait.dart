import 'package:flutter/material.dart';

class HistoriqueRetrait extends StatefulWidget {
  const HistoriqueRetrait({super.key});

  @override
  State<HistoriqueRetrait> createState() => _HistoriqueRetraitState();
}

class _HistoriqueRetraitState extends State<HistoriqueRetrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Historique retraits', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 370,
                child: const Row(
                  children: [
                    Icon(Icons.local_atm, color: Colors.red,),
                    SizedBox(width: 20,),
                    Text(
                      'Votre avez retire une somme de \$500\nde votre compte SPACEBOOST.\nMerci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
