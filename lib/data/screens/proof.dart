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
    String title = _titleController.text;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: "Titre",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _contentController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: "Contenu",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _linkController,
            decoration: const InputDecoration(
              labelText: "Lien",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text("Sélectionner un fichier"),
              ),
              const SizedBox(width: 16),
              _selectedFile != null ? Text("Fichier: $_selectedFile") : const Text("Aucun fichier sélectionné"),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text("Envoyer"),
          ),
        ],
      ),
    );
  }
}
