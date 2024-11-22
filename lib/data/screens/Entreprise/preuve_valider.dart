import 'package:flutter/material.dart';

class PreuveValider extends StatefulWidget {
  const PreuveValider({super.key});

  @override
  State<PreuveValider> createState() => _PreuveValiderState();
}

class _PreuveValiderState extends State<PreuveValider> {

  final List<Map<String, dynamic>> annonces = [
    {
      'titre': 'Ordinateur',
      'description': 'Un ordinateur performant pour vos besoins quotidiens.',
      'lien': 'https://example.com/ordinateur',
      'fichier': 'document_ordinateur.pdf',
      'statut': 'Valider',
    },
    {
      'titre': 'Tablette',
      'description': 'Une tablette légère et performante pour le travail.',
      'lien': 'https://example.com/tablette',
      'fichier': 'document_tablette.pdf',
      'statut': 'Valider',
    },
    {
      'titre': 'Iphone 18',
      'description': 'Un iPhone performant pour le travail.',
      'lien': 'https://example.com/iphone',
      'fichier': 'document_iphone18.pdf',
      'statut': 'Valider',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: annonces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: AnnonceCard(
              titre: annonces[index]['titre'],
              description: annonces[index]['description'],
              lien: annonces[index]['lien'],
              fichier: annonces[index]['fichier'],
              statut: annonces[index]['statut'],
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}

class AnnonceCard extends StatelessWidget {
  final String titre;
  final String description;
  final String lien;
  final String fichier;
  final String statut;
  final VoidCallback onTap;

  const AnnonceCard({
    Key? key,
    required this.titre,
    required this.description,
    required this.lien,
    required this.fichier,
    required this.statut,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      titre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff072858),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      statut,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Ouvrir le lien
                },
                child: Text(
                  lien,
                  style: const TextStyle(
                    color: Color(0xff072858),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.file_present, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        fichier,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
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
