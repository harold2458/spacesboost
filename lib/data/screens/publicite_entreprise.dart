import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:projet_mobile/data/screens/audience.dart'; // Vérifiez si ce fichier existe

class PubliciteEntreprise extends StatefulWidget {
  const PubliciteEntreprise({super.key});

  @override
  State<PubliciteEntreprise> createState() => _PubliciteState();
}

class _PubliciteState extends State<PubliciteEntreprise> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _mediaFile; // Utilisation de XFile pour stocker l'image/vidéo sélectionnée
  final ImagePicker _picker = ImagePicker();

  // Liste des canaux avec leurs icônes respectives
  final List<Map<String, String>> channels = [
    {'name': 'Facebook', 'icon': 'assets/icons/facebook2.png'},
    {'name': 'WhatsApp', 'icon': 'assets/icons/whatsapp3.png'},
    {'name': 'Instagram', 'icon': 'assets/icons/instagram2.png'},
    {'name': 'LinkedIn', 'icon': 'assets/icons/youtube2.png'},
  ];

  String? selectedChannel;

  // Méthode pour choisir un fichier image ou vidéo depuis la galerie
  void _pickMedia() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      // Vérification si un fichier a été sélectionné
      if (pickedFile != null) {
        setState(() {
          _mediaFile = pickedFile;
        });
      } else {
        // L'utilisateur n'a sélectionné aucun fichier
        print('Aucun fichier sélectionné.');
      }
    } catch (e) {
      print("Erreur lors de la sélection du fichier : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Créer une publicité',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff072858),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/logos/icon.jpg',
            height: 300,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              print("Menu icon clicked");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vos canaux',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Sélection des canaux avec des icônes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: channels.map((channel) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedChannel = channel['name'];
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: selectedChannel == channel['name'] ? const Color(0xff072858) : Colors.grey[300],
                    child: channel.containsKey('icon') && channel['icon'] != null
                        ? Image.asset(
                            channel['icon']!,
                            width: 30,
                            height: 30,
                          )
                        : const Icon(Icons.error, color: Colors.red), // Icône d'erreur si aucune icône n'est trouvée
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // Champ titre
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Titre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Champ description
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Sélecteur de médias (image ou vidéo) avec une icône et un texte
            GestureDetector(
              onTap: _pickMedia,
              child: Container(
                width: double.infinity,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.attach_file, color: Colors.grey, size: 30),
                    const SizedBox(width: 10),
                    Text(
                      _mediaFile != null ? _mediaFile!.name : 'Aucun fichier sélectionné',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 70),

            // Conteneur avec les boutons Annuler et Continuer en bas
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff072858),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Bouton Annuler
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Annuler',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  // Bouton Continuer
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Audience()),
                        );
                      },
                      child: const Text(
                        'Continuer',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
