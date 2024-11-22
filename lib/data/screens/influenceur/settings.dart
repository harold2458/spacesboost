import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/Notifications.dart';
import 'package:projet_mobile/data/screens/influenceur/condtionUtilisations.dart';
import 'package:projet_mobile/data/screens/influenceur/langues.dart';
import 'package:projet_mobile/data/screens/influenceur/parrainage.dart';
import 'package:projet_mobile/data/screens/influenceur/sondage_entreprise.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Paramètre',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff072858),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (isPortrait ? 0.05 : 0.1),
              vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SondageEntreprise()));
                    },
                    child: Row(children: [
                      const Icon(Icons.event_note, color: Color(0xfffcbc1c)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.1 : 0.05),
                      ),
                      Text(
                        'Sondage',
                        style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ])),
              ),
              SizedBox(
                height: screenHeight * (isPortrait ? 0.03 : 0.1),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notifications()));
                    },
                    child: Row(children: [
                      const Icon(Icons.notifications, color: Color(0xfffcbc1c)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.1 : 0.05),
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ])),
              ),
              SizedBox(
                height: screenHeight * (isPortrait ? 0.03 : 0.1),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Langues()));
                    },
                    child: Row(children: [
                      const Icon(Icons.g_translate, color: Color(0xfffcbc1c)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.1 : 0.05),
                      ),
                      Text(
                        'Langues',
                        style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ])),
              ),
              SizedBox(
                height: screenHeight * (isPortrait ? 0.03 : 0.1),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Parrainage()));
                    },
                    child: Row(children: [
                      const Icon(Icons.group_add, color: Color(0xfffcbc1c)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.1 : 0.05),
                      ),
                      Text(
                        'Parrainage',
                        style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ])),
              ),
              SizedBox(
                height: screenHeight * (isPortrait ? 0.03 : 0.1),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ConditionUtilisations()));
                    },
                    child: Row(children: [
                      const Icon(Icons.description, color: Color(0xfffcbc1c)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.1 : 0.05),
                      ),
                      Text(
                        'Conditions d\'utilisations',
                        style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ])),
              ),
            ],
          ),
        ));
  }
}
