import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/aide_entreprise.dart';
import 'package:projet_mobile/data/screens/campagne_entreprise.dart';
import 'package:projet_mobile/data/screens/home_entrentreprise.dart';
import 'package:projet_mobile/data/screens/login_entreprise.dart';
import 'package:projet_mobile/data/screens/notification_entreprise.dart';
import 'package:projet_mobile/data/screens/profile_entreprise.dart';
import 'package:projet_mobile/data/screens/settings_entreprise.dart';
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

  // Pages à afficher dans les onglets
  static final List<Widget> _pages = [
    HomeEntreprise(onTabSelected: (index) {}),
    AideEntreprise(),
    CampagneEntreprise(),
    StatistiqueEntreprise(),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: screenWidth * 0.05, // Responsive font size
          ),
        ),
        backgroundColor: const Color(0xFF072858),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: Image.asset(
            'assets/logos/icon.jpg',
            height: screenHeight * 0.04,
          ),
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  size: screenWidth * (isPortrait ? 0.08 : 0.05),
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeEntreprise(onTabSelected: _onItemTapped),
          const AideEntreprise(),
          const CampagneEntreprise(),
          const StatistiqueEntreprise(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: screenHeight * (isPortrait ? 0.3 : 0.5),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0Xff072858),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * (isPortrait ? 0.15 : 0.08),
                      backgroundImage: const AssetImage('assets/images/profil.jpg'),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Harold DIDAVI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'harolddidavi@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.person,
                    text: 'Profile',
                    iconColor: Colors.amber,
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfileEntreprise()),
                        );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildDrawerItem(
                    context,
                    icon: Icons.notifications,
                    text: 'Notifications',
                    iconColor: Colors.amber,
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationEntreprise ()),
                        );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildDrawerItem(
                    context,
                    icon: Icons.settings,
                    text: 'Paramètres',
                    iconColor: Colors.amber,
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsEntreprise ()),
                        );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildDrawerItem(
                    context,
                    icon: Icons.card_giftcard,
                    text: 'Parrainnage',
                    iconColor: Colors.amber,
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AideEntreprise ()),
                        );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildDrawerItem(
                    context,
                    icon: Icons.logout,
                    text: 'Déconnexion',
                    iconColor: Colors.red,
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginEntreprise ()),
                        );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff072858),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Aide',
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
        selectedLabelStyle: TextStyle(fontSize: screenWidth * 0.035),
        unselectedLabelStyle: TextStyle(fontSize: screenWidth * 0.03),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  // Widget pour un élément du drawer
  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String text, required Color iconColor, required VoidCallback onTap}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: screenWidth * 0.05),
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
              fontWeight: FontWeight.bold,
              color: const Color(0xfffcbc1c),
            ),
          ),
        ],
      ),
    );
  }
}
