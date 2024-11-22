import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/creation_contenue.dart';
import 'package:projet_mobile/data/screens/Entreprise/profileScreen.dart';

class CreationEntreprise extends StatefulWidget {
   final bool isInfluencerChecked;

    const CreationEntreprise({
      
    Key? key,
    this.isInfluencerChecked = false,
  }) : super(key: key);

  @override
  State<CreationEntreprise> createState() => _CreationEntrepriseState();
}

class _CreationEntrepriseState extends State<CreationEntreprise> {
  // Initialisation du contrôleur pour le champ de recherche
  bool isCheckedmarko = false;
  bool isCheckedmarkos = false;
  bool isCheckedmarkoz = false;
  bool isCheckedmark = false;
  final TextEditingController searchController = TextEditingController();

  // Valeur sélectionnée dans le DropdownButton
  String selectedCategory = 'Nom';

  @override
  void dispose() {
    // Libérer le contrôleur lorsque le widget est détruit pour éviter les fuites de mémoire
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 30),
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
            ],
          ),
          const SizedBox(height: 20),
          // Profile card with checkbox
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/profil.jpg'), // Remplacez par le chemin de votre image
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ToTo Marc',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072858),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'santé / calavi',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/whatsapp2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '5k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tiktok2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '12k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isCheckedmarko,
                          onChanged: (value) {
                            setState(() {
                              isCheckedmarko = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Cocher pour sélectionner',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/profil.jpg'), // Remplacez par le chemin de votre image
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ToTo Marc',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072858),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'santé / calavi',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/whatsapp2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '5k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tiktok2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '12k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isCheckedmarko,
                          onChanged: (value) {
                            setState(() {
                              isCheckedmarko = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Cocher pour sélectionner',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/profil.jpg'), // Remplacez par le chemin de votre image
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ToTo Marc',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072858),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'santé / calavi',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/whatsapp2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '5k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tiktok2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '12k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isCheckedmarko,
                          onChanged: (value) {
                            setState(() {
                              isCheckedmarko = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Cocher pour sélectionner',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/images/profil.jpg'), // Remplacez par le chemin de votre image
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ToTo Marc',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'santé / calavi',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/whatsapp2.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '5k Followers',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/tiktok2.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '12k Followers',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isCheckedmarko,
                        onChanged: (value) {
                          setState(() {
                            isCheckedmarko = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'Cocher pour sélectionner',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/profil.jpg'), // Remplacez par le chemin de votre image
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ToTo Marc',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072858),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'santé / calavi',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/whatsapp2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '5k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tiktok2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '12k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isCheckedmarko,
                          onChanged: (value) {
                            setState(() {
                              isCheckedmarko = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Cocher pour sélectionner',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/profil.jpg'), // Remplacez par le chemin de votre image
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ToTo Marc',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072858),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'santé / calavi',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/whatsapp2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '5k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tiktok2.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '12k Followers',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isCheckedmarko,
                          onChanged: (value) {
                            setState(() {
                              isCheckedmarko = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Cocher pour sélectionner',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]))),
        const SizedBox(height: 30),
        SizedBox(
          width:
              double.infinity, // Le bouton occupe toute la largeur disponible
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
                MaterialPageRoute(
                    builder: (context) => const CreationContenue()),
              );
            },
            child: const Text(
              'Valider',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    )
    );
  }
}
Widget buildInfluencerRow(
  bool isChecked,
  String name,
  String domain,
  String imagePath,
  Function(bool) onChecked,
  VoidCallback navigateToProfile, // Ajouté comme paramètre
) {
  return InkWell(
    onTap: navigateToProfile, // Utilisation de la fonction navigateToProfile ici
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            onChecked(value ?? false);
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
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff072858),
                ),
              ),
              Text(
                domain,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}