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
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_selectIndex], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0XFFFCBC1C),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
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
                icon: const Icon(Icons.menu, size: 35, color: Color(0xff072858)),
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
            const SizedBox(
              height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0XFFFCBC1C),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/profil.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text('Gafour YEKINI', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('yekiniabdougafour@gmail.com', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Profil()));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        Icon(Icons.person, color: Color(0xff072858)),
                        SizedBox(width: 50), // Espacement entre l'icône et le texte
                        Text(
                          'Profil',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications()));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        Icon(Icons.notifications, color: Color(0xff072858)),
                        SizedBox(width: 50), // Espacement entre l'icône et le texte
                        Text(
                          'Notifications',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        Icon(Icons.settings, color: Color(0xff072858)),
                        SizedBox(width: 50), // Espacement entre l'icône et le texte
                        Text(
                          'Paramètres',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Help()));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        Icon(Icons.help, color: Color(0xff072858)),
                        SizedBox(width: 50), // Espacement entre l'icône et le texte
                        Text(
                          'Aide',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff072858)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const InfluenceurLogin()));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min, // Empêche le Row de prendre toute la largeur
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 50), // Espacement entre l'icône et le texte
                        Text(
                          'Déconnexion',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.library_books, color: Color(0xff072858),),
                      const SizedBox(width: 30),
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
            const SizedBox(height: 10),
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
        elevation: 5.0,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xff072858),
        unselectedLabelStyle: const TextStyle(fontSize: 10.0),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
        backgroundColor: const Color(0XFFFCBC1C),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
