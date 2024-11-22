import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AdminGestionCampagnes extends StatefulWidget {
  const AdminGestionCampagnes({super.key});

  @override
  State<AdminGestionCampagnes> createState() => _AdminGestionCampagnesState();
}

class _AdminGestionCampagnesState extends State<AdminGestionCampagnes> {

  final List<Map<String, String>> campaigns = List.generate(
    60, // 20 Annonce, 20 Promotion, 20 Contenu
        (index) {
      // Déterminer le type de campagne en fonction de l'index
      String typeCampaign;
      if (index < 20) {
        typeCampaign = "Annonce";
      } else if (index < 40) {
        typeCampaign = "Promotion";
      } else {
        typeCampaign = "Contenu";
      }

      // Champs communs à tous les utilisateurs
      Map<String, String> campaign = {
        "index": "${index + 1}",
        "titre": "Titre ${index + 1}",
        "contenu": "Contenu ${index + 1}",
        "fichier": "Fichier ${index + 1}",
        "typeCampaign": typeCampaign,
      };

      // Ajout de champs spécifiques en fonction du type
      if (typeCampaign == "Annonce") {
        // Ajoutez des champs spécifiques pour Annonce ici si nécessaire
      } else if (typeCampaign == "Promotion") {
        // Ajoutez des champs spécifiques pour Promotion ici si nécessaire
      } else if (typeCampaign == "Contenu") {
        // Ajoutez des champs spécifiques pour Contenu ici si nécessaire
      }

      return campaign;
    },
  );


  static const int rowsPerPage = 10; // Nombre de lignes par page.

  // Variable pour stocker le type de compte sélectionné
  String? selectedTypeCampaign;

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
                  _addCampaign();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff072858),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Ajouter un campagne',
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
                  labelText: 'Type campagne',
                  hintText: '*Sélectionner le type de campagne',
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
                value: selectedTypeCampaign,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTypeCampaign = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: null,
                    child: Text('Tous les campagnes'),
                  ),
                  DropdownMenuItem(
                    value: "Annonce",
                    child: Text("Annonce"),
                  ),
                  DropdownMenuItem(
                    value: "Promotion",
                    child: Text("Promotion"),
                  ),
                  DropdownMenuItem(
                    value: "Contenu",
                    child: Text("Contenu"),
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
                  header: _buildHeader(selectedTypeCampaign, screenWidth, isPortrait),
                  columns: [
                    const DataColumn(label: Text('N°', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Titre', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Contenu', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Fichier', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                    const DataColumn(label: Text('Type campagne', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),

                    if(selectedTypeCampaign == "Annonce") ...[
                    ] else if(selectedTypeCampaign == "Promotion") ...[
                    ] else if(selectedTypeCampaign == "Contenu") ...[
                    ],

                    const DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),)),
                  ],
                  source: CampaignDataSource(campaigns, context, () {
                    setState(() {}); // Notifier le parent
                  }, selectedTypeCampaign),
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

  Widget _buildHeader(String? selectedTypeCampaign, double screenWidth, bool isPortrait) {
    final color = _getIconColor(selectedTypeCampaign); // Obtenir la couleur dynamique

    return Row(
      children: [
        Icon(
          _getHeaderIcon(selectedTypeCampaign),
          color: color, // Appliquer la couleur à l’icône
        ),
        SizedBox(width: screenWidth * (isPortrait ? 0.05 : 0.1)),
        Text(
          _getHeaderTitle(selectedTypeCampaign),
          style: TextStyle(
            fontSize: isPortrait ? screenWidth * 0.05 : null,
            fontWeight: FontWeight.bold,
            color: color, // Appliquer la même couleur au texte
          ),
        ),
      ],
    );
  }

  IconData _getHeaderIcon(String? selectedTypeCampaign) {
    if (selectedTypeCampaign == "Annonce") {
      return Icons.announcement; // Icône pour les entreprises
    } else if (selectedTypeCampaign == "Promotion") {
      return Icons.local_offer; // Icône pour les influenceurs
    } else if (selectedTypeCampaign == "Contenu") {
      return Icons.insert_drive_file; // Icône pour les influenceurs
    }
    else {
        return Icons.campaign; // Icône par défaut pour tous les comptes
      }
    }

  Color _getIconColor(String? selectedTypeCampaign) {
    if (selectedTypeCampaign == "Annonce") {
      return Colors.blueAccent; // Couleur pour les entreprises
    } else if (selectedTypeCampaign == "Promotion") {
      return Colors.redAccent; // Couleur pour les influenceurs
    } else if (selectedTypeCampaign == "Contenu") {
      return Colors.teal;
    }
    else {
      return const Color(0xfffcbc1c); // Couleur par défaut
    }
  }

  String _getHeaderTitle(String? selectedTypeAccount) {
    if (selectedTypeAccount == "Annonce") {
      return 'Liste des Annonces';
    } else if (selectedTypeAccount == "Promotion") {
      return 'Liste des Promotions';
    } else if (selectedTypeAccount == "Contenu") {
      return 'Liste des Contenu';
    }
    else {
      return 'Liste des Campagnes';
    }
  }

  void _addCampaign() {
    showDialog(
      context: context,
      builder: (context) {

        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final screenWidth = mediaQuery.size.width;
        final isPortrait = mediaQuery.orientation == Orientation.portrait;

        final TextEditingController titleController = TextEditingController();
        final TextEditingController contentController = TextEditingController();
        String? selectedFile;

        Future<void> pickFile() async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            setState(() {
              selectedFile = result.files.single.name;
            });
          } else {
            // L'utilisateur a annulé la sélection
          }
        }

        return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text('Ajout d\'un campagn', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858))),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Type campagn',
                            hintText: '*Sélectionner le type de campagn',
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
                          value: selectedTypeCampaign,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTypeCampaign = newValue;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: "Annonce",
                              child: Text("Annonce"),
                            ),
                            DropdownMenuItem(
                              value: "Promotion",
                              child: Text("Promotion"),
                            ),
                            DropdownMenuItem(
                              value: "Contenu",
                              child: Text("Contenu"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: "Titre",
                            hintText: '*Entrez le titre du contenu',
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
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextField(
                          controller: contentController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: "Contenu",
                            hintText: '*Decrivez votre contenu',
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
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // Bordures arrondies
                                      side: const BorderSide(color: Color(0xff072858))
                                  ),
                                ),
                                elevation: const WidgetStatePropertyAll(3),
                              ),
                              onPressed: pickFile,
                              icon: const Icon(Icons.attach_file, color: Color(0xff072858))
                          ),
                          const SizedBox(width: 15),
                          selectedFile != null ? Text("Fichier: $selectedFile") : const Text("Aucun fichier sélectionné", style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
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
                        campaigns.add({
                          "index": "${campaigns.length + 1}",
                          "titre": titleController.text,
                          "contenu": contentController.text,
                          "fichier": selectedFile ?? "Aucun fichier sélectionné",
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
class CampaignDataSource extends DataTableSource {
  final List<Map<String, dynamic>> campaigns;
  final BuildContext context;
  final Function() notifyParent;
  final String? selectedTypeCampaign; // Filtrer selon le type de compte

  void _recalculateNumbers() {
    for (int i = 0; i < campaigns.length; i++) {
      campaigns[i]["index"] = "${i + 1}";
    }
  }

  CampaignDataSource(this.campaigns, this.context, this.notifyParent,
      this.selectedTypeCampaign);

  // Filtrer les utilisateurs selon le type de compte sélectionné
  List<Map<String, dynamic>> get filteredUsers {
    if (selectedTypeCampaign == null || selectedTypeCampaign!.isEmpty) {
      return campaigns; // Tous les utilisateurs si aucun filtre n’est appliqué
    }
    return campaigns
        .where((campaign) => campaign["typeCampaign"] == selectedTypeCampaign)
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= filteredUsers.length) return null;
    final campaign = filteredUsers[index];

    return DataRow(
      cells: _buildDataCells(campaign, selectedTypeCampaign),
    );
  }

  List<DataCell> _buildDataCells(Map<String, dynamic> campaign,
      String? selectedTypeCampaign) {
    List<DataCell> cells = [
      DataCell(Text(campaign["index"] ?? "")),
      DataCell(Text(campaign["titre"] ?? "")),
      DataCell(Text(campaign["contenu"] ?? "")),
      DataCell(Text(campaign["fichier"] ?? "")),
      DataCell(Text(campaign["typeCampaign"] ?? "")),
    ];

    // Ajouter des cellules dynamiques selon le type de compte
    if (selectedTypeCampaign == "Annonce" &&
        campaign["typeCampaign"] == "Annonce") {
    } else if (selectedTypeCampaign == "Promotion" &&
        campaign["typeCampaign"] == "Promotion") {
    } else if (selectedTypeCampaign == "Contenu" &&
        campaign["typeCampaign"] == "Contenu") {
    }

    cells.add(DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () => _showCampaignInfo(context, campaign),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.orange),
            onPressed: () => _editCampaignInfo(context, campaign),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _deleteCampaign(context, campaign),
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

  Widget _getTitleShow(String? typeCampaign) {
    if (typeCampaign == 'Annonce') {
      return const Text(
        'Détails de l\'annonce',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      );
    } else if (typeCampaign == 'Promotion') {
      return const Text(
        'Détails de la promotion',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      );
    } else {
      return const Text(
        'Détails du contenu',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      );
    }
  }

  Widget _getTitleEdit(String? typeCampaign) {
    if (typeCampaign == 'Annonce') {
      return const Text('Modifier l\'annonce',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue));
    } else if (typeCampaign == 'Promotion') {
      return const Text(
        'Modifier la promotion',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      );
    } else {
      return const Text(
        'Modifier le contenu',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      );
    }
  }

  Widget _getTitleDelete(String? typeCampaign) {
    if (typeCampaign == 'Annonce') {
      return const Text('Supprimer l\'annonce',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue));
    } else if (typeCampaign == 'Promotion') {
      return const Text(
        'Supprimer la promotion',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      );
    } else {
      return const Text(
        'Supprimer le contenu',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      );
    }
  }

  void _showCampaignInfo(BuildContext context, Map<String, dynamic> campaign) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: _getTitleShow(campaign['typeCampaign']),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Titre : ',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: const Color(0xff072858),
                                fontSize: screenWidth *
                                    (isPortrait ? 0.04 : 0.03),),
                            ),
                            TextSpan(
                              text: '${campaign['titre']}',
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
                              text: 'Contenu : ',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: const Color(0xff072858),
                                fontSize: screenWidth *
                                    (isPortrait ? 0.04 : 0.03),),
                            ),
                            TextSpan(
                              text: '${campaign['contenu']}',
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
                              text: 'Fichier : ',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                color: const Color(0xff072858),
                                fontSize: screenWidth *
                                    (isPortrait ? 0.04 : 0.03),),
                            ),
                            TextSpan(
                              text: '${campaign['Fichier']}',
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
                child: const Text('Fermer', style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),),
              ),
            ],
          ),
    );
  }

  /*List<Widget> _buildCampaignDetails(Map<String, dynamic> campaign) {
    List<Widget> details = [
      Text('Titre: ${campaign['nom']}'),
      Text('Contenu: ${campaign['prenom']}'),
      Text('Fichier: ${campaign['email']}'),
      Text('Type de campaign: ${campaign['typeCampaign']}'),
    ];

    if (campaign["typeCampaign"] == "Annonce") {
    } else if (campaign["typeCampaign"] == "Promotion") {
    } else if (campaign["typeCampaign"] == "Contenu") {
    }

    return details;
  }*/

  void _editCampaignInfo(BuildContext context, Map<String, dynamic> campaign) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController(
        text: '${campaign['titre']}');
    final TextEditingController contentController = TextEditingController(
        text: '${campaign['contenu']}');

    String? selectedFile;

    Future<void> pickFile(void Function(void Function()) setState) async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          selectedFile = result.files.single.name;
        });
      } else {
        // L'utilisateur a annulé la sélection
      }
    }

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    showDialog(
        context: context,
        builder: (context) =>
            StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: _getTitleEdit(campaign['typeCampaign']),
                    content: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      child: Form(
                        key: formKey,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                                child: TextField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    labelText: "Titre",
                                    hintText: '*Entrez le titre de la preuve',
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
                                ),
                              ),
                              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                              SizedBox(
                                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                                child: TextField(
                                  controller: contentController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText: "Contenu",
                                    hintText: '*Decrivez votre preuve',
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
                                ),
                              ),
                              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      style: ButtonStyle(
                                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10), // Bordures arrondies
                                              side: const BorderSide(color: Color(0xff072858))
                                          ),
                                        ),
                                        elevation: const WidgetStatePropertyAll(3),
                                      ),
                                      onPressed: () => pickFile(setState),
                                      icon: const Icon(Icons.attach_file, color: Color(0xff072858))
                                  ),
                                  const SizedBox(width: 15),
                                  selectedFile != null ? Text("Fichier: $selectedFile") : const Text("Aucun fichier sélectionné", style: TextStyle(fontSize: 14),),
                                ],
                              ),
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
                        child: const Text('Enregistrer', style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange)),
                      ),
                    ],
                  );
                }
            )
    );
  }

  void _deleteCampaign(BuildContext context, Map<String, dynamic> campaign) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: _getTitleDelete(campaign['typeCampaign']),
            content: Text(
                'Voulez-vous vraiment supprimer ${campaign['titre']} ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  campaigns.remove(campaign); // Supprimer l'utilisateur
                  _recalculateNumbers(); // Réattribuer les numéros
                  notifyParent(); // Appeler le callback pour notifier le parent
                  Navigator.pop(context);
                },
                child: const Text('Supprimer', style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.red)),
              ),
            ],
          ),
    );
  }
}
