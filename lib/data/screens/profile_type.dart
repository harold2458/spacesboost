import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/admin_login.dart';
import 'package:projet_mobile/data/screens/influenceur_login.dart';

class ProfileType extends StatefulWidget {
  const ProfileType({super.key});

  @override
  State<ProfileType> createState() => _ProfileTypeState();
}

class _ProfileTypeState extends State<ProfileType> {

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(),
       body: SingleChildScrollView(
         padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1)),
         child: Center(
           child: Column(
             children: [
               SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.2)),
               Image.asset(
                 'assets/logos/logo.png',
               ),
               SizedBox(height: screenHeight * (isPortrait ? 0.2 : 0.2)),
               Text(
                 'Veuillez choisir le type de profil',
                 style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.05 : 0.03)),
               ),
               SizedBox(height: screenHeight * (isPortrait ? 0.08 : 0.2)),
               SizedBox(
                 width: double.infinity, // Largeur du bouton ajustée
                 height: screenHeight * (isPortrait ? 0.07 : 0.2),
                 child: ElevatedButton(
                   onPressed: () {
                   },
                   style: ButtonStyle(
                     backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10), // Bordures arrondies
                     ),),
                     elevation: const WidgetStatePropertyAll(3),
                   ),
                   child: Text('Entreprise', style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.05 : 0.03), fontWeight: FontWeight.bold, color: Colors.white)),
                 ),
               ),
               SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.06)),
               SizedBox(
                 width: double.infinity, // Largeur du bouton ajustée
                 height: screenHeight * (isPortrait ? 0.07 : 0.2),
                 child: ElevatedButton(
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const InfluenceurLogin()));
                   },
                   style: ButtonStyle(
                     backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10), // Bordures arrondies
                     ),),
                     elevation: const WidgetStatePropertyAll(3),
                   ),
                   child: Text('Influenceur', style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.05 : 0.03), fontWeight: FontWeight.bold, color: Colors.white)),
                 ),
               ),
               SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.6)),
               SizedBox(
                 width: double.infinity, // Largeur du bouton ajustée
                 height: screenHeight * (isPortrait ? 0.07 : 0.2),
                 child: ElevatedButton(
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLogin()));
                   },
                   style: ButtonStyle(
                     backgroundColor: const WidgetStatePropertyAll(Colors.white),
                     side: const WidgetStatePropertyAll(BorderSide(color: Color(0xff072858))),
                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     ),
                     elevation: const WidgetStatePropertyAll(3),
                   ),
                   child: Text('Admin', style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.05 : 0.03), fontWeight: FontWeight.bold, color: const Color(0xff072858))),
                 ),
               ),
               SizedBox(height: isPortrait ? screenHeight * 0 : screenHeight * 0.1)
             ],
           ),
         ),
       )
    );
  }
}