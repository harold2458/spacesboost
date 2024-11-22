import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_mobile/data/screens/influenceur/edit_profil.dart';

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

  File? _imageFile;

  // Méthode pour choisir une image depuis la galerie ou l'appareil photo
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    // Affichage de la photo de profil
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/images/default_profile.jpg') as ImageProvider,
                    ),

                    // Bouton d'icône pour changer l'image
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          // Ouvre le sélecteur de fichiers pour choisir une image
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => _buildImagePickerSheet(),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xfffcbc1c),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0XFFFCBC1C)
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
                                      text: 'Gafour YEKINI',
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
                                    text: 'yekiniabdougafour@gmail.com',
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
                                    text: '+229 60126604',
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
                                  text: 'Type d\'influenceur : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: 'Mode',
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
                                  text: 'Domaine d\'influence : ',
                                  style: TextStyle(fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff072858)),
                                ),
                                const TextSpan(
                                    text: 'Photos',
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
                      MaterialPageRoute(builder: (context) => const EditProfil()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Color(0xfffcbc1c)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordures arrondies
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(3),
                  ),
                  child: Text(
                    'Modifier le profil',
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
                                SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1),),
                                SizedBox(
                                  width: screenWidth * (isPortrait ? 0.8 : 0.7), // Largeur du bouton ajustée
                                  height: screenHeight * (isPortrait ? 0.06 : 0.2),
                                  child: ElevatedButton(
                                    onPressed: _submitForm,
                                    style: ButtonStyle(
                                      backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
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
            ],
          ),
        )
    );
  }

  // Feuille modale pour sélectionner la source de l'image
  Widget _buildImagePickerSheet() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Galerie'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Appareil photo'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
