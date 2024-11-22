import 'package:flutter/material.dart';

class ConditionsUtilisations extends StatefulWidget {
  const ConditionsUtilisations({super.key});

  @override
  State<ConditionsUtilisations> createState() => _ConditionsUtilisationsState();
}

class _ConditionsUtilisationsState extends State<ConditionsUtilisations> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Conditions d\'utilisation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: const Text(
        '''
Conditions d'Utilisation de SPACEBOOST

Bienvenue dans notre application dédiée aux influenceurs souhaitant promouvoir leurs talents en réalisant des prestations pour les entreprises. En utilisant cette application, vous acceptez les conditions suivantes :

1. Inscription : Vous devez créer un compte en fournissant des informations exactes et complètes. Vous êtes responsable de la confidentialité de votre mot de passe.

2. Utilisation de l'Application : Vous vous engagez à utiliser l'application uniquement à des fins légales et à respecter toutes les lois applicables.

3. Contenu : En publiant du contenu sur l'application, vous accordez à notre entreprise une licence mondiale, non exclusive et gratuite pour utiliser, reproduire et distribuer ce contenu.

4. Comportement : Vous devez vous comporter de manière respectueuse envers les autres utilisateurs et ne pas publier de contenu offensant, diffamatoire ou illégal.

5. Modification des Conditions : Nous nous réservons le droit de modifier ces conditions d'utilisation à tout moment. Les modifications seront publiées sur l'application et entreront en vigueur immédiatement.

6. Résiliation : Nous nous réservons le droit de suspendre ou de résilier votre compte en cas de violation de ces conditions.

En utilisant cette application, vous reconnaissez avoir lu, compris et accepté ces conditions d'utilisation.

Merci de votre compréhension et bonne utilisation de notre application !
        ''',
        textAlign: TextAlign.justify,),),
    );
  }
}
