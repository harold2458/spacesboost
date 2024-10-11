import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur_login.dart';

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
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logos/logo.png',
            height: 100,
          ),
          const SizedBox(height: 170),
          const Text(
            'Veuillez choisir le type de profil',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
            },
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bordures arrondies
                ),),
                elevation: const WidgetStatePropertyAll(5),
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 55, vertical: 15))
            ),
            child: const Text('Entreprise', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InfluenceurLogin()));
            },
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Bordures arrondies
              ),),
              elevation: const WidgetStatePropertyAll(5),
              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50, vertical: 15))
            ),
            child: const Text('Influenceur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}