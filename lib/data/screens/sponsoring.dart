import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sponsoring extends StatefulWidget {
  const Sponsoring({super.key});

  @override
  State<Sponsoring> createState() => _SponsoringState();
}

class _SponsoringState extends State<Sponsoring> {

  final String parrainageCode = "ABC123DEFGH@123456yhesbkhdh"; // Code de parrainage à copier

  void copierCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: parrainageCode)).then((_) {
      // Afficher un toast pour confirmer la copie
      Fluttertoast.showToast(
        msg: "Code copié : $parrainageCode",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/images/parrainage.png', width: 270,),
              const SizedBox(height: 50),
              Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text('Votre code de parrainage :', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      ),),
                    )
                  ]),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parrainageCode,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, color: Color(0xff072858)),
                      onPressed: () => copierCode(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => copierCode(context),
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
                  "Copier le code",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 60),
              Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text('Partager :', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      ),),
                    )
                  ]),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () { }, icon: Image.asset('assets/images/twitter.png', width: 40,),),
                  const SizedBox(width: 25),
                  IconButton(onPressed: () { }, icon: Image.asset('assets/images/linkedin.png', width: 40),),
                  const SizedBox(width: 25),
                  IconButton(onPressed: () { }, icon: Image.asset('assets/images/whatsapp.png', width: 40),),
                  const SizedBox(width: 25),
                  IconButton(onPressed: () { }, icon: Image.asset('assets/images/facebook.png', width: 40),),
                ],
              )
            ]
        ),
      )
    );
  }
}
