import 'package:file_picker/file_picker.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/proof.jpg', width: 270,),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
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
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
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
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
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
            const SizedBox(height: 20),
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
                    elevation: const WidgetStatePropertyAll(5),
                  ),
                  onPressed: _pickFile,
                  icon: const Icon(Icons.attach_file, color: Color(0xff072858))
                ),
                const SizedBox(width: 15),
                _selectedFile != null ? Text("Fichier: $_selectedFile") : const Text("Aucun fichier sélectionné", style: TextStyle(fontSize: 14),),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bordures arrondies
                  ),
                ),
                elevation: const WidgetStatePropertyAll(5),
              ),
              child: const Text("Envoyer", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ],
        ),
      )
    );
  }
}
