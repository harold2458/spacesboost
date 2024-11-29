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
                    // Affiche une boîte de dialogue d'alerte pour le rejet
                    showRejectionDialog(context);
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
                    // Affiche une boîte de dialogue d'alerte pour la validation
                    showValidationDialog(context);
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

  void showRejectionDialog(BuildContext context) {
    TextEditingController commentaireController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Raison du rejet'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Veuillez fournir une raison pour le rejet :',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: commentaireController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Écrire un commentaire...',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Logique pour commencer une note vocale
                  // Vous pouvez ajouter l'enregistrement vocal ici
                },
                icon: const Icon(Icons.mic, color: Colors.white),
                label: const Text(
                  'Enregistrer une note vocale',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Annuler', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                // Traitez le commentaire ici
                print("Commentaire : ${commentaireController.text}");
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Valider', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  void showValidationDialog(BuildContext context) {
    TextEditingController commentaireController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Raison de la validation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Veuillez fournir une raison pour la validation :',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: commentaireController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Écrire un commentaire...',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Logique pour commencer une note vocale
                  // Vous pouvez ajouter l'enregistrement vocal ici
                },
                icon: const Icon(Icons.mic, color: Colors.white),
                label: const Text(
                  'Enregistrer une note vocale',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Annuler', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                // Traitez le commentaire ici
                print("Commentaire : ${commentaireController.text}");
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Valider', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
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
