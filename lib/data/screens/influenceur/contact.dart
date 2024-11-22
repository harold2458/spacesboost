import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
      await precacheImage(const AssetImage('assets/images/contact.png'), context);
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
          title: const Text('Contact', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Center(
          child: Column(
            children: [
              !_imagesLoaded ?
              const CircularProgressIndicator(color: Color(0XFFFCBC1C),) :
              Image.asset('assets/images/contact.png', width: screenWidth * (isPortrait ? 0.6 : 0.2),),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              TextField(
                controller: _fullNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nom et prenom",
                  hintText: '*John Doe',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.person,
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
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: '*example@gmil.com',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.email,
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
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              TextField(
                controller: _contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Contenu",
                  hintText: '*Decrivez votre contenu',
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
              SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1),),
              SizedBox(
                width: screenWidth * (isPortrait ? 0.9 : 0.8), // Largeur du bouton ajustée
                height: screenHeight * (isPortrait ? 0.06 : 0.2),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
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
      )
    );
  }
}
