import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/campaign.dart';
import 'package:projet_mobile/data/screens/help.dart';
import 'package:projet_mobile/data/screens/influenceur_login.dart';
import 'package:projet_mobile/data/screens/notifications.dart';
import 'package:projet_mobile/data/screens/profil.dart';
import 'package:projet_mobile/data/screens/proof.dart';
import 'package:projet_mobile/data/screens/settings.dart';
import 'package:projet_mobile/data/screens/sponsoring.dart';
import 'package:projet_mobile/data/screens/withdraw.dart';
import 'home.dart';

class BeforeHome extends StatefulWidget {
  final int initialIndex;
  const BeforeHome({super.key, this.initialIndex = 2});

  @override
  State<BeforeHome> createState() => _BeforeHomeState();
}

class _BeforeHomeState extends State<BeforeHome> {

  late int _selectIndex;

  static final List<String> _title = [
    'Campagne',
    'Parrainage',
    'Accueil',
    'Retrait',
    'Preuve'
  ];

  static final List<Widget> _pages = [
    const Campaign(),
    const Sponsoring(),
    const Home(),
    const Withdraw(),
    const Proof()
  ];

  @override
  void initState() {
    super.initState();
    // Initialisation de _selectIndex avec le paramètre initialIndex
    _selectIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      // Mettre à jour _selectIndex avec l'index sélectionné
      _selectIndex = index;
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
        title: Text(_title[_selectIndex], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0XFFFCBC1C),
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: Image.asset('assets/logos/icon.png'),
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  // Ouvre le drawer
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, size: screenWidth * (isPortrait ? 0.1 : 0.05), color: const Color(0xff072858)),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: screenHeight * (isPortrait ? 0.35 : 0.5),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0XFFFCBC1C),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * (isPortrait ? 0.15 : 0.04),
                      backgroundImage: const AssetImage('assets/images/profil.jpg'),
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.03)),
                    Text('Gafour YEKINI', style: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold)),
                    Text('yekiniabdougafour@gmail.com', style: TextStyle(color: Colors.white, fontSize: screenWidth * (isPortrait ? 0.03 : 0.01))),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Profil()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.person, color: Color(0xff072858)),
                        SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05)), // Espacement entre l'icône et le texte
                        Text(
                          'Profil',
                          style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold, color: const Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.notifications, color: Color(0xff072858)),
                        SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05)), // Espacement entre l'icône et le texte
                        Text(
                          'Notifications',
                          style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold, color: const Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.settings, color: Color(0xff072858)),
                        SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05)), // Espacement entre l'icône et le texte
                        Text(
                          'Paramètres',
                          style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold, color: const Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Help()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.help, color: Color(0xff072858)),
                        SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05)), // Espacement entre l'icône et le texte
                        Text(
                          'Aide',
                          style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold, color: const Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const InfluenceurLogin()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        const Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: screenWidth * (isPortrait ? 0.1 : 0.05)), // Espacement entre l'icône et le texte
                        Text(
                          'Déconnexion',
                          style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.08 : 0.1)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.library_books, color: Color(0xff072858),),
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
                        ), textAlign: TextAlign.justify,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: 'Campagne'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add_alt_1), label: 'Parrainage'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Retrait'),
          BottomNavigationBarItem(icon: Icon(Icons.fact_check), label: 'Preuve'),
        ],
        currentIndex: _selectIndex,
        elevation: 3.0,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xff072858),
        unselectedLabelStyle: TextStyle(fontSize: screenWidth * (isPortrait ? 0.025 : 0.02),),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * (isPortrait ? 0.025 : 0.02),),
        backgroundColor: const Color(0XFFFCBC1C),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
