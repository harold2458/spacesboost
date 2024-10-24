import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/budget.dart';
import 'package:intl/intl.dart';

class Calendrier extends StatefulWidget {
  const Calendrier({super.key});

  @override
  State<Calendrier> createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {
  // Variables pour stocker les dates et heures
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  TimeOfDay? _selectedStartTime;

  final TextEditingController _durationController = TextEditingController();

  // Méthode pour sélectionner la date
  Future<void> _selectDate(BuildContext context, {required bool isStartDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _selectedStartDate = picked;
        } else {
          _selectedEndDate = picked;
        }
      });
    }
  }

  // Méthode pour sélectionner l'heure
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedStartTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendrier',
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
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              print("Menu icon clicked");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date de début
            const Text(
              'Date de début',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _selectedStartDate != null
                    ? DateFormat('dd/MM/yyyy').format(_selectedStartDate!)
                    : 'Sélectionnez la date de début',
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.calendar_today), // Icône pour la date
              ),
              onTap: () => _selectDate(context, isStartDate: true),
            ),
            const SizedBox(height: 20),

            // Heure de début
            const Text(
              'Heure de début',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _selectedStartTime != null
                    ? _selectedStartTime!.format(context)
                    : 'Sélectionnez l\'heure de début',
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.access_time), // Icône pour l'heure
              ),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(height: 20),

            // Durée en jours
            const Text(
              'Durée (en jours)',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _durationController,
              decoration: const InputDecoration(
                hintText: 'Durée en jours',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today), // Icône pour la durée
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Date de fin
            const Text(
              'Date de fin',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _selectedEndDate != null
                    ? DateFormat('dd/MM/yyyy').format(_selectedEndDate!)
                    : 'Sélectionnez la date de fin',
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.calendar_today), // Icône pour la date
              ),
              onTap: () => _selectDate(context, isStartDate: false),
            ),
            const SizedBox(height: 20),
            const Spacer(),

            // Boutons Annuler et Continuer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bouton Annuler
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.amber], // Dégradé jaune
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10), // Bord arrondi
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Transparente pour afficher le dégradé
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bord arrondi
                        ),
                      ),
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Bouton Continuer
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.amber], // Dégradé jaune
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10), // Bord arrondi
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Budget()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Transparente pour afficher le dégradé
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bord arrondi
                        ),
                      ),
                      child: const Text(
                        'Continuer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
