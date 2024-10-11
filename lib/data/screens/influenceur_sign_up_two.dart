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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/signin.png', height: 230,),
            const SizedBox(height: 20,),
            Stack(
              children: [
                Positioned.fill(
                    child: Image.asset('assets/images/forme_jaune.png', fit: BoxFit.cover,)),
                SizedBox(
                  width: double.infinity,
                  height: 510,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 15,),
                        SizedBox(
                          width: 310,
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
                        const SizedBox(height: 70.0),
                        SizedBox(
                          width: 310,
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
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: 310,
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
                        const SizedBox(height: 30.0),
                        ElevatedButton(
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
                                borderRadius: BorderRadius.circular(20), // Bordures arrondies
                              ),
                            ),
                            elevation: const WidgetStatePropertyAll(5),
                          ),
                          child: const Text(
                            'S\'inscrire',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        const Text('Avez-vous deja un compte ?', style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),),
                        const SizedBox(height: 10.0),
                        TextButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InfluenceurLogin()),
                          );
                        }, child: const Text('Connectez-vous !',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858),
                          ),)),
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