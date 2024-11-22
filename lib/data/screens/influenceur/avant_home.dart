import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/Notifications.dart';
import 'package:projet_mobile/data/screens/influenceur/aide_entreprise.dart';
import 'package:projet_mobile/data/screens/influenceur/campagne_entreprise.dart';
import 'package:projet_mobile/data/screens/influenceur/home_entrentreprise.dart';
import 'package:projet_mobile/data/screens/influenceur/login_entreprise.dart';
import 'package:projet_mobile/data/screens/influenceur/profile.dart';
import 'package:projet_mobile/data/screens/influenceur/settings.dart';
import 'package:projet_mobile/data/screens/influenceur/statistique_entreprise.dart';

class AvantHome extends StatefulWidget {
  const AvantHome({super.key});

  @override
  State<AvantHome> createState() => _AvantHomeState();
}

class _AvantHomeState extends State<AvantHome> {
  int _selectedIndex = 0;

  static final List<String> _title = [
    "Accueil",
    "Aide",
    "Campagne",
    "Statistique"
  ];
  static final List<Widget> _pages = [
    const HomeEntreprise(),
    const AideEntreprise(),
    const CampagneEntreprise(),
    const StatistiqueEntreprise(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_selectedIndex],
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF072858),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: Image.asset(
            'assets/logos/icon.jpg',
            height: 300,
          ),
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu,
                    size: screenWidth * (isPortrait ? 0.1 : 0.05),
                    color: Colors.white), // Icône de menu
                onPressed: () {
                  // Ouvre le drawer
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )
        ],
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: screenHeight * (isPortrait ? 0.35 : 0.5),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0Xff072858),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * (isPortrait ? 0.15 : 0.04),
                      backgroundImage:
                          const AssetImage('assets/images/profil.jpg'),
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.03)),
                    Text('Harold DIDAVI',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                            fontWeight: FontWeight.bold)),
                    Text('harolddidavi@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                screenWidth * (isPortrait ? 0.03 : 0.01))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.person, color: Colors.amber),
                        SizedBox(
                            width: screenWidth * (isPortrait ? 0.1 : 0.05)),
                        // Espacement entre l'icône et le texte
                        Text(
                          'Profil',
                          style: TextStyle(
                              fontSize:
                                  screenWidth * (isPortrait ? 0.04 : 0.02),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xfffcbc1c)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notifications()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.notifications, color: Colors.amber),
                        SizedBox(
                            width: screenWidth * (isPortrait ? 0.1 : 0.05)),
                        // Espacement entre l'icône et le texte
                        Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize:
                                  screenWidth * (isPortrait ? 0.04 : 0.02),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xfffcbc1c)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.settings, color: Colors.amber),
                        SizedBox(
                            width: screenWidth * (isPortrait ? 0.1 : 0.05)),
                        // Espacement entre l'icône et le texte
                        Text(
                          'Paramètres',
                          style: TextStyle(
                              fontSize:
                                  screenWidth * (isPortrait ? 0.04 : 0.02),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xfffcbc1c)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AideEntreprise()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.help, color: Colors.amber),
                        SizedBox(
                            width: screenWidth * (isPortrait ? 0.1 : 0.05)),
                        // Espacement entre l'icône et le texte
                        Text(
                          'Parrainage',
                          style: TextStyle(
                              fontSize:
                                  screenWidth * (isPortrait ? 0.04 : 0.02),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xfffcbc1c)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginEntreprise()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.logout, color: Colors.red),
                        SizedBox(
                            width: screenWidth * (isPortrait ? 0.1 : 0.05)),
                        // Espacement entre l'icône et le texte
                        Text(
                          'Déconnexion',
                          style: TextStyle(
                              fontSize:
                                  screenWidth * (isPortrait ? 0.04 : 0.02),
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.08 : 0.1)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.library_books,
                        color: Color(0xff072858),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Version : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072858)),
                            ),
                            TextSpan(
                              text: '1.0.0',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff072858),
        // Couleur de fond du BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Campagne',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Statistique',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
