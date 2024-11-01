import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/profileScreen.dart';

class PromotionEntreprise extends StatefulWidget {
  final bool isInfluencerChecked; // Déclare la variable pour stocker la valeur initiale de la case à cocher

  // Constructeur avec uniquement la déclaration nommée isInfluencerChecked
  const PromotionEntreprise({
    Key? key,
    this.isInfluencerChecked = false,
  }) : super(key: key);

  @override
  State<PromotionEntreprise> createState() => _PromotionEntrepriseState();
}

class _PromotionEntrepriseState extends State<PromotionEntreprise> {
  // États des cases à cocher pour chaque influenceur
  late bool isCheckedmarko;
  bool isCheckedmarkos = false;
  bool isCheckedmarkoz = false;
  bool isCheckedmark = false;

  // Contrôleur pour la barre de recherche et sélection de catégorie
  final TextEditingController searchController = TextEditingController();
  String selectedCategory = 'Nom';

  // Méthode pour naviguer vers le profil et gérer le retour avec la case cochée
  Future<void> navigateToProfile(bool isChecked, Function(bool) onChecked) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
    if (result == true) {
      onChecked(true);
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialiser la case à cocher pour "ToTo Marc" avec la valeur de isInfluencerChecked
    isCheckedmarko = widget.isInfluencerChecked;
  }

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
                'Plus proche de vos clients! Diffusez vos publicités à une audience très large et spécifique avec nos influenceurs qui collent avec votre marque.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choix de l\'influenceur',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Barre de recherche et champ de sélection
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Rechercher...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: <String>['Nom', 'Type d\'influenceur', 'Domaine', 'Pays', 'Ville']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Lignes d'influenceurs
              buildInfluencerRow(
                isCheckedmarko,
                'ToTo Marc',
                'santé / calavi',
                'assets/icons/profile2.png',
                (value) => setState(() => isCheckedmarko = value),
              ),
              const SizedBox(height: 20),
              buildInfluencerRow(
                isCheckedmarkos,
                'Mange Peu',
                'cuisine / Togoudo',
                'assets/icons/profile2.png',
                (value) => setState(() => isCheckedmarkos = value),
              ),
              const SizedBox(height: 20),
              buildInfluencerRow(
                isCheckedmarkoz,
                'AGBO Richard',
                'comédie / Arconville',
                'assets/icons/profile2.png',
                (value) => setState(() => isCheckedmarkoz = value),
              ),
              const SizedBox(height: 20),
              buildInfluencerRow(
                isCheckedmark,
                'AKRI Sebastien',
                'commerce / Kpota',
                'assets/icons/profile2.png',
                (value) => setState(() => isCheckedmark = value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour afficher une ligne d'influenceur avec la logique de navigation
  Widget buildInfluencerRow(
    bool isChecked,
    String name,
    String domain,
    String imagePath,
    Function(bool) onChecked,
  ) {
    return InkWell(
      onTap: () => navigateToProfile(isChecked, onChecked),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                onChecked(value ?? false);
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
        ],
      ),
    );
  }
}
