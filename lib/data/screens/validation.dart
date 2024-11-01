import 'package:flutter/material.dart';
import 'before_home.dart';

class Validation extends StatefulWidget {
  const Validation({super.key});

  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/screen.png', fit: BoxFit.cover, width: screenWidth, height: screenHeight,),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BeforeHome())
              );
            },
            child: Center(
                child: Container(
                  width: screenWidth * (isPortrait ? 0.8 : 0.6),
                    height: screenHeight * (isPortrait ? 0.4 : 0.7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * (isPortrait ? 0.05 : 0.03)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/wait.png', width: screenWidth * (isPortrait ? 0.3 : 0.1),),
                        SizedBox(height: screenHeight * (isPortrait ? 0.08 : 0.1)),
                        const Text("Merci de patienter pour la validation de votre compte. Vous recevrez une notification une fois effectuée.", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                      ],
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}
