import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Proof extends StatefulWidget {
  const Proof({super.key});

  @override
  State<Proof> createState() => _ProofState();
}

class _ProofState extends State<Proof> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  String? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = result.files.single.name;
      });
    } else {
      // L'utilisateur a annulé la sélection
    }
  }

  void _submitForm() {
    /*String title = _titleController.text;
    String content = _contentController.text;
    String link = _linkController.text;
    String? file = _selectedFile;

    if (title.isNotEmpty && content.isNotEmpty && link.isNotEmpty && file != null) {
      // Logique pour soumettre le formulaire
      print("Titre: $title");
      print("Contenu: $content");
      print("Lien: $link");
      print("Fichier sélectionné: $file");
    } else {
      // Gérer les erreurs
      print("Veuillez remplir tous les champs.");
    }*/
  }

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
      await precacheImage(const AssetImage('assets/images/proof.jpg'), context);
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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Column(
          children: [
            !_imagesLoaded ?
            const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
            Image.asset('assets/images/proof.jpg', width: screenWidth * (isPortrait ? 0.6 : 0.2),),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Titre",
                  hintText: '*Entrez le titre de la preuve',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: TextField(
                controller: _contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Contenu",
                  hintText: '*Decrivez votre preuve',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: TextField(
                controller: _linkController,
                decoration: InputDecoration(
                  labelText: "Lien",
                  hintText: '*Entrez le lien vers la preuve',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.link,
                    color: Color(0xff072858),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordures arrondies
                        side: const BorderSide(color: Color(0xff072858))
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(3),
                  ),
                  onPressed: _pickFile,
                  icon: const Icon(Icons.attach_file, color: Color(0xff072858))
                ),
                const SizedBox(width: 15),
                _selectedFile != null ? Text("Fichier: $_selectedFile") : const Text("Aucun fichier sélectionné", style: TextStyle(fontSize: 14),),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8), // Largeur du bouton ajustée
              height: screenHeight * (isPortrait ? 0.06 : 0.2),
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bordures arrondies
                    ),
                  ),
                  elevation: const WidgetStatePropertyAll(3),
                ),
                child: Text("Envoyer", style: TextStyle(
                  fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            )
          ],
        ),
      )
    );
  }
}
