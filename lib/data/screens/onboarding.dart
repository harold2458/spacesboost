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
    {'image': 'assets/images/image5.png', 'titre': 'Boutique', 'description': 'À chacun sa boutique !\nCréer votre boutique et vendre vos articles facilement. On s\'occupe de la livraision.'},
    {'image': 'assets/images/sondage.png', 'titre': 'Sondage', 'description': 'Maximum de réponses\nObtenir rapidement des réponses de vos enquêtes ou sondages près de votre cible.'},
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
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait; // Vérification de l'orientation

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1)),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * (isPortrait ? 0.6 : 1.3),
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        imgList[index]['image'] ?? 'assets/images/default.png',
                        width: screenWidth * (isPortrait ? 0.5 : 0.3), // Largeur proportionnelle
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.08 : 0.2)), // Espacement proportionnel
                      Text(
                        imgList[index]['titre'] ?? 'Titre indisponible',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.05 : 0.03), // Texte adaptatif
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.06)),
                      Text(
                        imgList[index]['description'] ?? 'Description indisponible',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.02)),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: isPortrait ? screenHeight * 0.08 : screenHeight * 0.1), // Espacement selon orientation
            SizedBox(
              width: double.infinity,
              height: screenHeight * (isPortrait ? 0.07 : 0.2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileType()),
                  );
                },
                style: ButtonStyle(
                  side: const WidgetStatePropertyAll(
                    BorderSide(color: Color(0xff072858)),
                  ),
                  elevation: const WidgetStatePropertyAll(3),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                ),
                child: Text(
                  'Étape Suivante',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * (isPortrait ? 0.05 : 0.03), // Texte adaptatif
                    color: const Color(0xff072858),
                  ),
                ),
              ),
            ),
            SizedBox(height: isPortrait ? screenHeight * 0 : screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
