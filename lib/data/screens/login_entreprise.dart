import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/avant_home.dart';
import 'package:projet_mobile/data/screens/home_entrentreprise.dart';
import 'package:projet_mobile/data/screens/register_entreprise.dart';
import 'package:projet_mobile/data/screens/support_entreprise.dart';

class LoginEntreprise extends StatefulWidget {
  const LoginEntreprise({super.key});

  @override
  State<LoginEntreprise> createState() => _LoginEntrepriseState();
}

class _LoginEntrepriseState extends State<LoginEntreprise> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Connexion", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const HomeEntreprise())),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset('assets/images/login2.png', height: 200),
            SizedBox(height: 10),
            Image.asset('assets/logos/logo.png', height: 100),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Connectez-vous avec votre email et mot de passe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
                emailController, "Email", TextInputType.emailAddress),
            SizedBox(height: 20),
            _buildPasswordField(passwordController, "Mot de passe"),
            SizedBox(height: 20),
            _buildSubmitButton(),
            SizedBox(height: 10),
            _buildSignupText(context),
            SizedBox(height: 10),
            _buildSupportText(context),
          ],
        ),
      ),
    );
  }

  // Fonction pour créer un champ de texte standard
  Widget _buildTextField(TextEditingController controller, String label,
      [TextInputType? keyboardType]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }

  // Fonction pour créer un champ de mot de passe
  Widget _buildPasswordField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Fonction pour créer le bouton de soumission
  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff072858),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: TextStyle(fontSize: 18, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () async {
        setState(() {
          isLoading = true; // Activer l'indicateur de chargement
        });

        // Simule une action de connexion, ici un délai de 2 secondes
        await Future.delayed(Duration(seconds: 2));

        setState(() {
          isLoading = false; // Désactiver l'indicateur de chargement
        });

        // Affiche une notification ou un dialogue après la tentative de connexion
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Connexion réussie !')),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AvantHome()));
      },
      child: isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text("Se connecter", style: TextStyle(color: Colors.white)),
    );
  }

  // Fonction pour créer le texte d'inscription
  Widget _buildSignupText(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RegisterEntreprise()));
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Vous n'avez pas de compte ? ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: "Créez un compte",
              style: TextStyle(
                color: Color(0xFF0000FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour créer le texte de support
  Widget _buildSupportText(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SupportEntreprise()));
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Des problèmes de connexion ? ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: "Contacter notre support",
              style: TextStyle(
                color: Color(0xFF0000FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
