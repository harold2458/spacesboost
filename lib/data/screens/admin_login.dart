import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/admin_before_dashboard.dart';
import 'forgot_password.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1),),
      Form(
        key: _formKey,
        child: Column(
          children: [
            Center(child: Text('Bienvenue à nouveau !',
              style: TextStyle(
                fontSize: screenWidth * (isPortrait ? 0.05 : 0.03),
                fontWeight: FontWeight.bold,
                color: const Color(0xff072858),
              ),
              textAlign: TextAlign.center,
            ),),
            SizedBox(height: screenHeight * (isPortrait ? 0.12 : 0.2),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email utilisateur',
                  hintText: '*example@gmail.com',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xfffcbc1c),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xfffcbc1c)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xfffcbc1c)),
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
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: '*******',
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xfffcbc1c),
                  ),
                  suffixIcon: IconButton(onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }, icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xfffcbc1c)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xfffcbc1c)),
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
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.08),),
            TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgotPassword()),
              );
            }, child: Text('Mot de passe oublié ?',
              style: TextStyle(
                fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                fontWeight: FontWeight.bold,
                color: const Color(0xff072858),
              ),)),
            SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.08),),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              height: screenHeight * (isPortrait ? 0.07 : 0.2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminBeforeDashboard()),
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
                  'Se connecter',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.015 : 0.08),),
          ],
        ),
      ),
    ])));
  }
}
