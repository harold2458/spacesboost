import 'package:flutter/material.dart';

class Langues extends StatefulWidget {
  const Langues({super.key});

  @override
  State<Langues> createState() => _LanguesState();
}

class _LanguesState extends State<Langues> {

  String _selectedLanguage = 'francais'; // Langue par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Langues', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(child: RadioListTile<String>(
                  title: const Text('Français'),
                  value: 'francais',
                  activeColor: const Color(0xff072858),
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/francais.png'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: RadioListTile<String>(
                  title: const Text('Anglais'),
                  value: 'anglais',
                  activeColor: const Color(0xff072858),
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/anglais.png'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: RadioListTile<String>(
                  title: const Text('Espagnol'),
                  value: 'espagnol',
                  activeColor: const Color(0xff072858),
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/espagnol.png'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: RadioListTile<String>(
                  title: const Text('Allemand'),
                  value: 'allemand',
                  activeColor: const Color(0xff072858),
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/allemand.png'),
                ),
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Action à réaliser après la sélection
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Langue sélectionnée: $_selectedLanguage'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bordures arrondies
                  ),
                ),
                elevation: const WidgetStatePropertyAll(5),
              ),
              child: const Text('Valider', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ],
        ),
      )
    );
  }
}
