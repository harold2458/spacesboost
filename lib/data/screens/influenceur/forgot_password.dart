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

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de passe oublié', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * (isPortrait ? 0.01 : 0.1),),
            Image.asset('assets/images/mdpo.png', height: screenHeight * (isPortrait ? 0.3 : 0.5),),
            //SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            Stack(
              children: [
                Positioned(
                    child: Transform.translate(offset: Offset(0, screenHeight * (isPortrait ? 0 : 0.1)), child: Image.asset(
                      'assets/images/forme_jaune3.png',
                      width: double.infinity,
                      height: isPortrait ?  null : screenHeight * 1.1,
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.13 : 0.17),),
                        const Text('Mot de passe oublié ? Pas de souci !\nEntrez simplement votre adresse e-mail, et\nnous vous enverrons un lien pour réinitialiser\nvotre mot de passe.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,),
                        SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1),),
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.07 : 0.1),),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
                          height: screenHeight * (isPortrait ? 0.07 : 0.2),
                          child: ElevatedButton(
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
                                  borderRadius: BorderRadius.circular(10), // Bordures arrondies
                                ),
                              ),
                              elevation: const WidgetStatePropertyAll(3),
                            ),
                            child: Text(
                              'Envoyer',
                              style: TextStyle(
                                fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
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
