import 'package:flutter/material.dart';

import 'content.dart';

class Promotion extends StatefulWidget {
  const Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.15), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
        child: Column(
          children: [
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      )),
                      SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                      Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                        , style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                            fontStyle: FontStyle.italic
                        ), ),
                    ],
                  ),
                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.25),),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.3 : 0.15),
                    height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Content()),
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
                        //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      )),
                      SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                      Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                        , style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                            fontStyle: FontStyle.italic
                        ), ),
                    ],
                  ),
                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.25),),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.3 : 0.15),
                    height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Content()),
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
                        //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      )),
                      SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                      Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                        , style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                            fontStyle: FontStyle.italic
                        ), ),
                    ],
                  ),
                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.25),),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.3 : 0.15),
                    height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Content()),
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
                        //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      )),
                      SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                      Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                        , style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                            fontStyle: FontStyle.italic
                        ), ),
                    ],
                  ),
                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.25),),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.3 : 0.15),
                    height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Content()),
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
                        //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      )),
                      SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                      Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                        , style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                            fontStyle: FontStyle.italic
                        ), ),
                    ],
                  ),
                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.25),),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.3 : 0.15),
                    height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Content()),
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
                        //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.025 : 0.1),),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('🎯 Collaboration dans le\nSecteur de la Mode', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff072858)
                      )),
                      SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                      Text("Nous sommes une marque de\nvêtements tendance et innovante,\nà la recherche d’un influenceur ..."
                        , style: TextStyle(
                            fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                            fontStyle: FontStyle.italic
                        ), ),
                    ],
                  ),
                  SizedBox(width: screenWidth * (isPortrait ? 0.01 : 0.25),),
                  SizedBox(
                    width: screenWidth * (isPortrait ? 0.3 : 0.15),
                    height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Content()),
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
                        //padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: screenWidth * (isPortrait ? 0.025 : 0.01),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.1),),
          ],
        ),
      )
    );
  }
}
