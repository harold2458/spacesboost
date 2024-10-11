import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/avant_home.dart';
import 'package:projet_mobile/data/screens/home_entrentreprise.dart';
import 'package:projet_mobile/data/screens/login_entreprise.dart';

class RegisterEntreprise extends StatefulWidget {
  const RegisterEntreprise({super.key});

  @override
  State<RegisterEntreprise> createState() => _RegisterEntrepriseState();
}

class _RegisterEntrepriseState extends State<RegisterEntreprise> {
   final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController responsibilityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  void signUp() {
    // Logique d'inscription à implémenter
    print("Inscription réussie");
    // Redirection après inscription
    Navigator.push(context, MaterialPageRoute(builder: (context) =>const AvantHome()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF072858), // Couleur S
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/logos/logo.png',
              height: 100,
            ),
            const SizedBox(height: 20),

            // Image d'inscription
            Image.asset(
              'assets/images/register.png', // Remplacez par votre image
              height: 200,
            ),
            const SizedBox(height: 20),

            // Texte de tagline
            const Text(
              'Nous sommes des technologues de la croissance de votre entreprise et de vos revenus. Rejoignez-nous.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

            // Champs de formulaire
            _buildTextField(firstNameController, 'Nom', false),
            _buildTextField(lastNameController, 'Prénom', false),
            _buildTextField(emailController, 'Email', false),
            _buildTextField(companyNameController, "Nom de l'entreprise", false),
            _buildTextField(responsibilityController, 'Responsabilité', false),
            _buildTextField(phoneNumberController, 'Téléphone', false),
            _buildPasswordField('Mot de passe', passwordController, isPasswordVisible, togglePasswordVisibility),
            _buildPasswordField('Confirmer mot de passe', confirmPasswordController, isConfirmPasswordVisible, toggleConfirmPasswordVisibility),

            const SizedBox(height: 20),

            // Bouton d'inscription
            ElevatedButton(
              onPressed: signUp, // Effectue l'action d'inscription
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Color(0xFF072858), // Couleur Spaceboost pour le bouton
              ),
              child: const Text(
                'S\'inscrire',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Texte pour redirection vers la connexion
            RichText(
              textAlign: TextAlign.center, // Texte centré
              text: TextSpan(
                text: "Déjà un compte ? ",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20, // Taille de police plus grande
                  fontWeight: FontWeight.bold, // Gras
                ),
                children: [
                  TextSpan(
                    text: "Connectez-vous",
                    style: const TextStyle(
                      color: Color(0xFF0000FF),
                      fontSize: 20, // Taille de police plus grande
                      fontWeight: FontWeight.bold, // Gras
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const LoginEntreprise())); // Redirection vers la connexion
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode helper pour créer des champs de texte
  Widget _buildTextField(TextEditingController controller, String labelText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Méthode helper pour créer des champs de mot de passe avec icône de visibilité
  Widget _buildPasswordField(String labelText, TextEditingController textController, bool isVisible, Function() toggleVisibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: textController,
        obscureText: !isVisible,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: toggleVisibility,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
