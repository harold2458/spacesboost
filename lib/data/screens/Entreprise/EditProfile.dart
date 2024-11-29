import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController(text: 'YEKINI');
  final TextEditingController _lastNameController = TextEditingController(text: 'Gafour');
  final TextEditingController _emailController = TextEditingController(text: 'yekiniabdougafour@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+229 60126604');
  List<String> influencerTypes = ['Lifestyle', 'Tech', 'Mode', 'Beauté'];
  List<String> influencerDomains = ['Blogging', 'Vidéos', 'Photos', 'Gaming'];

  String? selectedType = 'Mode';
  String? selectedDomain = 'Photos';

  List<String> countries = ['Bénin', 'France', 'États-Unis'];

  // Mapping des pays avec leurs villes respectives
  Map<String, List<String>> countryCities = {
    'Bénin': ['Cotonou', 'Porto-Novo', 'Abomey-Calavi', 'Parakou'],
    'France': ['Paris', 'Lyon', 'Marseille'],
    'États-Unis': ['New York', 'Los Angeles', 'Chicago']
  };

  // Variables pour stocker le pays et la ville sélectionnés
  String? selectedCountry = 'Bénin';
  String? selectedCity = 'Abomey-Calavi';

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return  Scaffold(
       appBar: AppBar(
          title: const Text('Modifier le profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFF072858),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
           body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Nom utilisateur',
                        hintText: '*Entrez votre nom',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff072858),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Prénom utilisateur',
                        hintText: '*Entrez votre prénom',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff072858),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email utilisateur',
                        hintText: '*example@gmail.com',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xff072858),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Numero utilisateur',
                        hintText: '*+229 60126604',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xff072858),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                   SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Nom de l\'entreprise',
                        hintText: '*Entrer le nom de l\'entreprise',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff072858),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                   SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Votre rôle',
                        hintText: '*Entrez votre rôle',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff072858),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Pays',
                        hintText: '*Sélectionner un pays',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      value: selectedCountry,
                      items: countries.map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value;
                          selectedCity = null; // Réinitialiser la ville
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Ville',
                        hintText: '*Sélectionner une ville',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff072858)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      value: selectedCity,
                      items: selectedCountry == null
                          ? [] // Si aucun pays sélectionné, pas de villes à afficher
                          : countryCities[selectedCountry]!.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      // Désactiver le champ si aucun pays n'est sélectionné
                      disabledHint: Text('*Veuillez d\'abord sélectionner un pays', style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1)),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              height: screenHeight * (isPortrait ? 0.07 : 0.2),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profil modifié avec succès !'),
                        ),
                      );
                    }
                  },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0XFF072858)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bordures arrondies
                    ),
                  ),
                  elevation: const WidgetStatePropertyAll(3),
                ),
                child: Text(
                  'Appliquer',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}