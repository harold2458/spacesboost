import 'package:flutter/material.dart';
import 'influenceur_login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de passe oublié', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Image.asset('assets/images/mdpo.png', height: 250,),
            const SizedBox(height: 30,),
            Stack(
              children: [
                Positioned(
                    child: Transform.translate(offset: const Offset(0, -70), child: Image.asset(
                      'assets/images/forme_jaune.png',
                      width: double.infinity,
                      fit: BoxFit.cover, // L'image couvre toute la zone
                    )
                    )
                ),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 60,),
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Mot de passe oublié ? Pas de souci !\nEntrez simplement votre adresse e-mail, et\nnous vous enverrons un lien pour réinitialiser\nvotre mot de passe.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,),
                        ),
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
                        const SizedBox(height: 80.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const InfluenceurLogin()),
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
                            'Envoyer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
