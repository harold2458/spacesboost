import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/validator2.dart';

class CreationContenue extends StatefulWidget {
  const CreationContenue({super.key});

  @override
  State<CreationContenue> createState() => _CreationContenueState();
}

class _CreationContenueState extends State<CreationContenue> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _tvaController = TextEditingController();

  // Dropdown selection pour le domaine
  String selectedDomain = 'Santé'; // Valeur par défaut
  List<String> domains = ['Santé', 'Technologie', 'Education', 'Autre']; // Options de dropdown

  // Choix du contenu
  String contentChoice = 'Image'; // Valeur par défaut pour le choix du contenu

  // Dropdown selection pour le thème
  String selectedTheme = 'Innovation'; // Valeur par défaut
  List<String> themes = ['Innovation', 'Durabilité', 'Éthique', 'Sécurité']; // Options de dropdown pour le thème

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Creation de contenue ',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Titre',
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un titre';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Champ pour la description
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer une description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Champ pour le budget
                      TextFormField(
                        controller: _budgetController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Budget',
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Champ pour la TVA
                      TextFormField(
                        controller: _tvaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'TVA (%)',
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xff072858), width: 2),
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
                                color: const Color(0xff072858),
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
                                color: const Color(0xff072858),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Dropdown pour le thème
                      Row(
                        children: [
                          const Text('Thème :'),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedTheme,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTheme = newValue!;
                                });
                              },
                              items: themes.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff072858),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xff072858),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.all(20),
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
                                MaterialPageRoute(builder: (context) => const Validator2()),
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
