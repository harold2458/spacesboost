import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/contact_entreprise.dart';

class AideEntreprise extends StatefulWidget {
  const AideEntreprise({super.key});

  @override
  State<AideEntreprise> createState() => _AideEntrepriseState();
}

class _AideEntrepriseState extends State<AideEntreprise> {

 

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    
    return Scaffold(
       appBar: AppBar(
          title: const Text('Aide', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFF072858),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Foire Aux Questions (FAQ)',
            style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03), fontWeight: FontWeight.bold, color: Color(0xff072858)),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
          // Liste d'ExpansionTiles pour FAQ
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Vous pouvez nous contacter via l\'email support@entrepriseapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Vous pouvez nous contacter via l\'email support@influenceapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Vous pouvez nous contacter via l\'email support@influenceapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
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
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment modifier mon profil ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                    'Pour modifier votre profil, allez dans les paramètres, '
                        'cliquez sur "Modifier le profil" et apportez vos modifications.', style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment contacter le support ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Vous pouvez nous contacter via l\'email support@entrepriseapp.com '
                          'ou en cliquant sur le bouton "Contact" ci-dessous.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ExpansionTile(
              title: const Text('Comment supprimer mon compte ?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                  child: const Text(
                      'Allez dans "Paramètres", puis "Sécurité", et sélectionnez '
                          '"Supprimer mon compte". Suivez les instructions.', style: TextStyle(fontStyle: FontStyle.italic)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1),),
          // Bouton de contact
          SizedBox(
            width: screenWidth * (isPortrait ? 0.9 : 0.8), // Largeur du bouton ajustée
            height: screenHeight * (isPortrait ? 0.06 : 0.2),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactEntreprise()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contact Support en cours...')),
                );
              },
              icon: const Icon(Icons.email, color: Colors.white,),
              label: Text('Contact', style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03), fontWeight: FontWeight.bold, color: Colors.white),),
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0XFFFCBC1C)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordures arrondies
                  ),
                ),
                elevation: const WidgetStatePropertyAll(3),
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}
