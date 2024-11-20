import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/avant_home.dart';
import 'package:projet_mobile/data/screens/welcome_entreprise.dart';
import 'package:projet_mobile/data/screens/register_entreprise.dart';

class LoginEntreprise extends StatefulWidget {
  const LoginEntreprise({super.key});

  @override
  State<LoginEntreprise> createState() => _LoginEntrepriseState();
}

class _LoginEntrepriseState extends State<LoginEntreprise> {
  bool isLoading = false;
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff072858),
        title: const Text(
          "Connexion",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context) => const AvantHome())),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/sign In.png', height: 200),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Connectez-vous ",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email utilisateur',
                        hintText: '*example@gmail.com',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xfffcbc1c),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.1),
                  ),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        hintText: '*******',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xfffcbc1c),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Ce champ est obligatoire'
                            : null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.05), // Espacement réduit
                  ),
                  TextButton(
                      onPressed: () {
                        // Action pour mot de passe oublié
                      },
                      child: Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff072858),
                        ),
                      )),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.05 : 0.05), // Espacement ajusté
                  ),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    height: screenHeight * (isPortrait ? 0.07 : 0.2),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AvantHome()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color(0xff072858),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        elevation: WidgetStatePropertyAll(3),
                      ),
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * (isPortrait ? 0.03 : 0.08), // Espacement ajouté ici
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
