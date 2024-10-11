import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  final TextEditingController _companyNameController = TextEditingController();
  String? _selectedFileName;

  // Fonction pour ouvrir le sélecteur de fichiers
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;  // Récupère le nom du fichier sélectionné
      });
    }
  }

  // Fonction pour afficher le formulaire dans un pop-up
  Future<void> _showFormDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter des informations'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _companyNameController,
                decoration: const InputDecoration(
                  labelText: 'Nom de l\'entreprise',
                  hintText: 'Exemple: ArtCre Tech',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.attach_file),
                label: const Text('Sélectionner un fichier'),
              ),
              if (_selectedFileName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Fichier sélectionné: $_selectedFileName',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Ferme la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();  // Ferme la boîte de dialogue après soumission
              },
              child: const Text('Envoyer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0XFFFCBC1C),
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
            children: [
              const SizedBox(height: 10,),
          RichText(
              text: const TextSpan(
                children: <TextSpan>[
                   TextSpan(
                    text: '🎯 Titre : ',
                    style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                        color: Color(0xff072858)),
                  ),
                  TextSpan(
                    text: 'Recherche d\'Influenceur pour Collaboration dans le Secteur de la Mode',
                    style: TextStyle(fontSize: 18, color: Colors.black,),
                  ),
                ],
              ),),
              const SizedBox(height: 10,),
              Image.asset('assets/images/annonce.jpg', width: 300,),
              const SizedBox(height: 10,),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                     TextSpan(
                      text: '📄 Description : ',
                      style: TextStyle(fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)),
                    ),
                    TextSpan(
                      text: 'Nous sommes une marque de vêtements tendance et innovante, à la recherche d’un influenceur passionné par la mode pour collaborer avec nous et promouvoir nos nouvelles collections. Si tu es créatif, authentique et tu as une audience engagée sur Instagram, TikTok ou YouTube, cette opportunité est faite pour toi !',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ), textAlign: TextAlign.justify,),
        const SizedBox(height: 10),
        const Text(
                'Ce que nous recherchons :',
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff072858)),
              ),
              const SizedBox(height: 5),
              const Text(
                '- Un(e) influenceur(se) avec un minimum de 10k abonnés.\n'
                    '- Une passion pour la mode, avec un contenu déjà orienté vers les tendances vestimentaires.\n'
                    '- Capacité à produire des vidéos, photos, et stories créatives.\n'
                    '- Engagement avec une communauté active.',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                'Ce que nous offrons :',
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff072858)),
              ),
              const SizedBox(height: 5),
              const Text(
                '- Des vêtements de notre nouvelle collection offerts.\n'
                    '- Rémunération selon l\'audience et le type de contenu produit.\n'
                    '- Visibilité à travers notre réseau et nos campagnes publicitaires.',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
        RichText(
          text: const TextSpan(
            children: <TextSpan>[
               TextSpan(
                text: '👆 Comment postuler :',
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff072858)),
              ),
              TextSpan(
                text: 'Cliquez juste sur le boutton soumettre',
                style: TextStyle(fontSize: 18, color: Colors.black,)
              ),
            ],
          ), textAlign: TextAlign.justify,),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  _showFormDialog(context);  // Affiche le formulaire pop-up au clic
                },
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bordures arrondies
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(5),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 10))
                ),
                child: const Text(
                  'Soumettre',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
        ]
      )
    ));
  }
}
