import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_mobile/data/screens/calendrier_entreprise.dart';

class Audience extends StatefulWidget {
  const Audience({Key? key}) : super(key: key);

  @override
  State<Audience> createState() => _AudienceState();
}

class _AudienceState extends State<Audience> {
  String _selectedGender = 'Tout';
  double _currentAgeValue = 18;
  String _selectedLocationType = 'Région';
  String _selectedRegion = 'Sélectionner une région';
  LatLng _selectedAddressLocation = const LatLng(6.4503024, 2.3468195);
  String? _selectedDomaineIntervention;
  int _audienceReach = 1000; // Nombre de personnes touchées

  final List<String> _domainesIntervention = ['Cuisine', 'Technologie', 'Santé', 'Art', 'Education'];
  final List<String> _regions = ['Sélectionner une région', 'Région 1', 'Région 2', 'Région 3', 'Région 4'];

  String audienceType = 'Audience générale';
  double audienceProgress = 0.5;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('Atteindre des personnes', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToggleButton("Région", _selectedLocationType == 'Région'),
                  const SizedBox(width: 30),
                  _buildToggleButton("Adresse", _selectedLocationType == 'Adresse'),
                ],
              ),
              const SizedBox(height: 40),
              if (_selectedLocationType == 'Région') ...[
                const Text('Localisation par Région', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 20),
                _buildRegionDropdown(),
              ] else ...[
                const Text('Localisation par Adresse', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 20),
                _buildAddressMap(),
              ],
              const SizedBox(height: 30),
              const Text('Domaine d\'intervention', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              _buildDomaineInterventionDropdown(),
              const SizedBox(height: 20),
              const Text('Âge', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                          _updateAudienceProgress();
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
                child: const Text('En savoir plus', style: TextStyle(color: Color(0xff072858), fontSize: 14)),
              ),
              const SizedBox(height: 30),
              const Text('Genre', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildGenderButton('Tout'),
                  const SizedBox(width: 10),
                  _buildGenderButton('Homme'),
                  const SizedBox(width: 10),
                  _buildGenderButton('Femme'),
                ],
              ),
              const SizedBox(height: 30),
              const Text('Combien de personnes souhaitez-vous toucher ?', style: TextStyle( fontSize: 18)),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nombre de personnes',
                ),
                onChanged: (value) {
                  setState(() {
                    _audienceReach = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 30),
              const Text('Définition de l\'audience', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('L\'audience sélectionnée est $audienceType.', style: const TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 10),
              Row(
                children: [
                const Text('Restreinte'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: audienceProgress,
                        backgroundColor: Colors.grey,
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xfffcbc1c)),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('Vaste'),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xff072858),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
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
                                MaterialPageRoute(builder: (context) => const Calendrier()),
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

  void _updateAudienceProgress() {
    if (_currentAgeValue < 24) {
      audienceProgress = 0.2;
      audienceType = 'Restreinte';
    } else if (_currentAgeValue <= 40) {
      audienceProgress = 0.5;
      audienceType = 'Moyenne';
    } else {
      audienceProgress = 0.8;
      audienceType = 'Vaste';
    }
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLocationType = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ?  Color(0xff072858) : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildGenderButton(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
          _updateAudienceProgress();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: _selectedGender == gender ?  Color(0xff072858) : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(gender, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildRegionDropdown() {
    return DropdownButton<String>(
      value: _selectedRegion,
      items: _regions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedRegion = newValue!;
          _updateAudienceProgress();
        });
      },
    );
  }

  Widget _buildDomaineInterventionDropdown() {
    return DropdownButton<String>(
      hint: const Text('Sélectionner un domaine'),
      value: _selectedDomaineIntervention,
      onChanged: (String? newValue) {
        setState(() {
          _selectedDomaineIntervention = newValue;
        });
      },
      items: _domainesIntervention.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildAddressMap() {
    return Container(
      height: 200,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _selectedAddressLocation,
          zoom: 15,
        ),
        onTap: (LatLng location) {
          setState(() {
            _selectedAddressLocation = location;
          });
        },
        markers: {
          Marker(
            markerId: const MarkerId("selected-location"),
            position: _selectedAddressLocation,
          ),
        },
      ),
    );
  }
}
