import 'package:flutter/material.dart';

class HomeEntreprise extends StatefulWidget {
  final Function(int) onTabSelected; // Callback pour sélectionner l'onglet

  const HomeEntreprise({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  State<HomeEntreprise> createState() => _HomeEntrepriseState();
}

class _HomeEntrepriseState extends State<HomeEntreprise> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profil et AppBar
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xff072858),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundImage: const AssetImage('assets/icons/profile2.png'),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Harold DIDAVI',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Développeur',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Boutons de navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 GestureDetector(
                  onTap: () {
                    widget.onTabSelected(0);  // Onglet Campagne
                  },
                  child: buildGestureContainer(
                    'Campagne',
                    'assets/icons/campagne.png',
                    screenWidth,
                    screenHeight,
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),

                GestureDetector(
                  onTap: () {
                    widget.onTabSelected(1);// Onglet Preuve
                  },
                  child: buildGestureContainer(
                    'Preuve',
                    'assets/icons/sondage1.png',
                    screenWidth,
                    screenHeight,
                  ),
                ),
                
               SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onTabSelected(4); // Onglet Statistique
                  },
                  child: buildGestureContainer(
                    'Statistique',
                    'assets/icons/statistique.png',
                    screenWidth,
                    screenHeight,
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                GestureDetector(
                  onTap: () {
                    widget.onTabSelected(3); // Onglet Aide
                  },
                  child: buildGestureContainer(
                    'Taxi Boost',
                    'assets/icons/help.png',
                    screenWidth,
                    screenHeight,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  // Widget pour un élément de navigation
  Widget buildGestureContainer(String title, String iconPath, double screenWidth, double screenHeight) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      width: screenWidth * (isPortrait ? 0.35 : 0.25),
      height: screenHeight * (isPortrait ? 0.2 : 0.3),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: screenHeight * 0.08),
          SizedBox(height: screenHeight * 0.01),
          Text(
            title,
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ],
      ),
    );
  }
}
