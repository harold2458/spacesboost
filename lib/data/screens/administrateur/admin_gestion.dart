import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/administrateur/admin_gestion_campagnes.dart';
import 'package:projet_mobile/data/screens/administrateur/admin_gestion_users.dart';

class AdminGestion extends StatefulWidget {
  final int initialIndex;
  const AdminGestion({super.key, this.initialIndex = 0});

  @override
  State<AdminGestion> createState() => _AdminGestionState();
}

class _AdminGestionState extends State<AdminGestion> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialIndex);

    // Écouter les changements pour mettre à jour si nécessaire
    _tabController.addListener(() {
      setState(() {}); // Pour rafraîchir l'interface si besoin
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xfffae99a),
                borderRadius: BorderRadius.circular(10)
            ),
            width: screenWidth * (isPortrait ? 0.8 : 0.5),
            padding: EdgeInsets.symmetric(vertical: screenHeight * (isPortrait ? 0.005 : 0.03), horizontal: screenWidth * (isPortrait ? 0.02 : 0.03),),
            height: screenHeight * (isPortrait ? 0.09 : 0.2),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: const Color(0xfffcbc1c),
                borderRadius: BorderRadius.circular(5),
              ),
              tabs: [
                Tab(
                  child: SizedBox(
                    width: screenWidth * (isPortrait ? 0.2 : 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.manage_accounts),
                        Text('Utilisateurs', style: TextStyle(fontSize: isPortrait ? screenWidth * 0.03 : null,),)
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: screenWidth * (isPortrait ? 0.2 : 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.campaign),
                        Text(
                          'Campagnes',
                          style: TextStyle(
                            fontSize: isPortrait ? screenWidth * 0.03 : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AdminGestionUsers(),
                  AdminGestionCampagnes(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
