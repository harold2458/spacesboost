import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/welcome.dart';

import 'influenceur_login.dart';

class InfluenceurSignUpTwo extends StatefulWidget {
  const InfluenceurSignUpTwo({super.key});

  @override
  State<InfluenceurSignUpTwo> createState() => _InfluenceurSignUpTwoState();
}

class _InfluenceurSignUpTwoState extends State<InfluenceurSignUpTwo> {

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.1),),
            Image.asset('assets/images/signin.png', height: screenHeight * (isPortrait ? 0.25 : 0.5),),
            SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.15),),
            Stack(
              children: [
                Positioned.fill(
                    child: Image.asset('assets/images/forme_jaune3.png', fit: BoxFit.cover,),),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              hintText: '*******',
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _confirmPasswordController,
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.08)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Numero utilisateur',
                              hintText: '*+229 60126604',
                              labelStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.phone,
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8), // Largeur du bouton ajustée
                          height: screenHeight * (isPortrait ? 0.06 : 0.2),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Welcome()),
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
                              'S\'inscrire',
                              style: TextStyle(
                                fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1)),
                        Text('Avez-vous deja un compte ?', style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                          color: Colors.white,
                        ),),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        TextButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InfluenceurLogin()),
                          );
                        }, child: Text('Connectez-vous !',
                          style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff072858),
                          ),)),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}