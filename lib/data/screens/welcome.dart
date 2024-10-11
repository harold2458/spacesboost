import 'package:flutter/material.dart';
import 'renseignement.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff072858)),),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
    }, icon: const Icon(Icons.arrow_back, color: Color(0xff072858),),
      ),
      ),
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/bg_welcome.jpg'), fit: BoxFit.cover)
              )
          ),
          Column(
            children: [
              const SizedBox(height: 40,),
              const Center(child: Text('Bienvenue sur SPACEBOOST !',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff072858),
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,),),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Découvrez nos fonctionnalités et profitez d\'une\nexpérience simplifiée pour collaborer avec les\nchefs d\'entreprise.',
                  style: TextStyle(
                    color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 70,),
              Transform.translate(
                offset: const Offset(120, 0),
                child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff072858)
                ),
                alignment: Alignment.center,
                width: 60,
                height: 60,
                child: IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Renseignement()));
                }, icon: const Icon(Icons.arrow_right_alt, color: Colors.white, size: 35,)),
              ),),
              const SizedBox(height: 20,),
              Image.asset(
                'assets/images/welcome.png', height: 450,
              )
            ],
          )
        ],
      )
    );
  }
}
