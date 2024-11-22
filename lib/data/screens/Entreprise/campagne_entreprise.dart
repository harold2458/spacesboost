import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/annonce_entreprise.dart';
import 'package:projet_mobile/data/screens/Entreprise/creation_entreprise.dart';
import 'package:projet_mobile/data/screens/Entreprise/promotion_entreprise.dart';

class CampagneEntreprise extends StatefulWidget {
  const CampagneEntreprise({super.key});

  @override
  State<CampagneEntreprise> createState() => _CampagneEntrepriseState();
}

class _CampagneEntrepriseState extends State<CampagneEntreprise> {
  // Variable to manage the influencer checkbox state
  bool isInfluencerChecked = false; // Initialize according to your logic

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff072858),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  height: 100,
                ),
                Transform.translate(
                  offset: const Offset(0, 12),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0x9169799D),
                      ),
                      width: 310,
                      padding: const EdgeInsets.all(5),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: const Color(0xff072858),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tabs: const <Widget>[
                          Tab(
                            height: 60,
                            child: SizedBox(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.announcement),
                                  Text(
                                    'Annonce',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Tab(
                            height: 60,
                            child: SizedBox(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.local_offer),
                                  Text(
                                    'Promotion',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Tab(
                            height: 60,
                            child: SizedBox(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.create),
                                  Text(
                                    'Creation',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  AnnonceEntreprise(),
                  PromotionEntreprise(isInfluencerChecked: isInfluencerChecked), // Correctly pass the checkbox state
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
