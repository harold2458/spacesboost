import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/influenceur_sign_up_two.dart';
import 'package:projet_mobile/data/screens/welcome.dart';

class InfluenceurSignUp extends StatefulWidget {
  const InfluenceurSignUp({super.key});

  @override
  State<InfluenceurSignUp> createState() => _InfluenceurSignUpState();
}

class _InfluenceurSignUpState extends State<InfluenceurSignUp> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              labelText: 'Nom utilisateur',
                              hintText: '*Entrez votre nom',
                              labelStyle: const TextStyle(color: Colors.grey),
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.person,
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
                        const SizedBox(height: 70.0),
                        SizedBox(
                          width: 310,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              labelText: 'Prénom utilisateur',
                              hintText: '*Entrez votre prénom',
                              labelStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.person,
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
                        const SizedBox(height: 20.0),
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
                        const SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 0.7,
                              decoration: const BoxDecoration(color: Color(0xff072858)),
                            ),
                            const SizedBox(width: 10.0),
                            const Text('ou', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 100.0,
                              height: 0.7,
                              decoration: const BoxDecoration(color: Color(0xff072858)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
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
                          onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()))
                          },
                          label: const Text(
                            'Google',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),
                          ),
                          icon: Image.asset('assets/images/google_signup.png'),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const InfluenceurSignUpTwo()),
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
                          child: const SizedBox(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Suivant',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_right_alt, color: Colors.white),
                              ],
                            ),
                          ),
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