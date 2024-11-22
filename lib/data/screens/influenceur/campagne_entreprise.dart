import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/annonce_entreprise.dart';
import 'package:projet_mobile/data/screens/influenceur/creation_entreprise.dart';
import 'package:projet_mobile/data/screens/influenceur/promotion_entreprise.dart';

class CampagneEntreprise extends StatefulWidget {
  const CampagneEntreprise({super.key});

  @override
  State<CampagneEntreprise> createState() => _CampagneEntrepriseState();
}

class _CampagneEntrepriseState extends State<CampagneEntreprise> {
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
                 decoration:const BoxDecoration(
                   color: Color(0xff072858),
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(50),
                     bottomRight: Radius.circular(50),
                   ),
                 ),
                 //width: double.infinity,
                 height: 100,
               ),
               Transform.translate(
                 offset: const Offset(0, 12),
                 child: Center(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius:BorderRadius.circular(10),
                       color: const Color(0x9169799D),
                     ),
                      width: 310,
                     padding: const EdgeInsets.all(5),
                     // Deuxième container avec largeur définie
                     child: TabBar(
                       labelColor: Colors.white, // Couleur du texte actif
                       unselectedLabelColor: Colors.white, // Couleur du texte inactif
                       indicator: BoxDecoration(
                         color: const Color(0xff072858), // Couleur de fond de l'onglet sélectionné
                         borderRadius: BorderRadius.circular(8), // Coins arrondis pour l'onglet actif
                       ),
                       tabs: const <Widget>[
                         Tab(
                           height: 60,
                           child: SizedBox(
                             width: 100, // Définir la largeur fixe
                             child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(Icons.announcement),
                                 Text('Annonce',
                                   style: TextStyle(fontSize: 11),
                                 ), // Utiliser le widget Text correctement
                               ],
                             ),
                           ),
                         ),
                         Tab(
                           height: 60,
                           child: SizedBox(
                             width: 100, // Définir la largeur fixe
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(Icons.local_offer),
                                 Text('Promotion',
                                   style: TextStyle(fontSize: 11),
                                 ), // Utiliser le widget Text correctement
                               ],
                             ),
                           ),
                         ),
                         Tab(
                           height: 60,
                           child: SizedBox(
                             width: 100, // Définir la largeur fixe
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(Icons.create),
                                 Text('Creation',
                                   style: TextStyle(fontSize: 11),
                                 ), // Utiliser le widget Text correctement
                               ],
                             ),
                           ),
                         ),
                       ], // Fermeture du tableau des Tabs
                     ),),
                 ),
               )
             ],
           ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  AnnonceEntreprise(), // Remplace par le widget que tu souhaites afficher
                  PromotionEntreprise(), // Remplace par le widget que tu souhaites afficher
                  CreationEntreprise(), // Remplace par le widget que tu souhaites afficher
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
