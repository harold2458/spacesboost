import 'package:flutter/material.dart';

class AdminConditionsUtilisations extends StatefulWidget {
  const AdminConditionsUtilisations({super.key});

  @override
  State<AdminConditionsUtilisations> createState() => _AdminConditionsUtilisationsState();
}

class _AdminConditionsUtilisationsState extends State<AdminConditionsUtilisations> {

  final TextEditingController _prixController = TextEditingController(text: "1000");

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
          backgroundColor: const Color(0xff072858),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(
            children: [
              const Text(
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
                textAlign: TextAlign.justify,),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              const Text(
                "Définir le prix prélevé sur les annonces (en FCFA)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              SizedBox(
                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                child: TextFormField(
                  controller: _prixController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Prix par défaut",
                    hintText: '1000',
                    labelStyle: const TextStyle(color: Colors.grey),
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.price_change,
                      color: Color(0xfffcbc1c),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xfffcbc1c)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xfffcbc1c)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixText: "FCFA",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un prix';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Le prix doit être un nombre';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              SizedBox(
                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                height: screenHeight * (isPortrait ? 0.07 : 0.2),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordures arrondies
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(3),
                  ),
                  onPressed: () {
                    // Affiche le prix actuel dans la console
                    //print("Prix défini: ${_prixController.text} FCFA");
                    // Ici, tu peux ajouter ton code pour sauvegarder la valeur
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Prix mis à jour avec succès !"),
                      ),
                    );
                  },
                  child: Text("Enregistrer",
                    style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                ),
              )
            ],
          )
      ),
    );
  }
}
