import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/payment.dart';

class Validator2 extends StatefulWidget {
  const Validator2({super.key});

  @override
  State<Validator2> createState() => _Validator2State();
}

class _Validator2State extends State<Validator2> {
  @override
  Widget build(BuildContext context) {

     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isPortrait = screenHeight > screenWidth;
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Validation',
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
                title: 'Titre: ',
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
                title: 'Type de contenu : ',
                content: 'Image ',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Domaine : ',
                content: 'Sante',
                screenWidth: screenWidth,
                isPortrait: isPortrait,
              ),
              buildInformationText(
                title: 'Theme : ',
                content: 'Innovation',
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
                title: 'Budget  : ',
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
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // élargit horizontalement
                          ),
                        ),
          ],
        ),
      ),
    );
  }

  // Fonction pour créer un texte riche pour les informations
  Widget buildInformationText({
    required String title,
    required String content,
    required double screenWidth,
    required bool isPortrait,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontFamily: 'Poppins'),
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(
                fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                fontWeight: FontWeight.bold,
                color: const Color(0xff072858),
              ),
            ),
            TextSpan(
              text: content,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}