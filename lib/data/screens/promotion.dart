import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'content.dart';

class Promotion extends StatefulWidget {
  const Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {

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
      await precacheImage(const AssetImage('assets/images/annonce.jpg'), context);
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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.15), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Content()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 2, // Rayon de diffusion
                        blurRadius: 2, // Flou de l'ombre
                        offset: const Offset(0, 2), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                  child: Row(
                      children: [
                        !_imagesLoaded ?
                        const CircularProgressIndicator(color: Color(0XFFFCBC1C),) : Image.asset('assets/images/annonce.jpg', width: screenWidth * (isPortrait ? 0.3 : 0.2),),
                        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                        Column(
                          children: [
                            Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * (isPortrait ? 0.03 : 0.02),
                                color: Color(0xff072858)
                            )),
                            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.03),),
                            Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                              , style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                                  fontStyle: FontStyle.italic
                              ), ),
                          ],
                        ),])),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Content()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 2, // Rayon de diffusion
                        blurRadius: 2, // Flou de l'ombre
                        offset: const Offset(0, 2), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                  child: Row(
                      children: [
                        !_imagesLoaded ?
                        const CircularProgressIndicator(color: Color(0XFFFCBC1C),) : Image.asset('assets/images/annonce.jpg', width: screenWidth * (isPortrait ? 0.3 : 0.2),),
                        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                        Column(
                          children: [
                            Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * (isPortrait ? 0.03 : 0.02),
                                color: Color(0xff072858)
                            )),
                            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.03),),
                            Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                              , style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                                  fontStyle: FontStyle.italic
                              ), ),
                          ],
                        ),])),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Content()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 2, // Rayon de diffusion
                        blurRadius: 2, // Flou de l'ombre
                        offset: const Offset(0, 2), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                  child: Row(
                      children: [
                        !_imagesLoaded ?
                        const CircularProgressIndicator(color: Color(0XFFFCBC1C),) : Image.asset('assets/images/annonce.jpg', width: screenWidth * (isPortrait ? 0.3 : 0.2),),
                        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                        Column(
                          children: [
                            Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * (isPortrait ? 0.03 : 0.02),
                                color: Color(0xff072858)
                            )),
                            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.03),),
                            Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                              , style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                                  fontStyle: FontStyle.italic
                              ), ),
                          ],
                        ),])),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Content()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 2, // Rayon de diffusion
                        blurRadius: 2, // Flou de l'ombre
                        offset: const Offset(0, 2), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                  child: Row(
                      children: [
                        !_imagesLoaded ?
                        const CircularProgressIndicator(color: Color(0XFFFCBC1C),) : Image.asset('assets/images/annonce.jpg', width: screenWidth * (isPortrait ? 0.3 : 0.2),),
                        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                        Column(
                          children: [
                            Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * (isPortrait ? 0.03 : 0.02),
                                color: Color(0xff072858)
                            )),
                            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.03),),
                            Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                              , style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                                  fontStyle: FontStyle.italic
                              ), ),
                          ],
                        ),])),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Content()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 2, // Rayon de diffusion
                        blurRadius: 2, // Flou de l'ombre
                        offset: const Offset(0, 2), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                  child: Row(
                      children: [
                        !_imagesLoaded ?
                        const CircularProgressIndicator(color: Color(0XFFFCBC1C),) : Image.asset('assets/images/annonce.jpg', width: screenWidth * (isPortrait ? 0.3 : 0.2),),
                        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                        Column(
                          children: [
                            Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * (isPortrait ? 0.03 : 0.02),
                                color: Color(0xff072858)
                            )),
                            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.03),),
                            Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                              , style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                                  fontStyle: FontStyle.italic
                              ), ),
                          ],
                        ),])),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Content()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 2, // Rayon de diffusion
                        blurRadius: 2, // Flou de l'ombre
                        offset: const Offset(0, 2), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                  child: Row(
                      children: [
                        !_imagesLoaded ?
                        const CircularProgressIndicator(color: Color(0XFFFCBC1C),) : Image.asset('assets/images/annonce.jpg', width: screenWidth * (isPortrait ? 0.3 : 0.2),),
                        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1),),
                        Column(
                          children: [
                            Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * (isPortrait ? 0.03 : 0.02),
                                color: Color(0xff072858)
                            )),
                            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.03),),
                            Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                              , style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                                  fontStyle: FontStyle.italic
                              ), ),
                          ],
                        ),])),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1),),
          ],
        ),
      )
    );
  }
}
