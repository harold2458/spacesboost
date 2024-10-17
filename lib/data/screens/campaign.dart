import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/promotion.dart';

import 'annonce.dart';
import 'creation.dart';

class Campaign extends StatefulWidget {
  const Campaign({super.key});

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> with SingleTickerProviderStateMixin {

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
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
                Expanded(
                  child: Transform.translate(offset: const Offset(0, 90),
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Annonce(),
                      Promotion(),
                      Creation()
                    ],
                  ),
                  ),
              )
            ],
          ),
          Image.asset('assets/images/forme_jaune_haut.png', width: double.infinity, fit: BoxFit.cover,),
          Transform.translate(offset: const Offset(0, -320),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xfffae99a),
                  borderRadius: BorderRadius.circular(10)
              ),
              width: 330,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              //color: Colors.yellow, // Couleur de fond du TabBar
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white, // Couleur du texte de l'item sélectionné
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                unselectedLabelColor: Colors.black, // Couleur du texte des items non sélectionnés
                indicator: BoxDecoration(
                  color: const Color(0xfffcbc1c), // Couleur de fond de l'item sélectionné
                  borderRadius: BorderRadius.circular(5), // Optionnel : pour arrondir les bords
                ),
                tabs: const [
                  Tab(
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            Icon(Icons.campaign),
                            Text('Annonce')
                          ],
                        ),
                      )
                  ),
                  Tab(
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            Icon(Icons.card_giftcard),
                            Text('Promotion')
                          ],
                        ),
                      )
                  ),
                  Tab(
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            Icon(Icons.brush),
                            Text('Création')
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),)
        ],
      ),
    );
  }
}
