import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:projet_mobile/data/screens/before_home.dart';

class RenseignementTwo extends StatefulWidget {
  const RenseignementTwo({super.key});

  @override
  State<RenseignementTwo> createState() => _RenseignementTwoState();
}

class _RenseignementTwoState extends State<RenseignementTwo> {

  final _formKey = GlobalKey<FormState>();

  // Liste des types et domaines d'influenceur
  List<String> influencerTypes = ['Lifestyle', 'Tech', 'Mode', 'Beauté'];
  List<String> influencerDomains = ['Blogging', 'Vidéos', 'Photos', 'Gaming'];

  String? selectedType;
  String? selectedDomain;

  // Variables pour les cases à cocher (réseaux sociaux)
  bool isInstagram = false;
  bool isYouTube = false;
  bool isFacebook = false;

  // Variables pour les liens des réseaux sociaux
  String? instagramLink;
  String? youtubeLink;
  String? facebookLink;

  // Variable pour l'acceptation des conditions d'utilisation
  bool acceptTerms = false;

  // Liste des pays
  List<String> countries = ['Bénin', 'France', 'États-Unis'];

  // Mapping des pays avec leurs villes respectives
  Map<String, List<String>> countryCities = {
    'Bénin': ['Cotonou', 'Porto-Novo', 'Parakou'],
    'France': ['Paris', 'Lyon', 'Marseille'],
    'États-Unis': ['New York', 'Los Angeles', 'Chicago']
  };

  // Variables pour stocker le pays et la ville sélectionnés
  String? selectedCountry;
  String? selectedCity;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renseignement', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Center(
              child: Image.asset(
                'assets/images/information.png', height: 170,
              ),
            ),
            const SizedBox(height: 20,),
            Stack(
              children: [
                Positioned.fill(
                    child: Transform.translate(offset: const Offset(0, 50), child: Image.asset(
                      'assets/images/forme_jaune.png',
                      fit: BoxFit.cover, // L'image couvre toute la zone
                    ),)),
                SizedBox(
                  width: double.infinity,
                  height: 510,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Dropdown pour le pays
                          SizedBox(
                            width: 310,
                            height: 50,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Pays',
                                hintText: '*Sélectionner un pays',
                                labelStyle: const TextStyle(color: Colors.grey),
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xff072858)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xff072858)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              value: selectedCountry,
                              items: countries.map((String country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                  selectedCity = null; // Réinitialiser la ville
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          // Dropdown pour la ville (dépendant du pays sélectionné)
                          SizedBox(
                            width: 310,
                            height: 50,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Ville',
                                hintText: '*Sélectionner une ville',
                                labelStyle: const TextStyle(color: Colors.grey),
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xff072858)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xff072858)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              value: selectedCity,
                              items: selectedCountry == null
                                  ? [] // Si aucun pays sélectionné, pas de villes à afficher
                                  : countryCities[selectedCountry]!.map((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCity = value;
                                });
                              },
                              // Désactiver le champ si aucun pays n'est sélectionné
                              disabledHint: const Text('*Veuillez d\'abord sélectionner un pays', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ),
                          ),
                          SizedBox(
                              width: 330,
                              height: 40,
                              child: Transform.translate(offset: const Offset(-17, -5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.info_outline, color: Colors.red),
                                    const SizedBox(width: 5.0),
                                    Expanded(  // Ajout d'Expanded ici
                                      child: Marquee(
                                        text: 'Vous pouvez cocher un ou plusieurs réseaux sociaux et renseigner le lien correspondant :',
                                        style: const TextStyle(fontStyle: FontStyle.italic),
                                        scrollAxis: Axis.horizontal,
                                        blankSpace: 20.0,
                                        velocity: 30.0,
                                        pauseAfterRound: const Duration(seconds: 1),
                                        startPadding: 10.0,
                                      ),
                                    ),
                                  ],
                                ),)
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            width: 330,
                            height: 50,
                            child: CheckboxListTile(
                              title: const Text('Instagram', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              value: isInstagram,
                              onChanged: (bool? value) {
                                setState(() {
                                  isInstagram = value!;
                                });
                              },
                              activeColor: const Color(0xff072858),
                            ),
                          ),
                          if (isInstagram)
                            SizedBox(
                              width: 310,
                              height: 35,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Lien vers votre profil Instagram',
                                  hintText: '*https://www.instagram.com/gafour/',
                                  labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
                                  hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                                  prefixIcon: const Icon(
                                    Icons.link,
                                    color: Color(0xff072858),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Color(0xff072858)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Color(0xff072858)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  instagramLink = value;
                                },
                                validator: (value) {
                                  if (isInstagram && (value == null || value.isEmpty)) {
                                    return '*Veuillez renseigner le lien vers votre profil Instagram';
                                  }
                                  return null;
                                },
                              ),
                            )
                          else const SizedBox(height: 35.0),
                          SizedBox(
                            width: 330,
                            height: 50,
                            child: CheckboxListTile(
                              title: const Text('YouTube', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              value: isYouTube,
                              onChanged: (bool? value) {
                                setState(() {
                                  isYouTube = value!;
                                });
                              },
                              activeColor: const Color(0xff072858),
                            ),
                          ),
                          if (isYouTube)
                            SizedBox(
                              width: 310,
                              height: 35,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Lien vers votre chaîne YouTube',
                                  hintText: '*https://www.youtube.com/gafour/',
                                  labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
                                  hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                                  prefixIcon: const Icon(
                                    Icons.link,
                                    color: Color(0xff072858),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Color(0xff072858)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Color(0xff072858)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  youtubeLink = value;
                                },
                                validator: (value) {
                                  if (isYouTube && (value == null || value.isEmpty)) {
                                    return '*Veuillez renseigner le lien vers votre chaîne YouTube';
                                  }
                                  return null;
                                },
                              ),
                            )
                          else const SizedBox(height: 35.0),
                          SizedBox(
                            width: 330,
                            height: 50,
                            child: CheckboxListTile(
                              title: const Text('Facebook', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              value: isFacebook,
                              onChanged: (bool? value) {
                                setState(() {
                                  isFacebook = value!;
                                });
                              },
                              activeColor: const Color(0xff072858),
                            ),
                          ),
                          if (isFacebook)
                            SizedBox(
                              width: 310,
                              height: 35,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Lien vers votre profil Facebook',
                                  hintText: '*https://www.facebook.com/gafour/',
                                  labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
                                  hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                                  prefixIcon: const Icon(
                                    Icons.link,
                                    color: Color(0xff072858),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Color(0xff072858)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Color(0xff072858)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  facebookLink = value;
                                },
                                validator: (value) {
                                  if (isFacebook && (value == null || value.isEmpty)) {
                                    return 'Veuillez renseigner le lien vers votre profil Facebook';
                                  }
                                  return null;
                                },
                              ),
                            )
                          else const SizedBox(height: 35.0),
                          SizedBox(
                            height: 35,
                            child: CheckboxListTile(
                              title: Row(
                                children: [
                                  const Text('J\'accepte les ', style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic
                                  ),),
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Conditions d\'utilisation',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff072858),
                                              ),),
                                            content: const SingleChildScrollView(child: Text(
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
        ''', style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,),),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Fermer', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858))),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'conditions d\'utilisation',
                                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Color(0xff072858)),
                                    ),
                                  ),
                                ],
                              ),
                              value: acceptTerms,
                              onChanged: (bool? value) {
                                setState(() {
                                  acceptTerms = value!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: const Color(0xff072858),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Formulaire soumis avec succès!')),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Bordures arrondies
                                ),
                              ),
                              elevation: const WidgetStatePropertyAll(5),
                            ),
                            child: const Text(
                              'Envoyer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}


