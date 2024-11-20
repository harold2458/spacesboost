import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:projet_mobile/data/screens/audience.dart';

class PubliciteEntreprise extends StatefulWidget {
  const PubliciteEntreprise({super.key});

  @override
  State<PubliciteEntreprise> createState() => _PubliciteState();
}

class _PubliciteState extends State<PubliciteEntreprise> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _mediaFile;
  final ImagePicker _picker = ImagePicker();

  // Liste des canaux avec leurs icônes respectives
  final List<Map<String, String>> channels = [
    {'name': 'Facebook', 'icon': 'assets/icons/facebook2.png'},
    {'name': 'WhatsApp', 'icon': 'assets/icons/whatsapp3.png'},
    {'name': 'Instagram', 'icon': 'assets/icons/instagram2.png'},
    {'name': 'TikTok', 'icon': 'assets/icons/tiktok2.png'},
  ];

  // Liste pour garder une trace des icônes sélectionnées
  List<String> selectedChannels = [];

  Future<void> _pickMedia() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _mediaFile = pickedFile;
        });
      } else {
        print('Aucun fichier sélectionné.');
      }
    } catch (e) {
      print("Erreur lors de la sélection du fichier : $e");
    }
  }

  void _toggleChannelSelection(String channelName) {
    setState(() {
      if (selectedChannels.contains(channelName)) {
        selectedChannels.remove(channelName);
      } else {
        selectedChannels.add(channelName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Creer une publicite',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Choisissez là où vos publicités apparaîtront. Plus de plateformes vous aident à atteindre vos résultats.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Vos canaux',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),
            ),
            const SizedBox(height: 20),

            // Affichage des canaux avec leurs icônes en ligne
            Wrap(
              spacing: 20, // Espacement entre les icônes
              runSpacing: 20, // Espacement entre les lignes
              children: List.generate(channels.length, (index) {
                final channelName = channels[index]['name']!;
                final isSelected = selectedChannels.contains(channelName);

                return GestureDetector(
                  onTap: () => _toggleChannelSelection(channelName),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(color: Colors.blue, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          channels[index]['icon']!,
                          height: 40, // Ajustez la taille de l'icône
                          width: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(channels[index]['name']!),
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 40),

            TextFormField(
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
                  borderSide: const BorderSide(color: Color(0xff072858)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
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
                  borderSide: const BorderSide(color: Color(0xff072858)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickMedia,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.attach_file, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _mediaFile != null ? _mediaFile!.name : 'Aucun fichier sélectionné',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    if (_mediaFile != null)
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _mediaFile = null;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity, // Le bouton occupe toute la largeur disponible
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFFFCBC1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Audience()),
                  );
                },
                child: const Text(
                  'Suivant',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
