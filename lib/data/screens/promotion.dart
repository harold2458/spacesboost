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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(height: 20,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 395,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text('🎯 Collaboration dans le Secteur\nde la Mode', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858)
                        )),
                        SizedBox(height: 20,),
                        Text("Nous sommes une marque de vêtements\ntendance et innovante, à la recherche\nd’un influenceur ..."
                          , style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ), ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
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
                              borderRadius: BorderRadius.circular(20), // Bordures arrondies
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(5),
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: const Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 395,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text('🎯 Collaboration dans le Secteur\nde la Mode', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858)
                        )),
                        SizedBox(height: 20,),
                        Text("Nous sommes une marque de vêtements\ntendance et innovante, à la recherche\nd’un influenceur ..."
                          , style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ), ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
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
                              borderRadius: BorderRadius.circular(20), // Bordures arrondies
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(5),
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: const Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),const SizedBox(height: 20,),
             Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 395,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text('🎯 Collaboration dans le Secteur\nde la Mode', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858)
                        )),
                        SizedBox(height: 20,),
                        Text("Nous sommes une marque de vêtements\ntendance et innovante, à la recherche\nd’un influenceur ..."
                          , style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ), ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
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
                              borderRadius: BorderRadius.circular(20), // Bordures arrondies
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(5),
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: const Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 395,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text('🎯 Collaboration dans le Secteur\nde la Mode', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858)
                        )),
                        SizedBox(height: 20,),
                        Text("Nous sommes une marque de vêtements\ntendance et innovante, à la recherche\nd’un influenceur ..."
                          , style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ), ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
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
                              borderRadius: BorderRadius.circular(20), // Bordures arrondies
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(5),
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: const Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 395,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text('🎯 Collaboration dans le Secteur\nde la Mode', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858)
                        )),
                        SizedBox(height: 20,),
                        Text("Nous sommes une marque de vêtements\ntendance et innovante, à la recherche\nd’un influenceur ..."
                          , style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ), ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
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
                              borderRadius: BorderRadius.circular(20), // Bordures arrondies
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(5),
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: const Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 3, // Rayon de diffusion
                      blurRadius: 7, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                width: 395,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Text('🎯 Collaboration dans le Secteur\nde la Mode', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff072858)
                        )),
                        SizedBox(height: 20,),
                        Text("Nous sommes une marque de vêtements\ntendance et innovante, à la recherche\nd’un influenceur ..."
                          , style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                          ), ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
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
                              borderRadius: BorderRadius.circular(20), // Bordures arrondies
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(5),
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                      ),
                      child: const Text(
                        'Consulter',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      )
    );
  }
}
