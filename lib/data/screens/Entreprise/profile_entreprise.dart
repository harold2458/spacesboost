import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/EditProfile.dart';
import 'package:projet_mobile/data/screens/Entreprise/performance_entreprise.dart';

class ProfileEntreprise extends StatefulWidget {
  const ProfileEntreprise({super.key});

  @override
  State<ProfileEntreprise> createState() => _ProfilState();
}

class _ProfilState extends State<ProfileEntreprise> {

   bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

   void _submitForm() {
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
       appBar: AppBar(
          title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0xff072858),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(
            children: [
              CircleAvatar(
                radius: screenWidth * (isPortrait ? 0.2 : 0.1),
                backgroundImage: const AssetImage('assets/images/profil.jpg'),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff072858)
                  ),
                  width: screenWidth * (isPortrait ? 0.6 : 0.5),
                  height: screenHeight * (isPortrait ? 0.001 : 0.002),
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.04 : 0.02)),
                child: Column(
                  children: [
                    Row(
                        children: [
                          RichText(
                              text: TextSpan(
                                style: const TextStyle(fontFamily: 'Poppins'),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Nom de l’utilisateur : ',
                                    style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff072858)),
                                  ),
                                  const TextSpan(
                                      text: 'Harold DIDAVI',
                                      style: TextStyle(color: Colors.black,)
                                  ),
                                ],
                              )),
                        ]
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'Poppins'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Email de l’utilisateur : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                TextSpan(
                                    text: 'harolddidavi@gmail.com',
                                    style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.02 : 0.02), color: Colors.black,)
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'Poppins'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Numéro de l’utilisateur : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: '+229 96483527',
                                    style: TextStyle(color: Colors.black,)
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'Poppins'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Role  : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: 'Developpeur',
                                    style: TextStyle(color: Colors.black,)
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'Poppins'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Nom de l\'entreprise : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: 'Harold Tech ',
                                    style: TextStyle(color: Colors.black,)
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'Poppins'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Pays de l’utilisateur : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: 'Bénin',
                                    style: TextStyle(color: Colors.black,)
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'Poppins'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Ville de l’utilisateur : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: 'Abomey-Calavi',
                                    style: TextStyle(color: Colors.black,)
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.15),),
              SizedBox(
                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                height: screenHeight * (isPortrait ? 0.07 : 0.2),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Editprofile()),
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
                    'Modifier le profile',
                    style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.15),),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XFFFCBC1C)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height: screenHeight * (isPortrait ? 0.32 : 0.9),
                  ),
                  Transform.translate(offset: Offset(screenWidth * (isPortrait ? 0.1 : 0.1), -screenHeight * (isPortrait ? 0.03 : 0.08)),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xfff7f7fd)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.03), vertical: screenHeight * (isPortrait ? 0.01 : 0.02)),
                      child: Text('Changement du mot de passe :', style: TextStyle(
                        fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                    ),
                  ),
                  Transform.translate(offset: Offset(screenWidth * (isPortrait ? 0.05 : 0.05), screenHeight * (isPortrait ? 0.03 : 0.1)),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: screenWidth * (isPortrait ? 0.8 : 0.7),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _passwordController,
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      labelText: 'Mot de passe',
                                      hintText: '*******',
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Color(0XFFFCBC1C),
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
                                SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.1),),
                                SizedBox(
                                  width: screenWidth * (isPortrait ? 0.8 : 0.7),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _confirmPasswordController,
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      labelText: 'Mot de passe',
                                      hintText: '*******',
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Color(0XFFFCBC1C),
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
                                SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1),),
                                SizedBox(
                                  width: screenWidth * (isPortrait ? 0.8 : 0.7), // Largeur du bouton ajustée
                                  height: screenHeight * (isPortrait ? 0.06 : 0.2),
                                  child: ElevatedButton(
                                    onPressed: _submitForm,
                                    style: ButtonStyle(
                                      backgroundColor: const WidgetStatePropertyAll(Color(0XFFFCBC1C)),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10), // Bordures arrondies
                                        ),
                                      ),
                                      elevation: const WidgetStatePropertyAll(3),
                                    ),
                                    child: Text("Envoyer", style: TextStyle(
                                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0 : 0.1),),
               SizedBox(
                width: screenWidth * (isPortrait ? 0.9 : 0.8),
                height: screenHeight * (isPortrait ? 0.07 : 0.2),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PerformanceEntreprise()),
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
                    'Voir les performances',
                    style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

               SizedBox(height: screenHeight * (isPortrait ? 0 : 0.1),),
            ],
          ),
        )
    );
  }
}