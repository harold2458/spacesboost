import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/profile_type.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            SizedBox(
              height: 600,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        imgList[index]['image'] ?? 'assets/images/default.png',
                        width: 330,
                      ),
                      const SizedBox(height: 70),
                      Text(
                        imgList[index]['titre'] ?? 'Titre indisponible',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        imgList[index]['description'] ?? 'Description indisponible',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileType()));
              },
              style: ButtonStyle(
                  side: const WidgetStatePropertyAll(BorderSide(color: Color(0xff072858))),
                  elevation: const WidgetStatePropertyAll(5),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  backgroundColor: const WidgetStatePropertyAll(Colors.white)
              ),
              child: const Text(
                'Étape Suivante',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff072858), // Texte en jaune
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
