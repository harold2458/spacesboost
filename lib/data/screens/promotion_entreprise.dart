import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/profileScreen.dart';
import 'package:projet_mobile/data/screens/redaction_mission.dart';

class PromotionEntreprise extends StatefulWidget {
  final bool isInfluencerChecked;

  const PromotionEntreprise({
    Key? key,
    this.isInfluencerChecked = false,
  }) : super(key: key);

  @override
  State<PromotionEntreprise> createState() => _PromotionEntrepriseState();
}

class _PromotionEntrepriseState extends State<PromotionEntreprise> {
  late bool isCheckedmarko;
  bool isCheckedmarkos = false;
  bool isCheckedmarkoz = false;
  bool isCheckedmark = false;

  final TextEditingController searchController = TextEditingController();
  String selectedCategory = 'Nom';

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

              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFFCBC1C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RedactionMission()),
                    );
                  },
                  child: const Text('Valider',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
