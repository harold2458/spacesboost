import 'package:flutter/material.dart';
import 'information_entreprise.dart';

class BudgetEntreprise extends StatefulWidget {
  const BudgetEntreprise({super.key});

  @override
  State<BudgetEntreprise> createState() => _BudgetState();
}

class _BudgetState extends State<BudgetEntreprise> {
  int budget = 1000; // Prix initial de 1000 F
  double tvaRate = 0.18; // TVA de 18%
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Fonction pour calculer la somme totale
  int get totalAmount => budget;
  double get tva => budget * tvaRate; // Calcul de la TVA
  double get totalWithTva => totalAmount + tva; // Somme totale avec TVA

  List<int> priceOptions = [1000, 2000, 3000, 4000, 5000];

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Couverture journalière estimée',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                   color: const Color(0xff072858),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Nous pouvons toucher plus de 4 millions de personnes par jour, avec 1000 personnes/jour.',
                ),
                const SizedBox(height: 24),

                // Dropdown pour sélectionner le prix
                const Text(
                  'information :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                   color: const Color(0xff072858),
                  ),
                ),
                const SizedBox(height: 12),
                 Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Pour atteindre 1000 Personnes  minimum en journee vous devez payer un montant de 1000 f.',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
               
                const SizedBox(height: 24),

                const Center(
                  child: Text(
                    'Facturation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                   color: const Color(0xff072858),
                     ),
                  ),
                ),
                const SizedBox(height: 24),

                // Affichage des calculs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Somme totale',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$totalAmount F',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TVA (18%)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${tva.toStringAsFixed(0)} F',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${totalWithTva.toStringAsFixed(0)} F',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
      // Container en bas avec les boutons, positionné en bas de l'écran
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 24),
        decoration: const BoxDecoration(
          color: Color(0xff072858),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Annuler', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffcbc1c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                        ),
            
            ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Information()),
                              );
                          },
                          child: const Text(
                            'Suivant',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffcbc1c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // élargit horizontalement
                          ),
                        ),
          ],
        ),
      ),
    );
  }
}
