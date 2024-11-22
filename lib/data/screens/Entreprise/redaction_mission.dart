import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/validation_commande.dart';

class RedactionMission extends StatefulWidget {
  const RedactionMission({super.key});

  @override
  State<RedactionMission> createState() => _RedactionMissionState();
}

class _RedactionMissionState extends State<RedactionMission> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productBenefitsController = TextEditingController();
  final TextEditingController _publicationCountController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _contractDurationController = TextEditingController();

  // Variable pour gérer le fichier sélectionné
  String? _mediaFile;

  final double tvaRate = 0.18; // TVA de 18%

  // Calculer la TVA et le total avec TVA
  double get budget => double.tryParse(_budgetController.text) ?? 0;
  double get tva => budget * tvaRate;
  double get totalWithTva => budget + tva;

  // Méthode pour choisir le média
  void _pickMedia() {
    // Ajoutez la logique pour sélectionner un fichier ici
    // Par exemple, utilisez un package comme `file_picker`
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Redaction de mission',
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  'Remplissez les informations de votre mission',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    color: const Color(0xff072858),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // Nom de l'entreprise
              _buildFormField(
                controller: _companyNameController,
                label: 'Nom de l\'entreprise',
                hint: 'ISMAT',
                icon: Icons.business,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Description
              _buildFormField(
                controller: _productDescriptionController,
                label: 'Description',
                hint: 'Entreprise spécialisée dans la production de jus d\'ananas',
                icon: Icons.description,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Nom du produit
              _buildFormField(
                controller: _productNameController,
                label: 'Nom du produit',
                hint: 'Ananas',
                icon: Icons.label,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Avantages du produit
              _buildFormField(
                controller: _productBenefitsController,
                label: 'Avantages du produit',
                hint: 'Facilite la digestion',
                icon: Icons.check_circle,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Nombre de publications
              _buildFormField(
                controller: _publicationCountController,
                label: 'Nombre de publications',
                hint: '10',
                icon: Icons.format_list_numbered,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Sélection de fichier
              GestureDetector(
                onTap: _pickMedia,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 350,
                    child: Row(
                    children: [
                      const Icon(Icons.attach_file, color: Colors.grey),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _mediaFile ?? 'Aucun fichier sélectionné',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      if (_mediaFile != null)
                        IconButton(
                          icon: const Icon(Icons.clear, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _mediaFile = null;
                            });
                          },
                        ),
                    ],
                  ),
                  )
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Durée du contrat
              _buildFormField(
                controller: _contractDurationController,
                label: 'Durée du contrat',
                hint: '6 mois',
                icon: Icons.timer,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Budget
              _buildFormField(
                controller: _budgetController,
                label: 'Budget (F)',
                hint: '2000',
                icon: Icons.monetization_on,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: screenHeight * 0.05),

              // Affichage de la TVA et du total
              Text(
                'TVA (18%): ${tva.toStringAsFixed(0)} F',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Total avec TVA: ${totalWithTva.toStringAsFixed(0)} F',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.05),

              // Boutons d'action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    label: 'Annuler',
                    onPressed: () => Navigator.pop(context),
                    color: const Color(0xfffcbc1c),
                  ),
                  _buildActionButton(
                    label: 'Suivant',
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ValidationCommande()),
                        );
                    },
                    color: const Color(0xfffcbc1c),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xff072858)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xff072858)),
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
    );
  }
}
