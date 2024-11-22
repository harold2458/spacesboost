import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/formulaire_preuve.dart';

class ContentEnCours extends StatefulWidget {
  const ContentEnCours({super.key});

  @override
  State<ContentEnCours> createState() => _ContentEnCoursState();
}

class _ContentEnCoursState extends State<ContentEnCours> {
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
          const AssetImage('assets/images/annonce.jpg'), context);
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
      appBar: AppBar(
        title: const Text(
          'Contenu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFFFCBC1C),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (isPortrait ? 0.05 : 0.1),
              vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '🎯 Titre : ',
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.04 : 0.025),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff072858)),
                  ),
                  const TextSpan(
                    text:
                        'Recherche d\'Influenceur pour Collaboration dans le Secteur de la Mode',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: screenHeight * (isPortrait ? 0.03 : 0.1),
            ),
            !_imagesLoaded
                ? const CircularProgressIndicator(
                    color: Color(0XFFFCBC1C),
                  )
                : Image.asset(
                    'assets/images/annonce.jpg',
                    width: screenWidth * (isPortrait ? 0.7 : 0.3),
                  ),
            SizedBox(
              height: screenHeight * (isPortrait ? 0.03 : 0.1),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '📄 Description : ',
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff072858)),
                  ),
                  const TextSpan(
                    text:
                        'Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur passionné par la mode pour collaborer avec nous et promouvoir nos nouvelles collections. Si tu es créatif, authentique et tu as une audience engagée sur Instagram, TikTok ou YouTube, cette opportunité est faite pour toi !',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: screenHeight * (isPortrait ? 0.03 : 0.1),
            ),
            Row(
              children: [
                Text(
                  'Ce que nous recherchons :',
                  style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: const Color(0xff072858)),
                ),
              ],
            ),
            const Text(
              '- Un(e) influenceur(se) avec un minimum de 10k abonnés.\n'
              '- Une passion pour la mode, avec un contenu déjà orienté vers les tendances vestimentaires.\n'
              '- Capacité à produire des vidéos, photos, et stories créatives.\n'
              '- Engagement avec une communauté active.',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: screenHeight * (isPortrait ? 0.03 : 0.1),
            ),
            Row(
              children: [
                Text(
                  'Ce que nous offrons :',
                  style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: const Color(0xff072858)),
                ),
              ],
            ),
            const Text(
              '- Des vêtements de notre nouvelle collection offerts.\n'
              '- Rémunération selon l\'audience et le type de contenu produit.\n'
              '- Visibilité à travers notre réseau et nos campagnes publicitaires.',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: screenHeight * (isPortrait ? 0.03 : 0.1),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '👆 Comment postuler : ',
                    style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff072858)),
                  ),
                  const TextSpan(
                      text: 'Cliquez juste sur le boutton soumettre',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: screenHeight * (isPortrait ? 0.04 : 0.1),
            ),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              // Largeur du bouton ajustée
              height: screenHeight * (isPortrait ? 0.06 : 0.2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormulairePreuve()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xff072858)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Bordures arrondies
                    ),
                  ),
                  elevation: const WidgetStatePropertyAll(3),
                ),
                child: Text(
                  'Soumettre',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
