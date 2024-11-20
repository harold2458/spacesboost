import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/payment.dart';

class ValidationCommande extends StatefulWidget {
  const ValidationCommande({super.key});

  @override
  State<ValidationCommande> createState() => _ValidationCommandeState();
}

class _ValidationCommandeState extends State<ValidationCommande> {
  @override
  Widget build(BuildContext context) {
    // Obtenir les dimensions de l'écran dans la méthode build
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isPortrait = screenHeight > screenWidth;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Validation',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFF072858),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reusable function to create a rich text entry
              buildInformationText(
                title: 'Nom de l\'entreprise : ',
                content: 'ISMAT',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Description : ',
                content: '',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Image : ',
                content: '',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
                imagePath: 'assets/images/couverture.jpg',
              ),
              buildInformationText(
                title: 'Nom du produit : ',
                content: 'Spring',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Avantage du Produit  : ',
                content: '',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Nombre de publication : ',
                content: '20',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Duree du contrat  : ',
                content: '2 semaine',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'TVA  : ',
                content: '18%',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Budget : ',
                content: '5900',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: Color(0xff072858),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Annuler', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfffcbc1c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Payment()),
                );
              },
              child: const Text(
                'Suivant',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfffcbc1c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to create reusable rich text information blocks with optional image display
  Widget buildInformationText({
    required String title,
    required String content,
    required double screenWidth,
    required bool isPortrait,
    String? imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
              fontWeight: FontWeight.bold,
              color: const Color(0xff072858),
            ),
          ),
          const SizedBox(width: 8),
          if (imagePath != null && imagePath.isNotEmpty)
            Container(
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Expanded(
              child: Text(
                content,
                style: const TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
