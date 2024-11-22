import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur/forgot_password.dart';
import 'before_home.dart';
import 'influenceur_sign_up.dart';

class InfluenceurLogin extends StatefulWidget {
  const InfluenceurLogin({super.key});

  @override
  State<InfluenceurLogin> createState() => _InfluenceurLoginState();
}

class _InfluenceurLoginState extends State<InfluenceurLogin> {

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
      appBar: AppBar(
        title: const Text('Connexion', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.1),),
            Image.asset('assets/images/login.png', height: screenHeight * (isPortrait ? 0.25 : 0.5),),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.2),),
            Stack(
              children: [
                Positioned.fill(
                    child: Transform.translate(offset: Offset(0, screenHeight * (isPortrait ? 0 : 0.2)), child: Image.asset(
                      'assets/images/forme_jaune3.png',
                      fit: BoxFit.cover, // L'image couvre toute la zone
                    ),)
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(child: Text('Bienvenue à nouveau !',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.05 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff072858),
                        ),
                        textAlign: TextAlign.center,
                      ),),
                      SizedBox(height: screenHeight * (isPortrait ? 0.12 : 0.3),),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email utilisateur',
                            hintText: '*example@gmail.com',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xff072858),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xff072858)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xff072858)),
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
                      SizedBox(height: screenHeight * (isPortrait ? 0.015 : 0.08),),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            hintText: '*******',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xff072858),
                            ),
                            suffixIcon: IconButton(onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }, icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xff072858)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xff072858)),
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
                      SizedBox(height: screenHeight * (isPortrait ? 0.015 : 0.08),),
                      TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPassword()),
                        );
                      }, child: Text('Mot de passe oublié ?',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),)),
                      SizedBox(height: screenHeight * (isPortrait ? 0.015 : 0.08),),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        height: screenHeight * (isPortrait ? 0.07 : 0.2),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BeforeHome()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Bordures arrondies
                              ),
                            ),
                            elevation: const WidgetStatePropertyAll(3),
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
                      SizedBox(height: screenHeight * (isPortrait ? 0.015 : 0.08),),
                      TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const InfluenceurSignUp()),
                        );
                      }, child: Text('Inscrivez-vous',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),)),
                      SizedBox(height: screenHeight * (isPortrait ? 0.015 : 0.08),),
                      SizedBox(
                        width: screenWidth * (isPortrait ? 0.9 : 0.8),
                        height: screenHeight * (isPortrait ? 0.06 : 0.2),
                        child: ElevatedButton.icon(
                          style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                side: BorderSide(color: Color(0xff072858)),
                              ),
                            ),
                            elevation: WidgetStatePropertyAll(3),
                          ),
                          onPressed: () => {},
                          label: Text(
                            'Google',
                            style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03), fontWeight: FontWeight.bold, color: const Color(0xff072858)),
                          ),
                          icon: Image.asset('assets/images/google_signup.png'),
                        ),
                      ),
                      SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.15),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

