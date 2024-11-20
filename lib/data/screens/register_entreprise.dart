import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/login_entreprise.dart';
import 'package:projet_mobile/data/screens/welcome_entreprise.dart';

class RegisterEntreprise extends StatefulWidget {
  const RegisterEntreprise({super.key});

  @override
  State<RegisterEntreprise> createState() => _RegisterEntrepriseState();
}

class _RegisterEntrepriseState extends State<RegisterEntreprise> {
  final _formKey = GlobalKey<FormState>();
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
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeEntreprise()),
      );
    }
  }

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
          "Inscription",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginEntreprise())),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/sign_Up_2.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Nous sommes des technologues de la croissance de votre entreprise et de vos revenus. Rejoignez-nous.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Nom',
                        prefixIcon: const Icon(Icons.person, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Prénom',
                        prefixIcon: const Icon(Icons.person, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email utilisateur',
                        prefixIcon: const Icon(Icons.email, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: companyNameController,
                      decoration: InputDecoration(
                        labelText: 'Nom de l\'entreprise',
                        prefixIcon: const Icon(Icons.business, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: responsibilityController,
                      decoration: InputDecoration(
                        labelText: 'Responsabilité',
                        prefixIcon: const Icon(Icons.assignment_ind, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Téléphone',
                        prefixIcon: const Icon(Icons.phone, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: const Icon(Icons.lock, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xfffcbc1c),
                          ),
                          onPressed: togglePasswordVisibility,
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirmer le mot de passe',
                        prefixIcon: const Icon(Icons.lock, color: Color(0xfffcbc1c)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xfffcbc1c)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xfffcbc1c),
                          ),
                          onPressed: toggleConfirmPasswordVisibility,
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Ce champ est obligatoire' : null,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.9 : 0.8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeEntreprise()),
                        );
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff072858),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('S\'inscrire', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      text: 'Vous avez déjà un compte? ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Connectez-vous',
                          style: const TextStyle(color: Color(0xff072858), fontSize: 16, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginEntreprise()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
