import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/login_entreprise.dart';
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
    {'image': 'assets/images/Campagne P.png', 'text': 'Campagne Publicitaire'},
    {'image': 'assets/images/image2.png', 'text': 'Promotion des Produits'},
    {'image': 'assets/images/image3.jpg', 'text': 'Création de contenus'},
    {'image': 'assets/images/image4.png', 'text': 'Taxi Boost'},
    {'image': 'assets/images/image5.png', 'text': 'Boutique'},
    {'image': 'assets/images/sondage.png', 'text': 'Sondage'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Défilement automatique
    Future.delayed(Duration.zero, () {
      Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (_currentPage < imgList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
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

  void _onNextPage() {
    if (_currentPage < imgList.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Rediriger vers la page de login
      Navigator.pushReplacementNamed(context, '/profil');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const ProfileType())), // Action pour passer l'étape
                child: Text(
                  'Passer',
                  style: TextStyle(
                    color: Color(0xfffcbc1c), // Utilisation du jaune
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Spacer(),
                      Image.asset(
                        imgList[index]['image']!,
                        height: 250,
                      ),
                      Spacer(),
                      Text(
                        imgList[index]['text']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, '
                        'vitae scelerisque enim ligula venenatis dolor.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onNextPage,
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xfffcbc1c),
                backgroundColor: Colors.white, // Bordure et texte en jaune
                side: BorderSide(color: Color(0xfffcbc1c)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Étape Suivante',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xfffcbc1c), // Texte en jaune
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
