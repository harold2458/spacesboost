import 'package:flutter/material.dart';
import 'admin_dashboard.dart';
import 'admin_distribution.dart';
import 'admin_gestion.dart';
import 'admin_login.dart';
import 'admin_notifications.dart';
import 'admin_profil.dart';
import 'admin_settings.dart';
import 'admin_statistiques.dart';
import 'admin_validation.dart';

class AdminBeforeDashboard extends StatefulWidget {
  final int initialIndex;
  final int? tabIndex;
  const AdminBeforeDashboard({super.key, this.initialIndex = 2, this.tabIndex = 0});

  @override
  State<AdminBeforeDashboard> createState() => _AdminBeforeDashboardState();
}

class _AdminBeforeDashboardState extends State<AdminBeforeDashboard> {

  late int _selectIndex;

  @override
  void initState() {
    super.initState();
    _selectIndex = widget.initialIndex;
  }

  static final List<String> _title = [
    'Gestion',
    'Validation',
    'Dashboard',
    'Statistiques',
    'Distribution'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    final List<Widget> pages = [
      AdminGestion(initialIndex: widget.tabIndex ?? 0,),
      const AdminValidation(),
      const AdminDashboard(),
      const AdminStatistiques(),
      const AdminDistribution()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_selectIndex], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff072858),
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: Image.asset('assets/logos/icon_admin.png'),
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  // Ouvre le drawer
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, size: screenWidth * (isPortrait ? 0.1 : 0.05), color: const Color(0xfffcbc1c)),
              );
            },
          ),
        ],
      ),
      body: pages[_selectIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: screenHeight * (isPortrait ? 0.35 : 0.5),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xff072858),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * (isPortrait ? 0.15 : 0.04),
                      backgroundImage: const AssetImage('assets/images/profil.jpg'),
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.03)),
                    Text('Admin SUPER', style: TextStyle(color: const Color(0xfffcbc1c), fontSize: screenWidth * (isPortrait ? 0.04 : 0.02), fontWeight: FontWeight.bold)),
                    Text('adminsuper@gmail.com', style: TextStyle(color: const Color(0xfffcbc1c), fontSize: screenWidth * (isPortrait ? 0.03 : 0.01))),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminProfil()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminNotifications()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminSettings()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLogin()));
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
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'Gestion'),
          BottomNavigationBarItem(icon: Icon(Icons.verified), label: 'Validation'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Statistiques'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Distribution'),
        ],
        currentIndex: _selectIndex,
        elevation: 3.0,
        unselectedItemColor: Colors.white,
        //selectedItemColor: const Color(0xff072858),
        selectedItemColor: const Color(0xfffcbc1c),
        unselectedLabelStyle: TextStyle(fontSize: screenWidth * (isPortrait ? 0.025 : 0.02),),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * (isPortrait ? 0.025 : 0.02),),
        backgroundColor: const Color(0xff072858),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
