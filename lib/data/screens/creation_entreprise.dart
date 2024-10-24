import 'package:flutter/material.dart';

class CreationEntreprise extends StatefulWidget {
  const CreationEntreprise({super.key});

  @override
  State<CreationEntreprise> createState() => _CreationEntrepriseState();
}

class _CreationEntrepriseState extends State<CreationEntreprise> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Dropdown selection
  String selectedDomain = 'Santé'; // Valeur par défaut
  List<String> domains = ['Santé', 'Technologie', 'Education', 'Autre']; // Options de dropdown

  // Choix du contenu
  String contentChoice = 'Image'; // Valeur par défaut pour le choix du contenu

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
                'Contenus attrayants : Obtenez des contenus posts, images, stories et vidéos mettant en scène votre marque via nos influenceurs.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Conteneur principal pour les champs
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Champ pour le titre
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Titre',
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Champ pour la description
                    TextField(
                      controller: _descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Choix du contenu (Image ou Vidéo)
                    Row(
                      children: [
                        const Text('Type de contenu :'),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButton<String>(
                            value: contentChoice,
                            onChanged: (String? newValue) {
                              setState(() {
                                contentChoice = newValue!;
                              });
                            },
                            items: ['Image', 'Vidéo'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: const Color(0xfffcbc1c),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Dropdown pour le domaine
                    Row(
                      children: [
                        const Text('Domaine :'),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButton<String>(
                            value: selectedDomain,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDomain = newValue!;
                              });
                            },
                            items: domains.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: const Color(0xfffcbc1c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Bouton pour soumettre avec dégradé
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xfffcbc1c), Color(0xffffd700)], // Dégradé jaune
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lors de la soumission
                    print('Titre: ${_titleController.text}');
                    print('Description: ${_descriptionController.text}');
                    print('Contenu: $contentChoice');
                    print('Domaine: $selectedDomain');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // pour afficher le dégradé
                    shadowColor: Colors.transparent, // pour éviter l'ombre
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Créer',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
