import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/aide_entreprise.dart';
import 'package:projet_mobile/data/screens/campagne_entreprise.dart';
import 'package:projet_mobile/data/screens/sondage_entreprise.dart';
import 'package:projet_mobile/data/screens/statistique_entreprise.dart';

class HomeEntreprise extends StatefulWidget {
  const HomeEntreprise({super.key});

  @override
  State<HomeEntreprise> createState() => _HomeEntrepriseState();
}

class _HomeEntrepriseState extends State<HomeEntreprise> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
        // Fusion AppBar et section du profil
        Container(
          width: double.infinity, // Prend toute la largeur de l'écran
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(
                0xff072858), // Couleur de la section profil et AppBar
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
            border: Border.all(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          child: const Column(
            children: [
              SizedBox(height: 16),

              // Section du profil avec prénom et nom
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/icons/profile2.png'), // Chemin vers l'image du profil
              ),
              SizedBox(height: 20),
              Text(
                'Harold DIDAVI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Developpeur',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Naviguer vers la page cible
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CampagneEntreprise()),
                );
              },
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.5), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion de l'ombre
                      blurRadius: 5, // Flou de l'ombre
                      offset: Offset(0, 3), // Direction de l'ombre (x,y)
                    ),
                  ],
                ),
                // Centre les éléments du Container
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centrer verticalement
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centrer horizontalement
                  children: [
                    Image.asset('assets/icons/campagne.png', height: 50),
                    const SizedBox(height: 10), // Ajustement de l'espacement
                    const Text("Campagne"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                // Naviguer vers la page cible
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SondageEntreprise()),
                );
              },
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.5), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion de l'ombre
                      blurRadius: 5, // Flou de l'ombre
                      offset: Offset(0, 3), // Direction de l'ombre (x,y)
                    ),
                  ],
                ),
                // Centre les éléments du Container
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centrer verticalement
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centrer horizontalement
                  children: [
                    Image.asset('assets/icons/sondage1.png', height: 50),
                    const SizedBox(height: 10), // Ajustement de l'espacement
                    const Text("Sondage"),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Naviguer vers la page cible
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatistiqueEntreprise()),
                );
              },
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.5), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion de l'ombre
                      blurRadius: 5, // Flou de l'ombre
                      offset: Offset(0, 3), // Direction de l'ombre (x,y)
                    ),
                  ],
                ),
                // Centre les éléments du Container
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centrer verticalement
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centrer horizontalement
                  children: [
                    Image.asset('assets/icons/statistique.png', height: 50),
                    const SizedBox(height: 10), // Ajustement de l'espacement
                    const Text("Statistique"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                // Naviguer vers la page cible
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AideEntreprise()),
                );
              },
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.5), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion de l'ombre
                      blurRadius: 5, // Flou de l'ombre
                      offset: Offset(0, 3), // Direction de l'ombre (x,y)
                    ),
                  ],
                ),
                // Centre les éléments du Container
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centrer verticalement
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centrer horizontalement
                  children: [
                    Image.asset('assets/icons/help.png', height: 50),
                    const SizedBox(height: 10), // Ajustement de l'espacement
                    const Text("Help"),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ]),
      )
    );
  }
}
