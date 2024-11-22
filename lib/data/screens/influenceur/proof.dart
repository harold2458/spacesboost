import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/preuve_en_cours.dart';
import 'package:projet_mobile/data/screens/influenceur/preuve_envoyee.dart';
import 'package:projet_mobile/data/screens/influenceur/preuve_terminee.dart';

class Proof extends StatefulWidget {
  const Proof({super.key});

  @override
  State<Proof> createState() => _ProofState();
}

class _ProofState extends State<Proof> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialisation du TabController
    _tabController = TabController(length: 3, vsync: this);
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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, screenHeight * (isPortrait ? 0.1 : 0.17)),
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      PreuveEnCours(),
                      PreuveEnvoyee(),
                      PreuveTerminee()
                    ],
                  ),
                ),
              )
            ],
          ),
          if (isPortrait)
            Image.asset(
              'assets/images/forme_jaune_haut.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Transform.translate(
            offset: Offset(0, -screenHeight * (isPortrait ? 0.35 : 0.18)),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xfffae99a),
                    borderRadius: BorderRadius.circular(10)),
                width: screenWidth * (isPortrait ? 0.8 : 0.5),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * (isPortrait ? 0.005 : 0.03),
                  horizontal: screenWidth * (isPortrait ? 0.02 : 0.03),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  // Couleur du texte de l'item sélectionné
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: Colors.black,
                  // Couleur du texte des items non sélectionnés
                  indicator: BoxDecoration(
                    color: const Color(0xfffcbc1c),
                    // Couleur de fond de l'item sélectionné
                    borderRadius: BorderRadius.circular(
                        5), // Optionnel : pour arrondir les bords
                  ),
                  tabs: [
                    Tab(
                        child: SizedBox(
                      width: screenWidth * (isPortrait ? 0.2 : 0.1),
                      child: const Column(
                        children: [Icon(Icons.timelapse), Text('En cours')],
                      ),
                    )),
                    Tab(
                        child: SizedBox(
                      width: screenWidth * (isPortrait ? 0.2 : 0.1),
                      child: const Column(
                        children: [
                          Icon(Icons.send),
                          Text(
                            'Envoyée',
                          )
                        ],
                      ),
                    )),
                    Tab(
                        child: SizedBox(
                      width: screenWidth * (isPortrait ? 0.2 : 0.1),
                      child: const Column(
                        children: [Icon(Icons.check_circle), Text('Terminée')],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
