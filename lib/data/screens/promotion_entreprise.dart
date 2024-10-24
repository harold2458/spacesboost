import 'package:flutter/material.dart';

class PromotionEntreprise extends StatefulWidget {
  const PromotionEntreprise({super.key});

  @override
  State<PromotionEntreprise> createState() => _PromotionEntrepriseState();
}

class _PromotionEntrepriseState extends State<PromotionEntreprise> {
  bool isCheckedmarko = false;
  bool isCheckedmarkos = false;
  bool isCheckedmarkoz = false;
  bool isCheckedmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Plus proche de vos clients! Diffuser vos publicités à une audience très large et spécifique avec nos influenceurs qui collent avec votre marque.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              buildInfluencerRow(isCheckedmarko, 'Nom prenom', 'Domaine / Lieu', 'assets/icons/profile2.png'),
              const SizedBox(height: 20),
              buildInfluencerRow(isCheckedmarkos, 'Nom prenom', 'Domaine / Lieu', 'assets/icons/profile2.png'),
              const SizedBox(height: 20),
              buildInfluencerRow(isCheckedmarkoz, 'Nom prenom', 'Domaine / Lieu', 'assets/icons/profile2.png'),
              const SizedBox(height: 20),
              buildInfluencerRow(isCheckedmark, 'Nom prenom', 'Domaine / Lieu', 'assets/icons/profile2.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfluencerRow(bool isChecked, String name, String domain, String imagePath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                domain,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              // Exemple d'affichage de followers
              Row(
                children: [
                  Image.asset(
                    'assets/icons/whatsapp2.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    '5k Followers',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/tiktok2.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    '12k Followers',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.amberAccent], // Utilisation d'une liste de couleurs pour le dégradé
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20), // Coins arrondis
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Arrondi des bords
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Ajustement de la taille du bouton
            ),
            onPressed: () {
              // Action à effectuer lors de l'appui sur le bouton
            },
            child: const Text(
              'Ajouter',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
