import 'package:flutter/material.dart';

class PromotionEntreprise extends StatefulWidget {
  const PromotionEntreprise({super.key});

  @override
  State<PromotionEntreprise> createState() => _PromotionEntrepriseState();
}

class _PromotionEntrepriseState extends State<PromotionEntreprise> {
  bool isCheckedmarko = false;
  bool isCheckedmarkos = false;
  bool isCheckedmarkoz = false;
  bool isCheckedmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sélectionnez les plateformes sur lesquelles vos produits seront mis en avant. Multipliez vos chances de succès en atteignant un public plus large et diversifié.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isCheckedmarko,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedmarko = value ?? false;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/icons/profile2.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nom prenom',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Domaine / Lieu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/whatsapp2.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '5k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/tiktok2.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '12k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Action à effectuer lors de l'appui sur le bouton
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff072858)),
                    ),
                    child: const Text(
                      'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isCheckedmarkos,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedmarkos = value ?? false;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/icons/profile2.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nom prenom',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Domaine / Lieu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/instagram.jpeg',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '5k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/twitter.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '12k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Action à effectuer lors de l'appui sur le bouton
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff072858)),
                    ),
                    child: const Text(
                      'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isCheckedmarkoz,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedmarkoz = value ?? false;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/icons/profile2.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nom prenom',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Domaine / Lieu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/telegram.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '5k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/facebook.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '12k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Action à effectuer lors de l'appui sur le bouton
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff072858)),
                    ),
                    child: const Text(
                      'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isCheckedmark,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedmark = value ?? false;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/icons/profile2.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nom prenom',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Domaine / Lieu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/youtube.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '5k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/linkedln.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              '12k Followers', // Nombre de followers
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Action à effectuer lors de l'appui sur le bouton
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff072858)),
                    ),
                    child: const Text(
                      'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
