import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/forgot_password.dart';
import 'package:projet_mobile/data/screens/welcome.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Image.asset('assets/images/login.png', height: 230,),
            const SizedBox(height: 40,),
            Stack(
              children: [
                Positioned.fill(
                    child: Transform.translate(offset: const Offset(0, -40), child: Image.asset(
                      'assets/images/forme_jaune.png',
                      fit: BoxFit.cover, // L'image couvre toute la zone
                    ),)
                ),
                SizedBox(
                  width: double.infinity,
                  height: 510,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Center(child: Text('Bienvenue à nouveau !',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858),
                          ),
                          textAlign: TextAlign.center,
                        ),),
                        const SizedBox(height: 60,),
                        SizedBox(
                          width: 310,
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
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: 310,
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
                        const SizedBox(height: 10.0),
                        TextButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgotPassword()),
                          );
                        }, child: const Text('Mot de passe oublié ?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),)),
                        const SizedBox(height: 10.0),
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
                              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 10))
                          ),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InfluenceurSignUp()),
                          );
                        }, child: const Text('Inscrivez-vous',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),)),
                        const SizedBox(height: 10.0),
                        ElevatedButton.icon(
                          style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                side: BorderSide(color: Color(0xff072858)),
                              ),
                            ),
                            elevation: WidgetStatePropertyAll(5),
                          ),
                          onPressed: () => {},
                          label: const Text(
                            'Google',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),
                          ),
                          icon: Image.asset('assets/images/google_signup.png'),
                        ),
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

