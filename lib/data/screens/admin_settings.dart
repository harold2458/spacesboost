import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/admin_conditions_utilisations.dart';
import 'package:projet_mobile/data/screens/admin_langues.dart';
import 'package:projet_mobile/data/screens/admin_notifications.dart';
import 'package:projet_mobile/data/screens/admin_parrainage.dart';

class AdminSettings extends StatefulWidget {
  const AdminSettings({super.key});

  @override
  State<AdminSettings> createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Paramètre', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0xff072858),
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
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminNotifications()));
              }, child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Color(0xfffcbc1c)),
                    SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05),),
                    Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ]
              )),
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
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLangues()));
              }, child: Row(
                  children: [
                    const Icon(Icons.g_translate, color: Color(0xfffcbc1c)),
                    SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05),),
                    Text(
                      'Langues',
                      style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ]
              )),
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
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminParrainage()));
              }, child: Row(
                  children: [
                    const Icon(Icons.group_add, color: Color(0xfffcbc1c)),
                    SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05),),
                    Text(
                      'Parrainage',
                      style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ]
              )),
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
              padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.02 : 0.03)),
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminConditionsUtilisations()));
              }, child: Row(
                  children: [
                    const Icon(Icons.description, color: Color(0xfffcbc1c)),
                    SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05),),
                    Text(
                      'Conditions d\'utilisations',
                      style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ]
              )),
            ),
          ],
        ),
      )
    );
  }
}
