import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/conditions_utilisations.dart';
import 'package:projet_mobile/data/screens/historique_retrait.dart';
import 'package:projet_mobile/data/screens/langues.dart';
import 'package:projet_mobile/data/screens/notifications.dart';
import 'before_home.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paramètre', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
        body: Column(
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
                padding: const EdgeInsets.all(8),
                width: 370,
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoriqueRetrait()));
                }, child: const Row(
                    children: [
                      Icon(Icons.event_note, color: Color(0xfffcbc1c)),
                      SizedBox(width: 50,),
                      Text(
                        'Historique des retraits',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ]
                )),
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
                padding: const EdgeInsets.all(8),
                width: 370,
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications()));
                }, child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Color(0xfffcbc1c)),
                      SizedBox(width: 50,),
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ]
                )),
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
                padding: const EdgeInsets.all(8),
                width: 370,
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Langues()));
                }, child: const Row(
                    children: [
                      Icon(Icons.g_translate, color: Color(0xfffcbc1c)),
                      SizedBox(width: 50,),
                      Text(
                        'Langues',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ]
                )),
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
                padding: const EdgeInsets.all(8),
                width: 370,
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 1)));
                }, child: const Row(
                    children: [
                      Icon(Icons.group_add, color: Color(0xfffcbc1c)),
                      SizedBox(width: 50,),
                      Text(
                        'Parrainage',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ]
                )),
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
                padding: const EdgeInsets.all(8),
                width: 370,
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ConditionsUtilisations()));
                }, child: const Row(
                    children: [
                      Icon(Icons.description, color: Color(0xfffcbc1c)),
                      SizedBox(width: 50,),
                      Text(
                        'Conditions d\'utilisations',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ]
                )),
              ),
            ),
          ],
        )
    );
  }
}
