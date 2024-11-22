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

  bool _imagesLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Préchargement des images avec un contexte valide
    _preloadImages();
  }

  // Fonction de préchargement des images
  Future<void> _preloadImages() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/Campagne_P.png'), context),
      precacheImage(const AssetImage('assets/images/image2.png'), context),
      precacheImage(const AssetImage('assets/images/image3.png'), context),
      precacheImage(const AssetImage('assets/images/image4.png'), context),
      precacheImage(const AssetImage('assets/images/image5.png'), context),
      precacheImage(const AssetImage('assets/images/sondage.png'), context),
      precacheImage(const AssetImage('assets/images/campagne.png'), context),
      precacheImage(const AssetImage('assets/images/parrainage.png'), context),
      precacheImage(const AssetImage('assets/images/retrait.png'), context),
      precacheImage(const AssetImage('assets/images/preuve.png'), context),
    ]);

    setState(() {
      _imagesLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * (isPortrait ? 0.3 : 0.4),
              width: screenWidth * (isPortrait ? 0.6 : 0.4),
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return !_imagesLoaded ?
                  const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
                    Image.asset(
                    imgList[index]['image'] ?? 'assets/images/default.png',
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            SizedBox(
              //width: screenWidth * (isPortrait ? 0.49 : 0.25),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _toggleBalance,
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)), // Couleur de fond
                  //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 20)), // Espacement
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Coins arrondis
                  )),
                  elevation: const WidgetStatePropertyAll(3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icône
                    Icon(
                      _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.05),), // Espacement entre l'icône et le texte
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
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * (isPortrait ? 0.2 : 0.3),
                  width: screenWidth * (isPortrait ? 0.4 : 0.2),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        elevation: const WidgetStatePropertyAll(3),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 0)));
                      }, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: !_imagesLoaded ?
                      const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
                      Image.asset('assets/images/campagne.png', width: screenWidth * (isPortrait ? 0.25 : 0.1),),),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05),),
                      const Text('Campagne', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      ),)
                    ],
                  )),
                ),
                SizedBox(width: screenWidth * (isPortrait ? 0.07 : 0.15),),
                SizedBox(
                  height: screenHeight * (isPortrait ? 0.2 : 0.3),
                  width: screenWidth * (isPortrait ? 0.4 : 0.2),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        elevation: const WidgetStatePropertyAll(3),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 1)));
                      }, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: !_imagesLoaded ?
                      const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
                      Image.asset('assets/images/parrainage.png', width: screenWidth * (isPortrait ? 0.25 : 0.1),),),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05),),
                      const Text('Parrainage', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      ),)
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.15),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * (isPortrait ? 0.2 : 0.3),
                  width: screenWidth * (isPortrait ? 0.4 : 0.2),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        elevation: const WidgetStatePropertyAll(3),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 3)));
                      }, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: !_imagesLoaded ?
                      const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
                      Image.asset('assets/images/retrait.png', width: screenWidth * (isPortrait ? 0.25 : 0.1),),),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05),),
                      const Text('Retrait', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      ),)
                    ],
                  )),
                ),
                SizedBox(width: screenWidth * (isPortrait ? 0.07 : 0.15),),
                SizedBox(
                  height: screenHeight * (isPortrait ? 0.2 : 0.3),
                  width: screenWidth * (isPortrait ? 0.4 : 0.2),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        elevation: const WidgetStatePropertyAll(3),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BeforeHome(initialIndex: 4)));
                      }, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: !_imagesLoaded ?
                      const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
                      Image.asset('assets/images/preuve.png', width: screenWidth * (isPortrait ? 0.15 : 0.05),),),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.05),),
                      const Text('Preuve', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      ),)
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
