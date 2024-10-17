import 'package:flutter/material.dart';
import 'dart:async';

import 'before_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentPage = 0;
  late PageController _pageController;

  final List<Map<String, String>> imgList = [
    {'image': 'assets/images/Campagne_P.png', 'titre': 'Campagne Publicitaire', 'description': 'Votre clientèle est ici !\nCréer et gérer des campagnes publicitaires complètes et performantes.'},
    {'image': 'assets/images/image2.png', 'titre': 'Promotion des Produits', 'description': 'Plus proche de vos clients\nDiffuser vos publicités à une audience très large et spécifique avec nos influenceurs qui collent avec votre marque.'},
    {'image': 'assets/images/image3.png', 'titre': 'Création de contenus', 'description': 'Contenus attrayants\nObtenez des contenus posts, images, stories, et vidéos mettant en scène votre marque via nos influenceurs.'},
    {'image': 'assets/images/image4.png', 'titre': 'Taxi Boost', 'description': 'Off Line\nDes taxis mis à votre disposition pour être le support de vos publicités afin d\'avoir une visibilité accrue.'},
    {'image': 'assets/images/image5.png', 'titre': 'Boutique', 'description': 'À chacun sa boutique !\n Créer votre boutique et vendre vos articles facilement. On s\'occupe de la livraision.'},
    {'image': 'assets/images/sondage.png', 'titre': 'Sondage', 'description': 'Maximum de réponses\nObtenir rapidement des réponses de vos enquetes ou sondage près de votre cible.'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Défilement automatique
    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        if (_currentPage < imgList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _isBalanceVisible = false;
  final double _balanceAmount = 150.75; // Montant de l'exemple

  void _toggleBalance() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 330,
              width: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgList[index]['image'] ?? 'assets/images/default.png',
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                            elevation: const WidgetStatePropertyAll(15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 0)));
                          }, child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Center(child: Image.asset('assets/images/campagne.png', width: 100,),),
                          const SizedBox(height: 20),
                          const Text('Campagne', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff072858)
                          ),)
                        ],
                      )),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                            elevation: const WidgetStatePropertyAll(15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 3)));
                          }, child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Center(child: Image.asset('assets/images/retrait.png', width: 100,),),
                          const SizedBox(height: 20),
                          const Text('Retrait', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff072858)
                          ),)
                        ],
                      )),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    SizedBox(
                      width: 175,
                      child: ElevatedButton(
                        onPressed: _toggleBalance,
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)), // Couleur de fond
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 20)), // Espacement
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Coins arrondis
                          )),
                          elevation: const WidgetStatePropertyAll(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icône
                            Icon(
                              _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10), // Espacement entre l'icône et le texte
                            // Texte
                            Text(
                              _isBalanceVisible
                                  ? '\$ $_balanceAmount' // Afficher le montant
                                  : 'Afficher solde', // Afficher le texte initial
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                            elevation: const WidgetStatePropertyAll(15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 1)));
                          }, child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Center(child: Image.asset('assets/images/parrainage.png', width: 100,),),
                          const SizedBox(height: 20),
                          const Text('Parrainage', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff072858)
                          ),)
                        ],
                      )),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                            elevation: const WidgetStatePropertyAll(15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 4)));
                          }, child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Center(child: Image.asset('assets/images/preuve.png', width: 60,),),
                          const SizedBox(height: 20),
                          const Text('Preuve', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff072858)
                          ),)
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}
