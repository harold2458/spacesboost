import 'package:flutter/material.dart';

class AdminStatistiques extends StatefulWidget {
  const AdminStatistiques({super.key});

  @override
  State<AdminStatistiques> createState() => _AdminStatistiquesState();
}

class _AdminStatistiquesState extends State<AdminStatistiques> {

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
        "typeCompte": typeCompte,
        "gain": "Gain ${index + 1}",
      };

      return user;
    },
  );

  final List<Map<String, String>> annonces = List.generate(
    50,
        (index) {
      Map<String, String> annonce = {
        "index": "${index + 1}",
        "titre": "Nom ${index + 1}",
        "description": "Description ${index + 1}",
        "image": "Image ${index + 1}",
        "resultat": "Resultat ${index +1}",
        "commentaire": "Commentaire ${index +1}"
      };

      return annonce;
    },
  );

  final List<Map<String, String>> promotions = List.generate(
    50,
        (index) {
      Map<String, String> promotion = {
        "index": "${index + 1}",
        "titre": "Nom ${index + 1}",
        "description": "Description ${index + 1}",
        "image": "Image ${index + 1}",
        "resultat": "Resultat ${index +1}",
        "commentaire": "Commentaire ${index +1}"
      };

      return promotion;
    },
  );

  final List<Map<String, String>> creations = List.generate(
    50,
        (index) {
      Map<String, String> creation = {
        "index": "${index + 1}",
        "titre": "Nom ${index + 1}",
        "description": "Description ${index + 1}",
        "image": "Image ${index + 1}",
        "resultat": "Resultat ${index +1}",
        "commentaire": "Commentaire ${index +1}"
      };

      return creation;
    },
  );

  static const int rowsPerPage = 10; // Nombre de lignes par page.

  // Variable pour stocker le type de compte sélectionné
  String? selectedTypeAccount;

  String? selectedTypeStatistic;

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
            // Champ : Sélection du type de compte
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Type compte',
                  hintText: '*Sélectionner le type de la statistique',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: screenWidth * 0.03),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff072858)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                value: selectedTypeStatistic,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTypeStatistic = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: null,
                    child: Text('Gain'),
                  ),
                  DropdownMenuItem(
                    value: 'annonce',
                    child: Text('Annonce'),
                  ),
                  DropdownMenuItem(
                    value: 'promotion',
                    child: Text('Promotion'),
                  ),
                  DropdownMenuItem(
                    value: 'creation',
                    child: Text('Création'),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),

            if(selectedTypeStatistic == null) ...[
              Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        child: Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Color(0xfffcbc1c)
                                ),
                                width: screenWidth * (isPortrait ? 0.4 : 0.4),
                                height: screenHeight *
                                    (isPortrait ? 0.15 : 0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.attach_money, color: Colors.white,),
                                    SizedBox(height: screenHeight *
                                        (isPortrait ? 0.02 : 0.05),),
                                    const Text('Gain total', style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                  ],
                                )
                            ),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: const Color(0xfffcbc1c))
                                    ),
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    height: screenHeight *
                                        (isPortrait ? 0.15 : 0.3),
                                    child: const Center(child: Text(
                                        '10.000.000.000 FCFA', style: TextStyle(
                                        fontWeight: FontWeight.bold)),)
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        width: screenWidth * (isPortrait ? 0.8 : 0.7),
                        child: Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Color(0xff072858)
                                ),
                                width: screenWidth * (isPortrait ? 0.4 : 0.4),
                                height: screenHeight *
                                    (isPortrait ? 0.15 : 0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.money_off, color: Colors.white,),
                                    SizedBox(height: screenHeight *
                                        (isPortrait ? 0.02 : 0.05),),
                                    const Text('Gain dépensé', style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                  ],
                                )
                            ),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: const Color(0xff072858))
                                    ),
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    height: screenHeight *
                                        (isPortrait ? 0.15 : 0.3),
                                    child: const Center(child: Text(
                                        '170.000 FCFA', style: TextStyle(
                                        fontWeight: FontWeight.bold)),)
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    SizedBox(
                      width: screenWidth * (isPortrait ? 0.9 : 0.8),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Type compte',
                          hintText: '*Sélectionner le type de compte',
                          labelStyle: const TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: screenWidth * 0.03),
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
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: PaginatedDataTable(
                          header: _buildHeader(
                              selectedTypeAccount, screenWidth, isPortrait),
                          columns: const [
                            DataColumn(label: Text('N°', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),)),
                            DataColumn(label: Text('Nom',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Color(0xff072858)),)),
                            DataColumn(label: Text('Prénom',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Color(0xff072858)),)),
                            DataColumn(label: Text('Type de compte',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Color(0xff072858)),)),
                            DataColumn(label: Text('Gain',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Color(0xff072858)),)),

                            DataColumn(label: Text('Actions',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Color(0xff072858)),)),
                          ],
                          source: UserDataSource(users, context, () {
                            setState(() {}); // Notifier le parent
                          }, selectedTypeAccount),
                          rowsPerPage: rowsPerPage,
                          showCheckboxColumn: false,
                        ),
                      ),
                    ),
                  ]
              ),
            ]
            else ...[
              Column(
                  children: [
                    if(selectedTypeStatistic == 'annonce') ...[
    Center(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 0),
    ),
    ],
    ),
    width: screenWidth * (isPortrait ? 0.8 : 0.7),
    child: Row(
    children: [
    Container(
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10)),
    color: Color(0xFFFF9800)
    ),
    width: screenWidth * (isPortrait ? 0.5 : 0.4),
    height: screenHeight *
    (isPortrait ? 0.15 : 0.3),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Icon(
    Icons.campaign, color: Colors.white,),
    SizedBox(height: screenHeight *
    (isPortrait ? 0.02 : 0.05),),
    const Text('Nombre total d\'annonce', style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold)),
    ],
    )
    ),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
    topRight: Radius.circular(10),
    bottomRight: Radius.circular(10)),
    color: Colors.white,
    border: Border.all(
    color: const Color(0xFFFF9800))
    ),
    padding: EdgeInsets.all(screenWidth * 0.02),
    height: screenHeight *
    (isPortrait ? 0.15 : 0.3),
    child: const Center(child: Text(
    '10.000.000', style: TextStyle(
    fontWeight: FontWeight.bold)),)
    )
    )
    ],
    ),
    ),
    ),
    ] else if(selectedTypeStatistic == 'promotion') ...[
    Center(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 0),
    ),
    ],
    ),
    width: screenWidth * (isPortrait ? 0.8 : 0.7),
    child: Row(
    children: [
    Container(
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10)),
    color: Color(0xFFFF9800)
    ),
    width: screenWidth * (isPortrait ? 0.5 : 0.4),
    height: screenHeight *
    (isPortrait ? 0.15 : 0.3),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Icon(
    Icons.local_offer, color: Colors.white,),
    SizedBox(height: screenHeight *
    (isPortrait ? 0.02 : 0.05),),
    const Text('Nombre total de produit', style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold)),
    ],
    )
    ),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
    topRight: Radius.circular(10),
    bottomRight: Radius.circular(10)),
    color: Colors.white,
    border: Border.all(
    color: const Color(0xFFFF9800))
    ),
    padding: EdgeInsets.all(screenWidth * 0.02),
    height: screenHeight *
    (isPortrait ? 0.15 : 0.3),
    child: const Center(child: Text(
    '10.265.000', style: TextStyle(
    fontWeight: FontWeight.bold)),)
    )
    )
    ],
    ),
    ),
    ),

    ] else if(selectedTypeStatistic == 'creation') ...[
    Center(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 0),
    ),
    ],
    ),
    width: screenWidth * (isPortrait ? 0.8 : 0.7),
    child: Row(
    children: [
    Container(
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10)),
    //color: Color(0xfffcbc1c)
    color: Color(0xFF2196F3)
    ),
    width: screenWidth * (isPortrait ? 0.5 : 0.4),
    height: screenHeight *
    (isPortrait ? 0.15 : 0.3),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Icon(
    Icons.note_add, color: Colors.white,),
    SizedBox(height: screenHeight *
    (isPortrait ? 0.02 : 0.05),),
    const Text('Nombre total de contenu', style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold)),
    ],
    )
    ),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
    topRight: Radius.circular(10),
    bottomRight: Radius.circular(10)),
    color: Colors.white,
    border: Border.all(
    color: const Color(0xFF2196F3))
    ),
    padding: EdgeInsets.all(screenWidth * 0.02),
    height: screenHeight *
    (isPortrait ? 0.15 : 0.3),
    child: const Center(child: Text(
    '7.265.654', style: TextStyle(
    fontWeight: FontWeight.bold)),)
    )
    )
    ],
    ),
    ),
    ),
    ],
    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SizedBox(
    width: screenWidth * (isPortrait ? 0.9 : 0.8),
    child: PaginatedDataTable(
    header: _buildHeaderTable(selectedTypeStatistic!, screenWidth, isPortrait),
    columns: const [
    DataColumn(
    label: Text(
    'N°',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    DataColumn(
    label: Text(
    'Titre',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    DataColumn(
    label: Text(
    'Description',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    DataColumn(
    label: Text(
    'Image',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    DataColumn(
    label: Text(
    'Résultat',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    DataColumn(
    label: Text(
    'Commentaire',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    DataColumn(
    label: Text(
    'Actions',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xff072858),
    ),
    ),
    ),
    ],
    source: _getDataSource(selectedTypeStatistic!, context, () => setState(() {}), annonces, promotions, creations),
    rowsPerPage: rowsPerPage,
    showCheckboxColumn: false,
    ),
    ),
    ),])]])));

  }
}

Widget _buildHeaderTable(String selectedTypeStatistic, double screenWidth, bool isPortrait) {
  if (selectedTypeStatistic == 'annonce') {
    return Row(
      children: [
        const Icon(Icons.campaign, color: Color(0xFFFF9800)),
        SizedBox(width: screenWidth * 0.03),
        const Text(
          'Liste des annonces',
          style: TextStyle(
            color: Color(0xFFFF9800),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  } else if (selectedTypeStatistic == 'promotion') {
    return Row(
      children: [
        const Icon(Icons.local_offer, color: Color(0xFFFF9800)),
        SizedBox(width: screenWidth * 0.03),
        const Text(
          'Liste des produits',
          style: TextStyle(
            color: Color(0xFFFF9800),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  } else if (selectedTypeStatistic == 'creation') {
    return Row(
      children: [
        const Icon(Icons.edit, color: Color(0xFF2196F3)),
        SizedBox(width: screenWidth * 0.03),
        const Text(
          'Liste des contenus',
          style: TextStyle(
            color: Color(0xFF2196F3),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  return const SizedBox.shrink(); // Si aucun type n'est sélectionné
}

DataTableSource _getDataSource(
    String selectedTypeStatistic, BuildContext context, VoidCallback setState, List<Map<String, dynamic>> annonces, List<Map<String, dynamic>> promotions, List<Map<String, dynamic>> creations) {
  if (selectedTypeStatistic == 'annonce') {
    return AnnonceDataSource(annonces, context, setState);
  } else if (selectedTypeStatistic == 'promotion') {
    return PromotionDataSource(promotions, context, setState);
  } else if (selectedTypeStatistic == 'creation') {
    return CreationDataSource(creations, context, setState);
  }
  throw Exception('Type de statistique non reconnu : $selectedTypeStatistic');
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
      return 'Gain des Entreprises';
    } else if (selectedTypeAccount == "Influenceur") {
      return 'Gain des Influenceurs';
    } else {
      return 'Gain des Utilisateurs';
    }
  }

  //Source de données personnalisée pour le PaginatedDataTable
class UserDataSource extends DataTableSource {
  final List<Map<String, dynamic>> users;
  final BuildContext context;
  final Function() notifyParent;
  final String? selectedTypeAccount; // Filtrer selon le type de compte

  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

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
      DataCell(Text(user["typeCompte"] ?? "")),
      DataCell(Text(user["gain"] ?? "")),
    ];
    // Ajouter les actions
    cells.add(DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () => _showUserInfo(context, user),
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
                          text: 'Gain : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${user['gain']}',
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
}

class AnnonceDataSource extends DataTableSource {
  final List<Map<String, dynamic>> annonces;
  final BuildContext context;
  final Function() notifyParent;

  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  AnnonceDataSource(
      this.annonces, this.context, this.notifyParent);

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: _buildDataCells(annonces[index]),
    );
  }

  List<DataCell> _buildDataCells(Map<String, dynamic> annonce) {
    List<DataCell> cells = [
      DataCell(Text(annonce["index"] ?? "")),
      DataCell(Text(annonce["titre"] ?? "")),
      DataCell(Text(annonce["description"] ?? "")),
      DataCell(Text(annonce["image"] ?? "")),
      DataCell(Text(annonce["resultat"] ?? "")),
      DataCell(Text(annonce["commentaire"] ?? "")),
    ];
    // Ajouter les actions
    cells.add(DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () => _showAnnonceInfo(context, annonce),
          ),
        ],
      ),
    ));

    return cells;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => annonces.length;

  @override
  int get selectedRowCount => 0;

  // Fonctions d'affichage et de modification des utilisateurs (inchangées)
  void _showAnnonceInfo(BuildContext context, Map<String, dynamic> annonce) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Détails de l\'annonce', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Titre : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${annonce['titre']}',
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
                          text: 'Description : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${annonce['description']}',
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
                          text: 'Image : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${annonce['image']}',
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
                          text: 'Résultat : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${annonce['resultat']}',
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
                          text: 'Commentaire : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${annonce['commentaire']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
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
}

class PromotionDataSource extends DataTableSource {
  final List<Map<String, dynamic>> promotions;
  final BuildContext context;
  final Function() notifyParent;

  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  PromotionDataSource(
      this.promotions, this.context, this.notifyParent);

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: _buildDataCells(promotions[index]),
    );
  }

  List<DataCell> _buildDataCells(Map<String, dynamic> promotion) {
    List<DataCell> cells = [
      DataCell(Text(promotion["index"] ?? "")),
      DataCell(Text(promotion["titre"] ?? "")),
      DataCell(Text(promotion["description"] ?? "")),
      DataCell(Text(promotion["image"] ?? "")),
      DataCell(Text(promotion["resultat"] ?? "")),
      DataCell(Text(promotion["commentaire"] ?? "")),
    ];
    // Ajouter les actions
    cells.add(DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () => _showPromotionInfo(context, promotion),
          ),
        ],
      ),
    ));

    return cells;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => promotions.length;

  @override
  int get selectedRowCount => 0;

  // Fonctions d'affichage et de modification des utilisateurs (inchangées)
  void _showPromotionInfo(BuildContext context, Map<String, dynamic> promotion) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Détails du produit', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Titre : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${promotion['titre']}',
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
                          text: 'Description : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${promotion['description']}',
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
                          text: 'Image : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${promotion['image']}',
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
                          text: 'Résultat : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${promotion['resultat']}',
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
                          text: 'Commentaire : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${promotion['commentaire']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
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
}

class CreationDataSource extends DataTableSource {
  final List<Map<String, dynamic>> creations;
  final BuildContext context;
  final Function() notifyParent;

  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  CreationDataSource(
      this.creations, this.context, this.notifyParent);

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: _buildDataCells(creations[index]),
    );
  }

  List<DataCell> _buildDataCells(Map<String, dynamic> creation) {
    List<DataCell> cells = [
      DataCell(Text(creation["index"] ?? "")),
      DataCell(Text(creation["titre"] ?? "")),
      DataCell(Text(creation["description"] ?? "")),
      DataCell(Text(creation["image"] ?? "")),
      DataCell(Text(creation["resultat"] ?? "")),
      DataCell(Text(creation["commentaire"] ?? "")),
    ];
    // Ajouter les actions
    cells.add(DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () => _showCreationInfo(context, creation),
          ),
        ],
      ),
    ));

    return cells;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => creations.length;

  @override
  int get selectedRowCount => 0;

  // Fonctions d'affichage et de modification des utilisateurs (inchangées)
  void _showCreationInfo(BuildContext context, Map<String, dynamic> creation) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Détails du contenu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Titre : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${creation['titre']}',
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
                          text: 'Description : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${creation['description']}',
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
                          text: 'Image : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${creation['image']}',
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
                          text: 'Résultat : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${creation['resultat']}',
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
                          text: 'Commentaire : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff072858), fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),),
                        ),
                        TextSpan(
                          text: '${creation['commentaire']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ]
                  )
              ),
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
}

