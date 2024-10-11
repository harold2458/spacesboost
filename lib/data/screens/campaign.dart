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
      body: Column(
        children: [
          Container(
            width: 350,
            color: Colors.yellow, // Couleur de fond du TabBar
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white, // Couleur du texte de l'item sélectionné
              unselectedLabelColor: Colors.black, // Couleur du texte des items non sélectionnés
              indicator: BoxDecoration(
                color: Colors.blue, // Couleur de fond de l'item sélectionné
                borderRadius: BorderRadius.circular(5), // Optionnel : pour arrondir les bords
              ),
              tabs: const [
                Tab(text: 'Annonce', icon: Icon(Icons.campaign)),
                Tab(text: 'Promotion', icon: Icon(Icons.card_giftcard)),
                Tab(text: 'Création', icon: Icon(Icons.brush)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Annonce(),
                Promotion(),
                Creation()
              ],
            ),
          )
        ],
      ),
    );
  }
}
