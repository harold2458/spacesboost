import 'package:flutter/material.dart';
import 'information_entreprise.dart'; // Assurez-vous d'importer la page Information

class BudgetEntreprise extends StatefulWidget {
  const BudgetEntreprise({super.key});

  @override
  State<BudgetEntreprise> createState() => _BudgetState();
}

class _BudgetState extends State<BudgetEntreprise> {
  int budget = 1000; // Prix initial de 1000 F
  double tvaRate = 0.18; // TVA de 18%

  // Fonction pour calculer la somme totale
  int get totalAmount => budget;
  double get tva => budget * tvaRate; // Calcul de la TVA
  double get totalWithTva => totalAmount + tva; // Somme totale avec TVA

  List<int> priceOptions = [1000, 2000, 3000, 4000, 5000]; // Options pour le Dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budget',
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
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              print("Menu icon clicked");
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // Ajouter du padding pour le Container
        decoration: BoxDecoration(
          color: Colors.grey[200], // Couleur de fond gris
          borderRadius: BorderRadius.circular(10), // Coins arrondis
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, // Couleur de l'ombre
              blurRadius: 5, // Flou de l'ombre
              offset: Offset(0, 2), // Décalage de l'ombre
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Couverture journalière estimée',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nous pouvons toucher plus de 4 millions de personnes par jour, avec 1000 personnes/jour.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Dropdown pour sélectionner le prix
            const Text(
              'Sélectionnez un prix :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<int>(
              value: budget,
              icon: const Icon(Icons.arrow_drop_down), // Icône personnalisée
              iconSize: 24, // Taille de l'icône
              underline: Container(), // Supprimer la ligne sous le Dropdown
              items: priceOptions.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value F'),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  budget = newValue ?? 1000;
                });
              },
            ),
            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Facturation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Affichage des calculs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Somme totale',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '$totalAmount F',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TVA (18%)',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${tva.toStringAsFixed(0)} F',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${totalWithTva.toStringAsFixed(0)} F',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 90),

            // Bouton soumettre rectangulaire avec dégradé jaune
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width, // Largeur 100% de l'écran
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.yellow,  // Couleur de départ
                      Colors.amber,   // Couleur de fin
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20), // Bords arrondis
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Logique pour soumettre le budget
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Information(),
                      ),
                    );
                    print('Budget soumis : $budget F');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Rendre le fond transparent
                    padding: const EdgeInsets.symmetric(vertical: 20), // Augmenter la taille du bouton
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Bords arrondis
                    ),
                  ),
                  child: const Text(
                    'Suivant',
                    style: TextStyle(fontSize: 20, color: Colors.white), // Augmenter la taille du texte
                  ),
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
