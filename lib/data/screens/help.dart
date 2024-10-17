import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/contact.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Aide', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
    centerTitle: true,
    backgroundColor: const Color(0XFFFCBC1C),
    leading: IconButton(onPressed: () {
      Navigator.of(context).pop();
    }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Foire Aux Questions (FAQ)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff072858)),
          ),
          const SizedBox(height: 20),
          // Liste d'ExpansionTiles pour FAQ
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Vous pouvez nous contacter via l\'email support@influenceapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Vous pouvez nous contacter via l\'email support@influenceapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Vous pouvez nous contacter via l\'email support@influenceapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Vous pouvez nous contacter via l\'email support@influenceapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const ExpansionTile(
              title: Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Bouton de contact
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Contact()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contact Support en cours...')),
                );
              },
              icon: const Icon(Icons.email, color: Colors.white,),
              label: const Text('Contact', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bordures arrondies
                  ),
                ),
                elevation: const WidgetStatePropertyAll(5),
              ),
          ),)
        ],
      ),
    ),
    );
  }
}
