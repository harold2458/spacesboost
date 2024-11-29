import 'package:flutter/material.dart';

class PreuveValider extends StatefulWidget {
  const PreuveValider({super.key});

  @override
  State<PreuveValider> createState() => _PreuveValiderState();
}

class _PreuveValiderState extends State<PreuveValider> {
  // Liste des annonces à afficher
  final List<Map<String, dynamic>> annonces = [
    {
      'titre': 'Ordinateur',
      'description': 'Un ordinateur performant pour vos besoins quotidiens.',
      'statut': 'Valider',
    },
    {
      'titre': 'Tablette',
      'description': 'Une tablette légère et performante pour le travail.',
      'statut': 'Valider',
    },
    {
      'titre': 'Iphone 18',
      'description': 'Un iPhone performant pour le travail.',
      'statut': 'Valider',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: annonces.length,
        // Utilisation d'une clé pour optimiser la construction des widgets
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: AnnonceCard(
              // Passage des données aux widgets enfants
              titre: annonces[index]['titre'],
              description: annonces[index]['description'],
              statut: annonces[index]['statut'],
              onTap: () {
                // Ajoutez votre logique ici si nécessaire
                print("Annonce sélectionnée : ${annonces[index]['titre']}");
              },
            ),
          );
        },
      ),
    );
  }
}

// Widget représentant une carte d'annonce
class AnnonceCard extends StatelessWidget {
  final String titre;
  final String description;
  final String statut;
  final VoidCallback onTap;

  const AnnonceCard({
    Key? key,
    required this.titre,
    required this.description,
    required this.statut,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
         color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre et statut de l'annonce
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
              // Description de l'annonce
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
