import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projet_mobile/data/screens/Entreprise/budget_entreprise.dart';

class Calendrier extends StatefulWidget {
  const Calendrier({super.key});

  @override
  State<Calendrier> createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  TimeOfDay? _selectedStartTime;
  final TextEditingController _durationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xfffcbc1c), width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xfffcbc1c), width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Icon(icon, color: const Color(0xff072858)),
      ),
      onTap: onTap,
    );
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Add introductory text here
            const Text(
              'Planifiez votre calendrier en sélectionnant la date et l\'heure de début, '
              'ainsi que la durée souhaitée pour l\'événement. Vous pouvez également choisir la date de fin.',
              style: TextStyle(
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Space after the introductory text
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    controller: TextEditingController(
                      text: _selectedStartDate != null
                          ? DateFormat('dd/MM/yyyy').format(_selectedStartDate!)
                          : '',
                    ),
                    label: 'Date de début',
                    hint: 'Sélectionnez la date de début',
                    icon: Icons.calendar_today,
                    readOnly: true,
                    onTap: () => _selectDate(context, isStartDate: true),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: TextEditingController(
                      text: _selectedStartTime != null
                          ? _selectedStartTime!.format(context)
                          : '',
                    ),
                    label: 'Heure de début',
                    hint: 'Sélectionnez l\'heure de début',
                    icon: Icons.access_time,
                    readOnly: true,
                    onTap: () => _selectTime(context),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _durationController,
                    label: 'Durée (en jours)',
                    hint: 'Durée en jours',
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: TextEditingController(
                      text: _selectedEndDate != null
                          ? DateFormat('dd/MM/yyyy').format(_selectedEndDate!)
                          : '',
                    ),
                    label: 'Date de fin',
                    hint: 'Sélectionnez la date de fin',
                    icon: Icons.calendar_today,
                    readOnly: true,
                    onTap: () => _selectDate(context, isStartDate: false),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add space before buttons
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                                MaterialPageRoute(builder: (context) => const BudgetEntreprise()),
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
}
