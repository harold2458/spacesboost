import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AdminGestionUsers extends StatefulWidget {
  const AdminGestionUsers({super.key});

  @override
  State<AdminGestionUsers> createState() => _AdminGestionUsersState();
}

class _AdminGestionUsersState extends State<AdminGestionUsers> {

  final List<Map<String, String>> users = List.generate(
    50,
        (index) {
      // Déterminer le type de compte et les champs supplémentaires en fonction du type
      String typeCompte = index < 20 ? "Entreprise" : "Influenceur";

      // Champs communs à tous les utilisateurs
      Map<String, String> user = {
        "index": "${index + 1}",
        "nom": "Nom ${index + 1}",
        "prenom": "Prénom ${index + 1}",
        "email": "user${index + 1}@example.com",
        "numero": "+33 6 ${index % 10}0 ${index % 10}1 ${index % 10}2 ${index % 10}3",
        "pays": "Pays ${index + 1}",
        "ville": "Ville ${index + 1}",
        "typeCompte": typeCompte,
        "conditionUtilisation": "true"
      };

      // Champs spécifiques aux entreprises
      if (typeCompte == "Entreprise") {
        user.addAll({
          "nomEntreprise": "Entreprise ${index + 1}",
          "responsabilite": "Responsabilité ${index + 1}",
        });
      }

      // Champs spécifiques aux influenceurs
      if (typeCompte == "Influenceur") {
        user.addAll({
          "typeInfluence": "Type d'influence ${index + 1}",
          "domaineInfluence": "Domaine d'influence ${index + 1}",
          "instagram": "https://instagram.com/influenceur${index + 1}",
          "youtube": "https://youtube.com/influenceur${index + 1}",
          "facebook": "https://facebook.com/influenceur${index + 1}",
        });
      }

      return user;
    },
  );

  static const int rowsPerPage = 10; // Nombre de lignes par page.

  // Variable pour stocker le type de compte sélectionné
  String? selectedTypeAccount;

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * (isPortrait ? 0.05 : 0.1),
          vertical: screenHeight * (isPortrait ? 0.03 : 0.1),
        ),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              height: screenHeight * (isPortrait ? 0.07 : 0.2),
              child: ElevatedButton(
                onPressed: () {
                  _addUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff072858),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Ajouter un utilisateur',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            // Champ : Sélection du type de compte
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Type compte',
                  hintText: '*Sélectionner le type de compte',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
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
                value: selectedTypeAccount,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTypeAccount = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: null,
                    child: Text('Tous les comptes'),
                  ),
                  DropdownMenuItem(
                    value: "Entreprise",
                    child: Text("Entreprise"),
                  ),
                  DropdownMenuItem(
                    value: "Influenceur",
                    child: Text("Influenceur"),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                child: PaginatedDataTable(
                  header: _buildHeader(selectedTypeAccount, screenWidth, isPortrait),
                  columns: [
                    const DataColumn(label: Text('N°', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Nom', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Prénom', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Numéro', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Pays', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Ville', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Type de compte', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),

                    if(selectedTypeAccount == "Entreprise") ...[
                      const DataColumn(label: Text('Nom entreprise', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                      const DataColumn(label: Text('Responsabilite', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    ] else if(selectedTypeAccount == "Influenceur") ...[
                      const DataColumn(label: Text('Type influenceur', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                      const DataColumn(label: Text('Domaine influence', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                      const DataColumn(label: Text('Instagram', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                      const DataColumn(label: Text('Youtube', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                      const DataColumn(label: Text('Facebook', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    ],

                    const DataColumn(label: Text('Conditions d\'utilisation', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                  ],
                  source: UserDataSource(users, context, () {
                    setState(() {}); // Notifier le parent
                  }, selectedTypeAccount),
                  rowsPerPage: rowsPerPage,
                  showCheckboxColumn: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String? selectedTypeAccount, double screenWidth, bool isPortrait) {
    final color = _getIconColor(selectedTypeAccount); // Obtenir la couleur dynamique

    return Row(
      children: [
        Icon(
          _getHeaderIcon(selectedTypeAccount),
          color: color, // Appliquer la couleur à l’icône
        ),
        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1)),
        Text(
          _getHeaderTitle(selectedTypeAccount),
          style: TextStyle(
            fontSize: isPortrait ? screenWidth * 0.05 : null,
            fontWeight: FontWeight.bold,
            color: color, // Appliquer la même couleur au texte
          ),
        ),
      ],
    );
  }

  IconData _getHeaderIcon(String? selectedTypeAccount) {
    if (selectedTypeAccount == "Entreprise") {
      return Icons.business; // Icône pour les entreprises
    } else if (selectedTypeAccount == "Influenceur") {
      return Icons.group; // Icône pour les influenceurs
    } else {
      return Icons.groups; // Icône par défaut pour tous les comptes
    }
  }

  Color _getIconColor(String? selectedTypeAccount) {
    if (selectedTypeAccount == "Entreprise") {
      return Colors.blueAccent; // Couleur pour les entreprises
    } else if (selectedTypeAccount == "Influenceur") {
      return Colors.purple; // Couleur pour les influenceurs
    } else {
      return const Color(0xfffcbc1c); // Couleur par défaut
    }
  }

  String _getHeaderTitle(String? selectedTypeAccount) {
    if (selectedTypeAccount == "Entreprise") {
      return 'Liste des Entreprises';
    } else if (selectedTypeAccount == "Influenceur") {
      return 'Liste des Influenceurs';
    } else {
      return 'Liste des Utilisateurs';
    }
  }



  void _addUser() {
    showDialog(
      context: context,
      builder: (context) {

        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final screenWidth = mediaQuery.size.width;
        final isPortrait = mediaQuery.orientation == Orientation.portrait;

        final TextEditingController nomController = TextEditingController();
        final TextEditingController prenomController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController telephoneController = TextEditingController();

        // Liste des pays
        List<String> countries = ['Bénin', 'France', 'États-Unis'];

        // Mapping des pays avec leurs villes respectives
        Map<String, List<String>> countryCities = {
          'Bénin': ['Cotonou', 'Porto-Novo', 'Parakou'],
          'France': ['Paris', 'Lyon', 'Marseille'],
          'États-Unis': ['New York', 'Los Angeles', 'Chicago']
        };

        // Variables pour stocker le pays et la ville sélectionnés
        String? selectedCountry;
        String? selectedCity;

        // Liste des types et domaines d'influenceur
        List<String> influencerTypes = ['Lifestyle', 'Tech', 'Mode', 'Beauté'];
        List<String> influencerDomains = ['Blogging', 'Vidéos', 'Photos', 'Gaming'];

        String? selectedType;
        String? selectedDomain;

        // Variables pour les cases à cocher (réseaux sociaux)
        bool isInstagram = false;
        bool isYouTube = false;
        bool isFacebook = false;

        // Variables pour les liens des réseaux sociaux
        String? instagramLink;
        String? youtubeLink;
        String? facebookLink;

        // Variable pour l'acceptation des conditions d'utilisation
        bool acceptTerms = false;

        // Variable pour stocker le type de compte sélectionné
        String? selectedTypeAccount;

        final TextEditingController entrepriseController = TextEditingController();
        final TextEditingController roleController = TextEditingController();

        return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text('Ajout d\'un utilisateur', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858))),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextField(
                          controller: nomController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Nom utilisateur',
                            hintText: '*Entrez votre nom',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xfffcbc1c),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextField(
                          controller: prenomController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Prénom utilisateur',
                            hintText: '*Entrez votre prénom',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xfffcbc1c),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email utilisateur',
                            hintText: '*example@gmail.com',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xfffcbc1c),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextField(
                          controller: telephoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Numéro utilisateur',
                            hintText: '*+229 60126604',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Color(0xfffcbc1c),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
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
                          disabledHint: Text('*Veuillez d\'abord sélectionner un pays', style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.02)),
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Type compte',
                            hintText: '*Sélectionner le type de compte',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
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
                          value: selectedTypeAccount,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTypeAccount = newValue;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: "Entreprise",
                              child: Text("Entreprise"),
                            ),
                            DropdownMenuItem(
                              value: "Influenceur",
                              child: Text("Influenceur"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      if (selectedTypeAccount == "Influenceur") ...[
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Type d\'influenceur',
                              hintText: '*Sélectionner le type',
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
                            value: selectedType,
                            items: influencerTypes.map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                            validator: (value) => value == null ? 'Veuillez sélectionner un type' : null,
                          ),
                        ),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          //height: screenHeight * (isPortrait ? 0.05 : 0.1),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Domaine d\'influence',
                              hintText: '*Sélectionner le domaine',
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
                            value: selectedDomain,
                            items: influencerDomains.map((domain) {
                              return DropdownMenuItem(
                                value: domain,
                                child: Text(domain),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDomain = value;
                              });
                            },
                            validator: (value) => value == null ? 'Veuillez sélectionner un domaine' : null,
                          ),
                        ),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        // Champ : Réseaux sociaux
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * (isPortrait ? 0.03 : 0.1),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline, color: Colors.red),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(  // Ajout d'Expanded ici
                                child: Marquee(
                                  text: 'Vous pouvez cocher un ou plusieurs réseaux sociaux et renseigner le lien correspondant :',
                                  style: const TextStyle(fontStyle: FontStyle.italic),
                                  scrollAxis: Axis.horizontal,
                                  blankSpace: 20.0,
                                  velocity: 30.0,
                                  pauseAfterRound: const Duration(seconds: 1),
                                  startPadding: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: CheckboxListTile(
                            title: const Text('Instagram', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),),
                            value: isInstagram,
                            onChanged: (bool? value) {
                              setState(() {
                                isInstagram = value!;
                              });
                            },
                            activeColor: const Color(0xfffcbc1c),
                          ),
                        ),
                        if (isInstagram)
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
                            height: screenHeight * (isPortrait ? 0.05 : 0.1),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Lien vers votre profil Instagram',
                                hintText: '*https://www.instagram.com/gafour/',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                prefixIcon: const Icon(
                                  Icons.link,
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
                              onChanged: (value) {
                                instagramLink = value;
                              },
                              validator: (value) {
                                if (isInstagram && (value == null || value.isEmpty)) {
                                  return '*Veuillez renseigner le lien vers votre profil Instagram';
                                }
                                return null;
                              },
                            ),
                          )
                        else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                        SizedBox(height: screenHeight * (isPortrait ? 0.005 : 0.05),),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: CheckboxListTile(
                            title: const Text('YouTube', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),),
                            value: isYouTube,
                            onChanged: (bool? value) {
                              setState(() {
                                isYouTube = value!;
                              });
                            },
                            activeColor: const Color(0xfffcbc1c),
                          ),
                        ),
                        if (isYouTube)
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
                            height: screenHeight * (isPortrait ? 0.05 : 0.1),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Lien vers votre chaîne YouTube',
                                hintText: '*https://www.youtube.com/gafour/',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                prefixIcon: const Icon(
                                  Icons.link,
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
                              onChanged: (value) {
                                youtubeLink = value;
                              },
                              validator: (value) {
                                if (isYouTube && (value == null || value.isEmpty)) {
                                  return '*Veuillez renseigner le lien vers votre chaîne YouTube';
                                }
                                return null;
                              },
                            ),
                          )
                        else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                        SizedBox(height: screenHeight * (isPortrait ? 0.005 : 0.05),),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: CheckboxListTile(
                            title: const Text('Facebook', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),),
                            value: isFacebook,
                            onChanged: (bool? value) {
                              setState(() {
                                isFacebook = value!;
                              });
                            },
                            activeColor: const Color(0xfffcbc1c),
                          ),
                        ),
                        if (isFacebook)
                          SizedBox(
                            width: screenWidth * (isPortrait ? 0.9 : 0.8),
                            height: screenHeight * (isPortrait ? 0.05 : 0.1),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Lien vers votre profil Facebook',
                                hintText: '*https://www.facebook.com/gafour/',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
                                prefixIcon: const Icon(
                                  Icons.link,
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
                              onChanged: (value) {
                                facebookLink = value;
                              },
                              validator: (value) {
                                if (isFacebook && (value == null || value.isEmpty)) {
                                  return 'Veuillez renseigner le lien vers votre profil Facebook';
                                }
                                return null;
                              },
                            ),
                          )
                        else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        SizedBox(
                          child: CheckboxListTile(
                            title: RichText(
                              text: TextSpan(
                                text: 'J\'accepte les ', // Texte simple
                                style: TextStyle(
                                  fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black, // Nécessaire pour que le texte soit visible
                                ),
                                children: [
                                  TextSpan(
                                    text: 'conditions d\'utilisation', // Texte cliquable
                                    style: TextStyle(
                                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.02),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: const Color(0xfffcbc1c),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Conditions d\'utilisation',
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xfffcbc1c),
                                                ),
                                              ),
                                              content: SingleChildScrollView(
                                                child: Text(
                                                  '''
Conditions d'Utilisation de SPACEBOOST

Bienvenue dans notre application dédiée aux influenceurs souhaitant promouvoir leurs talents en réalisant des prestations pour les entreprises. En utilisant cette application, vous acceptez les conditions suivantes :

1. Inscription : Vous devez créer un compte en fournissant des informations exactes et complètes. Vous êtes responsable de la confidentialité de votre mot de passe.

2. Utilisation de l'Application : Vous vous engagez à utiliser l'application uniquement à des fins légales et à respecter toutes les lois applicables.

3. Contenu : En publiant du contenu sur l'application, vous accordez à notre entreprise une licence mondiale, non exclusive et gratuite pour utiliser, reproduire et distribuer ce contenu.

4. Comportement : Vous devez vous comporter de manière respectueuse envers les autres utilisateurs et ne pas publier de contenu offensant, diffamatoire ou illégal.

5. Modification des Conditions : Nous nous réservons le droit de modifier ces conditions d'utilisation à tout moment. Les modifications seront publiées sur l'application et entreront en vigueur immédiatement.

6. Résiliation : Nous nous réservons le droit de suspendre ou de résilier votre compte en cas de violation de ces conditions.

En utilisant cette application, vous reconnaissez avoir lu, compris et accepté ces conditions d'utilisation.

Merci de votre compréhension et bonne utilisation de notre application !
                          ''',
                                                  style: TextStyle(fontSize: screenWidth * 0.03),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Fermer',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff072858),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                            value: acceptTerms,
                            onChanged: (bool? value) {
                              setState(() {
                                acceptTerms = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xfffcbc1c),
                          ),
                        ),
                      ] else if (selectedTypeAccount == "Entreprise") ...[
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: TextField(
                            controller: entrepriseController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Nom de l\'entreprise',
                              hintText: '*Entrez le nom de l\'entreprise',
                              labelStyle: const TextStyle(color: Colors.grey),
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.business,
                                color: Color(0xfffcbc1c),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xfffcbc1c)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xfffcbc1c)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: TextField(
                            controller: roleController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Responsabilité',
                              hintText: 'Ex: CEO, Responsable marketing',
                              labelStyle: const TextStyle(color: Colors.grey),
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.badge,
                                color: Color(0xfffcbc1c),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xfffcbc1c)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xfffcbc1c)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), // Fermer le popup
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Ajouter l'utilisateur avec les données du formulaire
                      setState(() {
                        users.add({
                          "numero": "${users.length + 1}",
                          "nom": nomController.text,
                          "prenom": prenomController.text,
                          "email": emailController.text,
                          "telephone": telephoneController.text,
                        });
                      });
                      Navigator.pop(context); // Fermer le popup
                    },
                    child: const Text('Ajouter', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858))),
                  ),
                ],
              );
            }
        );
      },
    );
  }
}

// Source de données personnalisée pour le PaginatedDataTable
class UserDataSource extends DataTableSource {
  final List<Map<String, dynamic>> users;
  final BuildContext context;
  final Function() notifyParent;
  final String? selectedTypeAccount; // Filtrer selon le type de compte

  void _recalculateNumbers() {
    for (int i = 0; i < users.length; i++) {
      users[i]["numero"] = "${i + 1}";
    }
  }

  UserDataSource(
      this.users, this.context, this.notifyParent, this.selectedTypeAccount);

  // Filtrer les utilisateurs selon le type de compte sélectionné
  List<Map<String, dynamic>> get filteredUsers {
    if (selectedTypeAccount == null || selectedTypeAccount!.isEmpty) {
      return users; // Tous les utilisateurs si aucun filtre n’est appliqué
    }
    return users
        .where((user) => user["typeCompte"] == selectedTypeAccount)
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= filteredUsers.length) return null;
    final user = filteredUsers[index];

    return DataRow(
      cells: _buildDataCells(user, selectedTypeAccount),
    );
  }

  List<DataCell> _buildDataCells(Map<String, dynamic> user, String? selectedTypeAccount) {
    List<DataCell> cells = [
      DataCell(Text(user["index"] ?? "")),
      DataCell(Text(user["nom"] ?? "")),
      DataCell(Text(user["prenom"] ?? "")),
      DataCell(Text(user["email"] ?? "")),
      DataCell(Text(user["numero"] ?? "")),
      DataCell(Text(user["pays"] ?? "")),
      DataCell(Text(user["ville"] ?? "")),
      DataCell(Text(user["typeCompte"] ?? "")),

    ];

    // Ajouter des cellules dynamiques selon le type de compte
    if (selectedTypeAccount == "Entreprise" && user["typeCompte"] == "Entreprise") {
      cells.add(DataCell(Text(user["nomEntreprise"] ?? "")));
      cells.add(DataCell(Text(user["responsabilite"] ?? "")));
    } else if (selectedTypeAccount == "Influenceur" && user["typeCompte"] == "Influenceur") {
      cells.add(DataCell(Text(user["typeInfluence"] ?? "")));
      cells.add(DataCell(Text(user["domaineInfluence"] ?? "")));
      cells.add(DataCell(Text(user["instagram"] ?? "")));
      cells.add(DataCell(Text(user["youtube"] ?? "")));
      cells.add(DataCell(Text(user["facebook"] ?? "")));
    }

    cells.add(DataCell(
      Checkbox(
        value: user["conditionUtilisation"] == "true",
        onChanged: null, // Non modifiable dans cette vue
      ),
    ),);

    // Ajouter les actions
    cells.add(DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () => _showUserInfo(context, user),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.orange),
            onPressed: () => _editUserInfo(context, user),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _deleteUser(context, user),
          ),
        ],
      ),
    ));

    return cells;
  }


  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => filteredUsers.length;

  @override
  int get selectedRowCount => 0;

  // Fonctions d'affichage et de modification des utilisateurs (inchangées)
  void _showUserInfo(BuildContext context, Map<String, dynamic> user) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Détails de l\'utilisateur', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Nom : ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                    ),
                    TextSpan(
                      text: '${user['nom']}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ]
                )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Prénom : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['prenom']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Email : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['email']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Numéro : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['numero']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Pays : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['pays']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ville : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['ville']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Type de compte : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['typeCompte']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
              if(user["typeCompte"] == "Entreprise") ...[
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nom de l\'entreprise : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['nomEntreprise']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Responsabilité : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['responsabilite']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
              ] else if(user['typeCompte'] == "Influenceur") ...[
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Type d\'influenceur : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['typeInfluenceur']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Domaine d\'influence : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['domaineInfluence']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Instragram : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['instagram']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Youtube : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['youtube']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Facebook : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                          ),
                          TextSpan(
                            text: '${user['facebook']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]
                    )
                ),
              ]
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildUserDetails(Map<String, dynamic> user) {
    List<Widget> details = [
      Text('Nom: ${user['nom']}'),
      Text('Prénom: ${user['prenom']}'),
      Text('Email: ${user['email']}'),
      Text('Email: ${user['numero']}'),
      Text('Email: ${user['pays']}'),
      Text('Email: ${user['ville']}'),
      Text('Type de compte: ${user['typeCompte']}'),
    ];

    if (user["typeCompte"] == "Entreprise") {
      details.add(Text('Nom entreprise: ${user['nomEntreprise']}'));
      details.add(Text('Responsabilité: ${user['responsabilite']}'));
    } else if (user["typeCompte"] == "Influenceur") {
      details.add(Text('Type d\'influenceur: ${user['typeInfluenceur']}'));
      details.add(Text('Domaine d\'influence: ${user['domaineInfluence']}'));
      details.add(Text('Réseaux: ${(user['reseaux'] as List<String>).join(", ")}'));
    }

    details.add(
      Text('Conditions acceptées: ${user['conditionsAcceptees'] ? "Oui" : "Non"}'),
    );

    return details;
  }

    void _editUserInfo(BuildContext context, Map<String, dynamic> user) {

      final formKey = GlobalKey<FormState>();
      final TextEditingController firstNameController = TextEditingController(text: '${user['nom']}');
      final TextEditingController lastNameController = TextEditingController(text: '${user['prenom']}');
      final TextEditingController emailController = TextEditingController(text: '${user['email']}');
      final TextEditingController phoneController = TextEditingController(text: '${user['numero']}');
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

      // Variables pour les cases à cocher (réseaux sociaux)
      bool isInstagram = false;
      bool isYouTube = false;
      bool isFacebook = false;

      // Variables pour les liens des réseaux sociaux
      String? instagramLink;
      String? youtubeLink;
      String? facebookLink;

      // Variable pour stocker le type de compte sélectionné
      String? selectedTypeAccount = user['typeCompte'];

      final TextEditingController entrepriseController = TextEditingController();
      final TextEditingController roleController = TextEditingController();

      final mediaQuery = MediaQuery.of(context);
      final screenHeight = mediaQuery.size.height;
      final screenWidth = mediaQuery.size.width;
      final isPortrait = mediaQuery.orientation == Orientation.portrait;

      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Modifier l\'utilisateur', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
              content: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: firstNameController,
                          decoration: InputDecoration(
                            labelText: 'Nom utilisateur',
                            hintText: '*Entrez votre nom',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.orange,
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
                          controller: lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Prénom utilisateur',
                            hintText: '*Entrez votre prénom',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.orange,
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
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email utilisateur',
                            hintText: '*example@gmail.com',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.orange,
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
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Numero utilisateur',
                          hintText: '*+229 60126604',
                          labelStyle: const TextStyle(color: Colors.grey),
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.orange,
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
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                SizedBox(
                  width: screenWidth * (isPortrait ? 0.9 : 0.8),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Type compte',
                      hintText: '*Sélectionner le type de compte',
                      labelStyle: const TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
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
                    value: selectedTypeAccount,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTypeAccount = newValue;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: "Entreprise",
                        child: Text("Entreprise"),
                      ),
                      DropdownMenuItem(
                        value: "Influenceur",
                        child: Text("Influenceur"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                if (selectedTypeAccount == "Influenceur") ...[
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
          labelText: 'Type d\'influenceur',
          hintText: '*Sélectionner le type',
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
          value: selectedType,
          items: influencerTypes.map((type) {
          return DropdownMenuItem(
          value: type,
          child: Text(type),
          );
          }).toList(),
          onChanged: (value) {
          setState(() {
          selectedType = value;
          });
          },
          validator: (value) => value == null ? 'Veuillez sélectionner un type' : null,
          ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          //height: screenHeight * (isPortrait ? 0.05 : 0.1),
          child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
          labelText: 'Domaine d\'influence',
          hintText: '*Sélectionner le domaine',
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
          value: selectedDomain,
          items: influencerDomains.map((domain) {
          return DropdownMenuItem(
          value: domain,
          child: Text(domain),
          );
          }).toList(),
          onChanged: (value) {
          setState(() {
          selectedDomain = value;
          });
          },
          validator: (value) => value == null ? 'Veuillez sélectionner un domaine' : null,
          ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
          // Champ : Réseaux sociaux
          SizedBox(
          width: screenWidth * 0.8,
          height: screenHeight * (isPortrait ? 0.03 : 0.1),
          child: Row(
          children: [
          const Icon(Icons.info_outline, color: Colors.red),
          SizedBox(width: screenWidth * 0.02),
          Expanded(  // Ajout d'Expanded ici
          child: Marquee(
          text: 'Vous pouvez cocher un ou plusieurs réseaux sociaux et renseigner le lien correspondant :',
          style: const TextStyle(fontStyle: FontStyle.italic),
          scrollAxis: Axis.horizontal,
          blankSpace: 20.0,
          velocity: 30.0,
          pauseAfterRound: const Duration(seconds: 1),
          startPadding: 10.0,
          ),
          ),
          ],
          ),
          ),
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          child: CheckboxListTile(
          title: const Text('Instagram', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),),
          value: isInstagram,
          onChanged: (bool? value) {
          setState(() {
          isInstagram = value!;
          });
          },
          activeColor: const Color(0xfffcbc1c),
          ),
          ),
          if (isInstagram)
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          height: screenHeight * (isPortrait ? 0.05 : 0.1),
          child: TextFormField(
          decoration: InputDecoration(
          labelText: 'Lien vers votre profil Instagram',
          hintText: '*https://www.instagram.com/gafour/',
          labelStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
          hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
          prefixIcon: const Icon(
          Icons.link,
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
          onChanged: (value) {
          instagramLink = value;
          },
          validator: (value) {
          if (isInstagram && (value == null || value.isEmpty)) {
          return '*Veuillez renseigner le lien vers votre profil Instagram';
          }
          return null;
          },
          ),
          )
          else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
          SizedBox(height: screenHeight * (isPortrait ? 0.005 : 0.05),),
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          child: CheckboxListTile(
          title: const Text('YouTube', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),),
          value: isYouTube,
          onChanged: (bool? value) {
          setState(() {
          isYouTube = value!;
          });
          },
          activeColor: const Color(0xfffcbc1c),
          ),
          ),
          if (isYouTube)
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          height: screenHeight * (isPortrait ? 0.05 : 0.1),
          child: TextFormField(
          decoration: InputDecoration(
          labelText: 'Lien vers votre chaîne YouTube',
          hintText: '*https://www.youtube.com/gafour/',
          labelStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
          hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
          prefixIcon: const Icon(
          Icons.link,
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
          onChanged: (value) {
          youtubeLink = value;
          },
          validator: (value) {
          if (isYouTube && (value == null || value.isEmpty)) {
          return '*Veuillez renseigner le lien vers votre chaîne YouTube';
          }
          return null;
          },
          ),
          )
          else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
          SizedBox(height: screenHeight * (isPortrait ? 0.005 : 0.05),),
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          child: CheckboxListTile(
          title: const Text('Facebook', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffcbc1c)),),
          value: isFacebook,
          onChanged: (bool? value) {
          setState(() {
          isFacebook = value!;
          });
          },
          activeColor: const Color(0xfffcbc1c),
          ),
          ),
          if (isFacebook)
          SizedBox(
          width: screenWidth * (isPortrait ? 0.9 : 0.8),
          height: screenHeight * (isPortrait ? 0.05 : 0.1),
          child: TextFormField(
          decoration: InputDecoration(
          labelText: 'Lien vers votre profil Facebook',
          hintText: '*https://www.facebook.com/gafour/',
          labelStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
          hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * (isPortrait ? 0.03 : 0.02)),
          prefixIcon: const Icon(
          Icons.link,
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
          onChanged: (value) {
          facebookLink = value;
          },
          validator: (value) {
          if (isFacebook && (value == null || value.isEmpty)) {
          return 'Veuillez renseigner le lien vers votre profil Facebook';
          }
          return null;
          },
          ),
          )
          else SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
                  ]else if (selectedTypeAccount == "Entreprise") ...[
            SizedBox(
            width: screenWidth * (isPortrait ? 0.9 : 0.8),
            child: TextField(
            controller: entrepriseController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            labelText: 'Nom de l\'entreprise',
            hintText: '*Entrez le nom de l\'entreprise',
            labelStyle: const TextStyle(color: Colors.grey),
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(
            Icons.business,
            color: Colors.orange,
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
            ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            SizedBox(
            width: screenWidth * (isPortrait ? 0.9 : 0.8),
            child: TextField(
            controller: roleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            labelText: 'Responsabilité',
            hintText: 'Ex: CEO, Responsable marketing',
            labelStyle: const TextStyle(color: Colors.grey),
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(
            Icons.badge,
            color: Colors.orange,
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
            ),
            ),
            ],
                ]),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  // Logique de modification ici
                  Navigator.pop(context);
                },
                child: const Text('Enregistrer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
              ),
            ],
          );
        }
      )
    );
  }

  void _deleteUser(BuildContext context, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'utilisateur', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        content: Text('Voulez-vous vraiment supprimer ${user['prenom']} ${user['nom']} ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              users.remove(user); // Supprimer l'utilisateur
              _recalculateNumbers(); // Réattribuer les numéros
              notifyParent(); // Appeler le callback pour notifier le parent
              Navigator.pop(context);
            },
            child: const Text('Supprimer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}