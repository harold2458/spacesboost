import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/avant_home.dart';
import 'package:projet_mobile/data/screens/home_entrentreprise.dart';
import 'package:projet_mobile/data/screens/register_entreprise.dart';
import 'package:projet_mobile/data/screens/welcome.dart';

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
        backgroundColor: const Color(0xff072858),
        title: Text(
          "Connexion",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const Welcome())),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/sign In.png', height: 200),
            Image.asset('assets/logos/logo.png', height: 100),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Connectez-vous ",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30), // Augmenter l'espacement ici
            _buildTextField(emailController, "Email", TextInputType.emailAddress),
            const SizedBox(height: 10),
            _buildPasswordField(passwordController, "Mot de passe"),
            const SizedBox(height: 20),
            _buildSubmitButton(), // Bouton personnalisé
            const SizedBox(height: 10),
            _buildSignupText(context), // Texte d'inscription centré
            const SizedBox(height: 10),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Bord arrondi
        ),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Bord arrondi
        ),
      ),
    );
  }

  // Fonction pour créer le bouton de soumission avec dégradé et même taille que le TextField
  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity, // Même largeur que les champs de texte
      height: 60, // Hauteur pour correspondre à la taille du TextField
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.yellow, Colors.orange], // Dégradé jaune
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(fontSize: 18, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent, // Pour éviter de couvrir le dégradé
        ),
        onPressed: () async {
          setState(() {
            isLoading = true; // Activer l'indicateur de chargement
          });

          // Simule une action de connexion, ici un délai de 2 secondes
          await Future.delayed(const Duration(seconds: 2));

          setState(() {
            isLoading = false; // Désactiver l'indicateur de chargement
          });

          // Affiche une notification ou un dialogue après la tentative de connexion
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Connexion réussie !')),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Welcome()));
        },
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("Se connecter", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  // Fonction pour créer le texte d'inscription
  Widget _buildSignupText(BuildContext context) {
    return Center( // Ajout d'un Center ici
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegisterEntreprise()));
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
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
                  color: Color(0xFF072858),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}