import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class PreuveEntreprise extends StatefulWidget {
  const PreuveEntreprise({super.key});

  @override
  State<PreuveEntreprise> createState() => _PreuveEntrepriseState();
}

class _PreuveEntrepriseState extends State<PreuveEntreprise> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  String? _selectedFile;
  bool _imagesLoaded = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = result.files.single.name;
      });
    }
  }

  void _submitForm() {
    // Implement your form submission logic here
    // For example, you might send data to a server or save it locally
    if (kDebugMode) {
      print('Title: ${_titleController.text}');
      print('Content: ${_contentController.text}');
      print('Link: ${_linkController.text}');
      print('Selected File: $_selectedFile');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImages();
  }

  Future<void> _preloadImages() async {
    try {
      await precacheImage(const AssetImage('assets/images/proof.jpg'), context);
      setState(() {
        _imagesLoaded = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error preloading image: $e');
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
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * (isPortrait ? 0.03 : 0.1),
        ),
        child: Column(
          children: [
            !_imagesLoaded
                ? const CircularProgressIndicator(color: Color(0xFFFCBC1C))
                : Image.asset(
                    'assets/images/proof.jpg',
                    width: screenWidth * (isPortrait ? 0.6 : 0.2),
                  ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
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
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: TextField(
                controller: _contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Contenu",
                  hintText: '*Décrivez votre preuve',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
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
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Color(0xff072858)),
                  onPressed: _pickFile,
                ),
                const SizedBox(width: 10),
                Text(
                  _selectedFile != null ? _selectedFile! : 'Aucun fichier sélectionné',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFFFCBC1C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Soumettre',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
