import 'package:flutter/material.dart';

class AdminValidation extends StatefulWidget {
  const AdminValidation({super.key});

  @override
  State<AdminValidation> createState() => _AdminValidationState();
}

class _AdminValidationState extends State<AdminValidation> {

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

}

// Source de données personnalisée pour le PaginatedDataTable
class UserDataSource extends DataTableSource {
  final List<Map<String, dynamic>> users;
  final BuildContext context;
  final Function() notifyParent;
  final String? selectedTypeAccount; // Filtrer selon le type de compte

  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

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
          SizedBox(
            width: screenWidth * (isPortrait ? 0.3 : 0.15),
            height: screenHeight * (isPortrait ? 0.04 : 0.1),
            child: ElevatedButton(
              onPressed: () {
                _validateUser(context, user);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4CAF50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
              ),
              child: const Text(
                'Valider',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
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

  void _validateUser(BuildContext context, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Valider l\'utilisateur', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff4CAF50))),
        content: Text('Voulez-vous vraiment valider ${user['prenom']} ${user['nom']} ?'),
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
            child: const Text('Valider', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff4CAF50))),
          ),
        ],
      ),
    );
  }
}

