import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/login_entreprise.dart';

class ProfileType extends StatefulWidget {
  const ProfileType({super.key});

  @override
  State<ProfileType> createState() => _ProfileTypeState();
}

class _ProfileTypeState extends State<ProfileType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logos/logo.png',
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Veuillez choisir le type de profil :',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigation vers la page Entreprise
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const LoginEntreprise()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bordures arrondies
                      ),
                      minimumSize: Size(200, 50),
                    ),
                    child: Text('Entreprise', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigation vers la page Influenceur
                      Navigator.pushNamed(context, '/influenceur');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfffcbc1c),
                      foregroundColor: Color(0xff072858),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bordures arrondies
                      ),
                      minimumSize: Size(200, 50),
                    ),
                    child: Text('Influenceur', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}