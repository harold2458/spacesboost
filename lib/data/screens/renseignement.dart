import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:projet_mobile/data/screens/renseignement_two.dart';

class Renseignement extends StatefulWidget {
  const Renseignement({super.key});

  @override
  State<Renseignement> createState() => _RenseignementState();
}

class _RenseignementState extends State<Renseignement> {

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

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Renseignement', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.1),),
            Center(
              child: Image.asset(
                'assets/images/information.png', height: screenHeight * (isPortrait ? 0.2 : 0.5),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
            Stack(
              children: [
                Positioned.fill(
                    child: Transform.translate(offset: Offset(0, screenHeight * (isPortrait ? 0.08 : 0.6)), child: Image.asset(
                      'assets/images/forme_jaune3.png',
                      fit: BoxFit.cover, // L'image couvre toute la zone
                    ),)),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Type d\'influenceur',
                                hintText: '*Sélectionner le type',
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
                              value: selectedType,
                              items: influencerTypes.map((type) {
                                return DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value;
                                });
                              },
                              validator: (value) => value == null ? 'Veuillez sélectionner un type' : null,
                            ),
                          ),
                          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
                            //height: screenHeight * (isPortrait ? 0.05 : 0.1),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Domaine d\'influence',
                                hintText: '*Sélectionner le domaine',
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
                              value: selectedDomain,
                              items: influencerDomains.map((domain) {
                                return DropdownMenuItem(
                                  value: domain,
                                  child: Text(domain),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedDomain = value;
                                });
                              },
                              validator: (value) => value == null ? 'Veuillez sélectionner un domaine' : null,
                            ),
                          ),
                          SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.05),),
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.8 : 0.8),
                            height: screenHeight * (isPortrait ? 0.03 : 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.info_outline, color: Colors.red),
                                SizedBox(width: screenWidth * 0.02),
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
                            ),
                          ),
                          SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.05),),
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
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
                              width: screenWidth * (isPortrait ? 0.9 : 0.8),
                              height: screenHeight * (isPortrait ? 0.05 : 0.1),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Lien vers votre profil Instagram',
                                  hintText: '*https://www.instagram.com/gafour/',
                                  labelStyle: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                  hintStyle: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
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
                          else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                          SizedBox(height: screenHeight * (isPortrait ? 0.005 : 0.05),),
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
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
                              width: screenWidth * (isPortrait ? 0.9 : 0.8),
                              height: screenHeight * (isPortrait ? 0.05 : 0.1),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Lien vers votre chaîne YouTube',
                                  hintText: '*https://www.youtube.com/gafour/',
                                  labelStyle: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                  hintStyle: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
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
                          else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                          SizedBox(height: screenHeight * (isPortrait ? 0.005 : 0.05),),
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
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
                              width: screenWidth * (isPortrait ? 0.9 : 0.8),
                              height: screenHeight * (isPortrait ? 0.05 : 0.1),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Lien vers votre profil Facebook',
                                  hintText: '*https://www.facebook.com/gafour/',
                                  labelStyle: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                  hintStyle: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
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
                          else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                          SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1),),
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const RenseignementTwo()));
                              },
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Bordures arrondies
                                  ),
                                ),
                                elevation: const WidgetStatePropertyAll(3),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Suivant',
                                    style: TextStyle(
                                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.05)),
                                  const Icon(Icons.arrow_right_alt, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}