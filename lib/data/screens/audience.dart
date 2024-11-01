import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'calendrier_entreprise.dart';

class Audience extends StatefulWidget {
  const Audience({Key? key}) : super(key: key);

  @override
  State<Audience> createState() => _AudienceState();
}

class _AudienceState extends State<Audience> {
  String _selectedGender = 'Tout';
  double _currentAgeValue = 18;
  String _selectedLocationType = 'Région'; // Variable pour suivre la sélection Région ou Adresse
  String _selectedRegion = 'Sélectionner une région'; // Pour la région sélectionnée
  LatLng _selectedAddressLocation = const LatLng(6.4503024, 2.3468195); // Position initiale sur la carte

  // Domaine d'intervention sélectionné par défaut
  String? _selectedDomaineIntervention;

  // Liste des domaines d'intervention
  final List<String> _domainesIntervention = ['Cuisine', 'Technologie', 'Santé', 'Art', 'Education'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Audience',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff072858),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/logos/icon.jpg',
            height: 300,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              print("Menu icon clicked");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nom de l\'audience',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Entrez le nom de l\'audience',
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color(0xff072858),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Atteindre des personnes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Boutons pour Région et Adresse
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToggleButton("Région", _selectedLocationType == 'Région'),
                  const SizedBox(width: 30),
                  _buildToggleButton("Adresse", _selectedLocationType == 'Adresse'),
                ],
              ),
              const SizedBox(height: 20),

              // Affichage conditionnel selon le choix : Région ou Adresse
              if (_selectedLocationType == 'Région') ...[
                // Section pour sélectionner la région
                const Text(
                  'Localisation par Région',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                _buildRegionDropdown(),
              ] else ...[
                // Section pour sélectionner l'adresse via une carte
                const Text(
                  'Localisation par Adresse',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                _buildAddressMap(),
              ],

              const SizedBox(height: 20),

              // Domaine d'intervention avec Dropdown
              const Text(
                'Domaine d\'intervention',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              _buildDomaineInterventionDropdown(),

              const SizedBox(height: 20),

              // Âge Slider
              const Text(
                'Âge',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                   Text('${_currentAgeValue.round()}'),
                  Expanded(
                    child: Slider(
                      value: _currentAgeValue,
                      min: 18,
                      max: 65,
                      divisions: 47,
                      activeColor: const Color(0xfffcbc1c),
                      onChanged: (double value) {
                        setState(() {
                          _currentAgeValue = value;
                        });
                      },
                    ),
                  ),
                  const Text('65+'),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Sélectionner une audience de moins de 21 ans dans certains lieux peut limiter vos options de ciblage ou mettre vos publicités en pause.',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  // Action pour 'En savoir plus'
                },
                child: const Text(
                  'En savoir plus',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Genre',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildGenderButton('Tout', textColor: Colors.white),
                  const SizedBox(width: 10),
                  _buildGenderButton('Homme', textColor: Colors.white),
                  const SizedBox(width: 10),
                  _buildGenderButton('Femme', textColor: Colors.white),
                ],
              ),
              const SizedBox(height: 30),

              const Text(
                'Definition de l\'audience',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'L\'audience selectionnee est assez vaste.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Row(
                children: [
                  const Text('Restreinte'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor: Colors.grey,
                        valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff072858)),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('vaste'),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff072858),
                      elevation: 5,
                      shadowColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Calendrier()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff072858),
                      elevation: 5,
                      shadowColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Suivant',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedLocationType = text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xff072858) : Colors.grey,
        elevation: 5,
        shadowColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Dropdown pour la sélection de la région
  Widget _buildRegionDropdown() {
    return DropdownButton<String>(
      value: _selectedRegion,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectedRegion = newValue!;
        });
      },
      items: <String>[
        'Sélectionner une région',
        'Abomey-Calavi',
        'Tankpe',
        'Zopah',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  // Carte pour la localisation par adresse
  Widget _buildAddressMap() {
    return SizedBox(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _selectedAddressLocation,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          // Stocke le contrôleur de la carte si nécessaire
        },
        onTap: (LatLng location) {
          setState(() {
            _selectedAddressLocation = location;
          });
        },
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('selected_location'),
            position: _selectedAddressLocation,
          ),
        },
      ),
    );
  }

  // Dropdown pour le domaine d'intervention
  Widget _buildDomaineInterventionDropdown() {
    return DropdownButton<String>(
      value: _selectedDomaineIntervention,
      hint: const Text('Sélectionner un domaine'),
      isExpanded: true, // Pour occuper toute la largeur
      items: _domainesIntervention.map((String domaine) {
        return DropdownMenuItem<String>(
          value: domaine,
          child: Text(domaine),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedDomaineIntervention = newValue;
        });
      },
    );
  }

  Widget _buildGenderButton(String text, {required Color textColor}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedGender = text;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
          _selectedGender == text ? const Color(0xfffcbc1c) : Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
