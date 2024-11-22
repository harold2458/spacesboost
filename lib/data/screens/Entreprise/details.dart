import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic> annonce;

  const Details({Key? key, required this.annonce}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff072858),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            buildInformationText(
              title: 'Titre : ',
              content: annonce['titre'],
              screenWidth: screenWidth,
              isPortrait: isPortrait,
            ),
            const SizedBox(height: 20),
            buildInformationText(
              title: 'Description : ',
              content: annonce['description'].isNotEmpty
                  ? annonce['description']
                  : 'Aucune description fournie.',
              screenWidth: screenWidth,
              isPortrait: isPortrait,
            ),
            const SizedBox(height: 20),
            buildInformationText(
              title: 'Lien : ',
              content: annonce['lien'],
              screenWidth: screenWidth,
              isPortrait: isPortrait,
              isLink: true,
            ),
            const SizedBox(height: 20),
            buildInformationText(
              title: 'Fichier : ',
              content: annonce['fichier'],
              screenWidth: screenWidth,
              isPortrait: isPortrait,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigue vers l'écran TabBarView et active l'onglet "Rejeter"
                    Navigator.pop(context); // Retourne à l'écran précédent
                    DefaultTabController.of(context)?.animateTo(1); // Onglet "Rejeter"
                  },
                  child: const Text('Rejeter', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigue vers l'écran TabBarView et active l'onglet "Valider"
                    Navigator.pop(context); // Retourne à l'écran précédent
                    DefaultTabController.of(context)?.animateTo(2); // Onglet "Valider"
                  },
                  child: const Text(
                    'Valider',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildInformationText({
    required String title,
    required String content,
    required double screenWidth,
    required bool isPortrait,
    bool isLink = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isPortrait ? screenWidth * 0.3 : screenWidth * 0.2,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF072858), // Bleu foncé
            ),
          ),
        ),
        Expanded(
          child: isLink
              ? InkWell(
                  onTap: () {
                    // Logique pour ouvrir le lien
                  },
                  child: Text(
                    content,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                )
              : Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
        ),
      ],
    );
  }
}
