import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/content_annonce.dart';

class Annonce extends StatefulWidget {
  const Annonce({super.key});

  @override
  State<Annonce> createState() => _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  bool _imagesLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Préchargement des images avec un contexte valide
    _preloadImages();
  }

  // Fonction de préchargement des images
  Future<void> _preloadImages() async {
    try {
      await precacheImage(
          const AssetImage(
            'assets/images/annonce.jpg',
          ),
          context);
      setState(() {
        _imagesLoaded = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors du préchargement de l\'image : $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * (isPortrait ? 0.05 : 0.15),
          vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContentAnnonce()),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(children: [
                  !_imagesLoaded
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFCBC1C),
                        )
                      : Image.asset(
                          'assets/images/annonce.jpg',
                          width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  Row(
                    children: [
                      Text('🎯 Collaboration dans le Secteur de la Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * (isPortrait ? 0.03 : 0.02),
                              color: const Color(0xff072858))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.01 : 0.03),
                  ),
                  Text(
                    "Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur ...",
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
          ),
          SizedBox(
            height: screenHeight * (isPortrait ? 0.025 : 0.1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContentAnnonce()),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(children: [
                  !_imagesLoaded
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFCBC1C),
                        )
                      : Image.asset(
                          'assets/images/annonce.jpg',
                          width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  Row(
                    children: [
                      Text('🎯 Collaboration dans le Secteur de la Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * (isPortrait ? 0.03 : 0.02),
                              color: const Color(0xff072858))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.01 : 0.03),
                  ),
                  Text(
                    "Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur ...",
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
          ),
          SizedBox(
            height: screenHeight * (isPortrait ? 0.025 : 0.1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContentAnnonce()),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(children: [
                  !_imagesLoaded
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFCBC1C),
                        )
                      : Image.asset(
                          'assets/images/annonce.jpg',
                          width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  Row(
                    children: [
                      Text('🎯 Collaboration dans le Secteur de la Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * (isPortrait ? 0.03 : 0.02),
                              color: const Color(0xff072858))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.01 : 0.03),
                  ),
                  Text(
                    "Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur ...",
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
          ),
          SizedBox(
            height: screenHeight * (isPortrait ? 0.025 : 0.1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContentAnnonce()),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(children: [
                  !_imagesLoaded
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFCBC1C),
                        )
                      : Image.asset(
                          'assets/images/annonce.jpg',
                          width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  Row(
                    children: [
                      Text('🎯 Collaboration dans le Secteur de la Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * (isPortrait ? 0.03 : 0.02),
                              color: const Color(0xff072858))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.01 : 0.03),
                  ),
                  Text(
                    "Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur ...",
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
          ),
          SizedBox(
            height: screenHeight * (isPortrait ? 0.025 : 0.1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContentAnnonce()),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(children: [
                  !_imagesLoaded
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFCBC1C),
                        )
                      : Image.asset(
                          'assets/images/annonce.jpg',
                          width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  Row(
                    children: [
                      Text('🎯 Collaboration dans le Secteur de la Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * (isPortrait ? 0.03 : 0.02),
                              color: const Color(0xff072858))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.01 : 0.03),
                  ),
                  Text(
                    "Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur ...",
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
          ),
          SizedBox(
            height: screenHeight * (isPortrait ? 0.025 : 0.1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContentAnnonce()),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // Couleur de l'ombre
                      spreadRadius: 2,
                      // Rayon de diffusion
                      blurRadius: 2,
                      // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(children: [
                  !_imagesLoaded
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFCBC1C),
                        )
                      : Image.asset(
                          'assets/images/annonce.jpg',
                          width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  Row(
                    children: [
                      Text('🎯 Collaboration dans le Secteur de la Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * (isPortrait ? 0.03 : 0.02),
                              color: const Color(0xff072858))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.01 : 0.03),
                  ),
                  Text(
                    "Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur ...",
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
          ),
          SizedBox(
            height: screenHeight * (isPortrait ? 0.1 : 0.1),
          ),
        ],
      ),
    ));
  }
}
