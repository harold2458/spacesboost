import 'package:flutter/material.dart';

class AnnonceEntreprise extends StatefulWidget {
  const AnnonceEntreprise({super.key});

  @override
  State<AnnonceEntreprise> createState() => _AnnonceEntrepriseState();
}

class _AnnonceEntrepriseState extends State<AnnonceEntreprise> {
  bool isCheckedwhatsapp = false; // Variable pour stocker l'état de la case à cocher
  bool isCheckedtiktok = false;
  bool isCheckedinstagram = false;
  bool isCheckedfacebook = false;
  bool isCheckedtwitter = false;
  bool isCheckedtelegram = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              const Text(
                'Choisissez là où vos publicités apparaîtront. Plus de plateformes vous aident à atteindre vos résultats.',
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 15, // Taille de la police
                  color: Colors.black, // Couleur du texte
                ),
              ),
              const SizedBox(height: 20), // Espacement entre le texte et la ligne
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte et les icônes en haut
                children: [
                  // Case à cocher pour sélectionner l'option
                  Checkbox(
                    value: isCheckedwhatsapp,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedwhatsapp = value ?? false;
                      });
                    },
                  ),

                  // Image de WhatsApp
                  Image.asset(
                    'assets/icons/whatsapp2.png', // Chemin de l'image locale
                    width: 50.0, // Largeur de l'image
                    height: 50.0, // Hauteur de l'image
                  ),
                  const SizedBox(width: 20), // Espacement entre l'image et le texte

                  // Colonne pour le texte et la description
                  const  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Texte à gauche
                      children: [
                         Text(
                          'Statut WhatsApp', // Texte principal
                          style: TextStyle(
                            fontSize: 16, // Taille du texte
                            fontWeight: FontWeight.bold, // Texte en gras
                          ),
                        ),
                        const SizedBox(height: 4), // Espacement entre le titre et la description
                        const Text(
                          'Votre statut apparaîtra sur votre WhatsApp.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Couleur de la description
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espacement entre la description et l'icône d'information

                  // Icône d'information
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline, // Icône d'information
                      color: Colors.blue, // Couleur de l'icône
                      size: 30.0, // Taille de l'icône
                    ),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Détails sur le statut WhatsApp.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte et les icônes en haut
                children: [
                  // Case à cocher pour sélectionner l'option
                  Checkbox(
                    value: isCheckedtiktok = false,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedtiktok = value ?? false;
                      });
                    },
                  ),

                  // Image de WhatsApp
                  Image.asset(
                    'assets/icons/tiktok2.png', // Chemin de l'image locale
                    width: 50.0, // Largeur de l'image
                    height: 50.0, // Hauteur de l'image
                  ),
                  const SizedBox(width: 20), // Espacement entre l'image et le texte

                  // Colonne pour le texte et la description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Texte à gauche
                      children: [
                        const Text(
                          'TikTok', // Texte principal
                          style: TextStyle(
                            fontSize: 16, // Taille du texte
                            fontWeight: FontWeight.bold, // Texte en gras
                          ),
                        ),
                        const SizedBox(height: 4), // Espacement entre le titre et la description
                        const Text(
                          'Votre statut apparaîtra sur votre TikTok.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Couleur de la description
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espacement entre la description et l'icône d'information

                  // Icône d'information
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline, // Icône d'information
                      color: Colors.blue, // Couleur de l'icône
                      size: 30.0, // Taille de l'icône
                    ),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Détails sur TikTok.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte et les icônes en haut
                children: [
                  // Case à cocher pour sélectionner l'option
                  Checkbox(
                    value: isCheckedinstagram,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedinstagram = value ?? false;
                      });
                    },
                  ),

                  // Image de WhatsApp
                  Image.asset(
                    'assets/icons/instagram.jpeg', // Chemin de l'image locale
                    width: 50.0, // Largeur de l'image
                    height: 50.0, // Hauteur de l'image
                  ),
                  const SizedBox(width: 20), // Espacement entre l'image et le texte

                  // Colonne pour le texte et la description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Texte à gauche
                      children: [
                        const Text(
                          'Instagram', // Texte principal
                          style: TextStyle(
                            fontSize: 16, // Taille du texte
                            fontWeight: FontWeight.bold, // Texte en gras
                          ),
                        ),
                        const SizedBox(height: 4), // Espacement entre le titre et la description
                        const Text(
                          'Votre statut apparaîtra sur votre Instagram.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Couleur de la description
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espacement entre la description et l'icône d'information

                  // Icône d'information
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline, // Icône d'information
                      color: Colors.blue, // Couleur de l'icône
                      size: 30.0, // Taille de l'icône
                    ),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Détails sur Instagram.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte et les icônes en haut
                children: [
                  // Case à cocher pour sélectionner l'option
                  Checkbox(
                    value: isCheckedfacebook,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedfacebook = value ?? false;
                      });
                    },
                  ),

                  // Image de WhatsApp
                  Image.asset(
                    'assets/icons/facebook.png', // Chemin de l'image locale
                    width: 50.0, // Largeur de l'image
                    height: 50.0, // Hauteur de l'image
                  ),
                  const SizedBox(width: 20), // Espacement entre l'image et le texte

                  // Colonne pour le texte et la description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Texte à gauche
                      children: [
                        const Text(
                          'Facebook', // Texte principal
                          style: TextStyle(
                            fontSize: 16, // Taille du texte
                            fontWeight: FontWeight.bold, // Texte en gras
                          ),
                        ),
                        const SizedBox(height: 4), // Espacement entre le titre et la description
                        const Text(
                          'Votre statut apparaîtra sur votre Facebook.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Couleur de la description
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espacement entre la description et l'icône d'information

                  // Icône d'information
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline, // Icône d'information
                      color: Colors.blue, // Couleur de l'icône
                      size: 30.0, // Taille de l'icône
                    ),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Détails sur Facebook.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(width: 30),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte et les icônes en haut
                children: [
                  // Case à cocher pour sélectionner l'option
                  Checkbox(
                    value: isCheckedtwitter,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedtwitter = value ?? false;
                      });
                    },
                  ),

                  // Image de WhatsApp
                  Image.asset(
                    'assets/icons/twitter.png', // Chemin de l'image locale
                    width: 50.0, // Largeur de l'image
                    height: 50.0, // Hauteur de l'image
                  ),
                  const SizedBox(width: 20), // Espacement entre l'image et le texte

                  // Colonne pour le texte et la description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Texte à gauche
                      children: [
                        const Text(
                          'Twitter', // Texte principal
                          style: TextStyle(
                            fontSize: 16, // Taille du texte
                            fontWeight: FontWeight.bold, // Texte en gras
                          ),
                        ),
                        const SizedBox(height: 4), // Espacement entre le titre et la description
                        const Text(
                          'Votre statut apparaîtra sur votre Twitter.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Couleur de la description
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espacement entre la description et l'icône d'information

                  // Icône d'information
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline, // Icône d'information
                      color: Colors.blue, // Couleur de l'icône
                      size: 30.0, // Taille de l'icône
                    ),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Détails sur Twitter.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(width: 30),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte et les icônes en haut
                children: [
                  // Case à cocher pour sélectionner l'option
                  Checkbox(
                    value: isCheckedtelegram,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedtelegram = value ?? false;
                      });
                    },
                  ),

                  // Image de WhatsApp
                  Image.asset(
                    'assets/icons/telegram.png', // Chemin de l'image locale
                    width: 50.0, // Largeur de l'image
                    height: 50.0, // Hauteur de l'image
                  ),
                  const SizedBox(width: 20), // Espacement entre l'image et le texte

                  // Colonne pour le texte et la description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Texte à gauche
                      children: [
                        const Text(
                          'Telegram', // Texte principal
                          style: TextStyle(
                            fontSize: 16, // Taille du texte
                            fontWeight: FontWeight.bold, // Texte en gras
                          ),
                        ),
                        const SizedBox(height: 4), // Espacement entre le titre et la description
                        const Text(
                          'Votre statut apparaîtra sur votre Telegram.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Couleur de la description
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espacement entre la description et l'icône d'information

                  // Icône d'information
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline, // Icône d'information
                      color: Colors.blue, // Couleur de l'icône
                      size: 30.0, // Taille de l'icône
                    ),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Détails sur Telegram.'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
