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

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Langues', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
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
                CircleAvatar(
                  radius: screenWidth * (isPortrait ? 0.06 : 0.04),
                  backgroundImage: const AssetImage('assets/images/francais.png'),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
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
                CircleAvatar(
                  radius: screenWidth * (isPortrait ? 0.06 : 0.04),
                  backgroundImage: const AssetImage('assets/images/anglais.png'),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
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
                CircleAvatar(
                  radius: screenWidth * (isPortrait ? 0.06 : 0.04),
                  backgroundImage: const AssetImage('assets/images/espagnol.png'),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
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
                CircleAvatar(
                  radius: screenWidth * (isPortrait ? 0.06 : 0.04),
                  backgroundImage: const AssetImage('assets/images/allemand.png'),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.2 : 0.2),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8), // Largeur du bouton ajustée
              height: screenHeight * (isPortrait ? 0.06 : 0.2),
              child: ElevatedButton(
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
                      borderRadius: BorderRadius.circular(10), // Bordures arrondies
                    ),
                  ),
                  elevation: const WidgetStatePropertyAll(3),
                ),
                child: Text('Valider', style: TextStyle(
                  fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            )
          ],
        ),
      )
    );
  }
}
