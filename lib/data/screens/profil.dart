import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/profil.jpg'),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0XFFFCBC1C)
                  ),
                  width: 270,
                  height: 1,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Nom de l’utilisateur : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: 'Gafour YEKINI',
                              style: TextStyle(color: Colors.black,)
                          ),
                        ],
                      )),
                ]
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Email de l’utilisateur : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: 'yekiniabdougafour@gmail.com',
                              style: TextStyle(fontSize: 10.0, color: Colors.black,)
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Numéro de l’utilisateur : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: '+229 60126604',
                              style: TextStyle(color: Colors.black,)
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Type d\'influenceur : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: 'Danseur',
                              style: TextStyle(color: Colors.black,)
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Domaine d\'influence : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: 'Film',
                              style: TextStyle(color: Colors.black,)
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Pays de l’utilisateur : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: 'Bénin',
                              style: TextStyle(color: Colors.black,)
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Poppins'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Ville de l’utilisateur : ',
                            style: TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff072858)),
                          ),
                          TextSpan(
                              text: 'Abomey-Calavi',
                              style: TextStyle(color: Colors.black,)
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 50),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XFFFCBC1C)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 360,
                    height: 240,
                  ),
                  Transform.translate(offset: const Offset(40, -15),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xfff7f7fd)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: const Text('Changement du mot de passe :', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                    ),
                  ),
                  Transform.translate(offset: const Offset(20, 25),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
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
                                const SizedBox(height: 20.0),
                                SizedBox(
                                  width: 310,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _confirmPasswordController,
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
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Bordures arrondies
                                      ),
                                    ),
                                    elevation: const WidgetStatePropertyAll(5),
                                  ),
                                  child: const Text("Envoyer", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
    );
  }
}
