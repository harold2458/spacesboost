import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/validation_commande.dart';

class RedactionMission extends StatefulWidget {
  const RedactionMission({super.key});

  @override
  State<RedactionMission> createState() => _RedactionMissionState();
}

class _RedactionMissionState extends State<RedactionMission> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productBenefitsController = TextEditingController();
  final TextEditingController _publicationCountController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _imageOrVideoController = TextEditingController();
  final TextEditingController _contractDurationController = TextEditingController();

  double tvaRate = 0.18; // TVA de 18%
  
  // Calculer la TVA et le total avec TVA
  double get budget => double.tryParse(_budgetController.text) ?? 0;
  double get tva => budget * tvaRate;
  double get totalWithTva => budget + tva;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rédaction de Mission', style: TextStyle( color: Colors.white)),
         backgroundColor: const Color(0xff072858),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Remplissez les informations de votre mission',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * (isPortrait ? 0.05 : 0.03),                        color: const Color(0xff072858),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1)),
                  _buildTextField(
                    controller: _companyNameController,
                    label: 'Nom de l\'entreprise',
                    hint: 'ISMAT',
                    icon: Icons.business,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _productDescriptionController,
                    label: 'Description',
                    hint: 'Entreprise spécialisée dans la production de jus d\'ananas',
                    icon: Icons.description,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _productNameController,
                    label: 'Nom du produit',
                    hint: 'Ananas',
                    icon: Icons.label,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _productBenefitsController,
                    label: 'Avantages du produit',
                    hint: 'Facilite la digestion',
                    icon: Icons.check_circle,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _publicationCountController,
                    label: 'Nombre de publications',
                    hint: '10',
                    icon: Icons.format_list_numbered,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _imageOrVideoController,
                    label: 'Fichier image ou vidéo',
                    hint: 'Nom du fichier ou lien',
                    icon: Icons.image,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _contractDurationController,
                    label: 'Durée du contrat',
                    hint: 'Ex. : 6 mois',
                    icon: Icons.timer,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                  _buildTextField(
                    controller: _budgetController,
                    label: 'Budget (F)',
                    hint: 'Montant du budget',
                    icon: Icons.monetization_on,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1)),

                  // Affichage de la TVA et du total avec TVA
                  Text(
                    'TVA (18%): ${tva.toStringAsFixed(0)} F',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Total avec TVA: ${totalWithTva.toStringAsFixed(0)} F',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1)),

                  Container(
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
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.cancel),
                          label: const Text('Annuler'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ValidationCommande()),
                              );
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Suivant'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: const Color(0xfffcbc1c)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff072858)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff072858)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
