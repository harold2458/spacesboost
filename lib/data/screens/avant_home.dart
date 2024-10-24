import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/aide_entreprise.dart';
import 'package:projet_mobile/data/screens/campagne_entreprise.dart';
import 'package:projet_mobile/data/screens/home_entrentreprise.dart';
import 'package:projet_mobile/data/screens/sondage_entreprise.dart';
import 'package:projet_mobile/data/screens/statistique_entreprise.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF072858),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/logos/icon.jpg',
            height: 300,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white), // Icône de menu
            onPressed: () {
              // Action à exécuter lors du clic sur l'icône de menu
              print("Menu icon clicked");
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff072858), // Couleur de fond du BottomNavigationBar
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
