import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/annonce_entreprise.dart';
import 'package:projet_mobile/data/screens/creation_entreprise.dart';
import 'package:projet_mobile/data/screens/promotion_entreprise.dart';

class CampagneEntreprise extends StatefulWidget {
  const CampagneEntreprise({super.key});

  @override
  State<CampagneEntreprise> createState() => _CampagneEntrepriseState();
}

class _CampagneEntrepriseState extends State<CampagneEntreprise> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                // Couleur de fond du TabBar
                decoration: BoxDecoration(
                  color: const Color(0xff072858), // Couleur de fond globale
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: SizedBox(
                  child: TabBar(
                    labelColor: Color(0xfffcbc1c), // Couleur du texte actif
                    unselectedLabelColor: Colors.white, // Couleur du texte inactif
                    indicator: BoxDecoration(
                      color: Color.fromARGB(255, 52, 71, 99), // Couleur de fond de l'onglet sélectionné (orange)
                      borderRadius: BorderRadius.circular(8), // Coins arrondis pour l'onglet actif
                    ),
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Ajuster la taille de l'indicateur
                    tabs: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10), // Ajuster l'espacement horizontal
                        child: const Tab(
                          icon: Icon(Icons.announcement, size: 17),
                          child: Text(
                            'Annonce',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10), // Ajuster l'espacement horizontal
                        child: const Tab(
                          icon: Icon(Icons.local_offer, size: 18),
                          child: Text(
                            'Promotion',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10), // Ajuster l'espacement horizontal
                        child: const Tab(
                          icon: Icon(Icons.create, size: 18),
                          child: Text(
                            'Creation',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: const TabBarView(
                children: <Widget>[
                  AnnonceEntreprise(),
                  PromotionEntreprise(),
                  CreationEntreprise(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
