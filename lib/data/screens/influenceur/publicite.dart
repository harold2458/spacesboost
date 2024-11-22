import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_mobile/data/screens/influenceur/audience.dart'; // Pour utiliser File

class Publicite extends StatefulWidget {
  const Publicite({super.key});

  @override
  State<Publicite> createState() => _PubliciteState();
}

class _PubliciteState extends State<Publicite> {
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
                  borderSide: const BorderSide(color: Colors.grey), // Couleur par défaut de la bordure
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue), // Couleur de la bordure lorsqu'on sélectionne le champ
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
                  borderSide: const BorderSide(color: Colors.grey), // Couleur par défaut de la bordure
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue), // Couleur de la bordure lorsqu'on sélectionne le champ
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
                alignment: Alignment.center, // Centrer le texte
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.attach_file, color: Colors.grey, size: 30), // Icône de trombone
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

            // Boutons Annuler et Continuer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Bouton Annuler
                Container(
                  width: 140, // Largeur du bouton
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.yellow, Colors.orange],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10), // Bord arrondi
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate back to the previous page
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
                  width: 140, // Largeur du bouton
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.yellow, Colors.orange],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10), // Bord arrondi
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the next page
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
          ],
        ),
      ),
    );
  }
}
