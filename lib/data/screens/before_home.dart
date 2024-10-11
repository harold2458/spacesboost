import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/campaign.dart';
import 'package:projet_mobile/data/screens/proof.dart';
import 'package:projet_mobile/data/screens/sponsoring.dart';
import 'package:projet_mobile/data/screens/withdraw.dart';
import 'home.dart';
import 'influenceur_login.dart';

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
          IconButton(
            onPressed: () {
              // Ouvre le drawer (navigation latérale)
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, size: 35, color: Color(0xff072858)),
          )
        ],
      ),
      body: _pages[_selectIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0XFFFCBC1C),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/logos/profile.jpg'),
                  ),
                   SizedBox(height: 10),
                   Text('Nom de l’utilisateur', style: TextStyle(color: Colors.white, fontSize: 18)),
                   Text('email@exemple.com', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                // Action pour le profil
              },
              icon: const Icon(Icons.person),
              label: const Text('Profil'),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                // Action pour les notifications
              },
              icon: const Icon(Icons.notifications),
              label: const Text('Notifications'),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                // Action pour les paramètres
              },
              icon: const Icon(Icons.settings),
              label: const Text('Paramètres'),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                // Action pour l'aide
              },
              icon: const Icon(Icons.help),
              label: const Text('Aide'),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InfluenceurLogin()));
              },
              icon: const Icon(Icons.logout),
              label: const Text('Déconnexion'),
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
