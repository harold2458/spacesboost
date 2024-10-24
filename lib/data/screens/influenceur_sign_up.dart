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
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.15),),
            SizedBox(
              height: isPortrait ? screenHeight * 0.6 : null,
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset('assets/images/forme_jaune3.png', fit: BoxFit.cover)),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.08 : 0.1)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8),
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
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
                        SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.2,
                              height: screenHeight * (isPortrait ? 0.001 : 0.005),
                              decoration: const BoxDecoration(color: Color(0xff072858)),
                            ),
                            SizedBox(width: screenWidth * 0.06),
                            const Text('ou', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            SizedBox(width: screenWidth * 0.06),
                            Container(
                              width: screenWidth * 0.2,
                              height: screenHeight * (isPortrait ? 0.001 : 0.005),
                              decoration: const BoxDecoration(color: Color(0xff072858)),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
                        SizedBox(
                          width: screenWidth * (isPortrait ? 0.9 : 0.8), // Largeur du bouton ajustée
                          height: screenHeight * (isPortrait ? 0.06 : 0.2),
                          child: ElevatedButton.icon(
                            style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(color: Color(0xff072858)),
                                ),
                              ),
                              elevation: WidgetStatePropertyAll(3),
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()))
                            },
                            label: Text(
                              'Google',
                              style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03), fontWeight: FontWeight.bold, color: const Color(0xff072858)),
                            ),
                            icon: Image.asset('assets/images/google_signup.png'),
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
                                MaterialPageRoute(builder: (context) => const InfluenceurSignUpTwo()),
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
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Suivant',
                                    style: TextStyle(
                                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.04)),
                                  const Icon(Icons.arrow_right_alt, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * (isPortrait ? 0 : 0.15),),
                      ],
                    ),
                  ),
                ],
              ),
            )
            //SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.04)),
          ],
        ),
      ),
    );
  }
}