import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/publicite.dart';

// Assurez-vous d'importer la page Publicite
// import 'chemin/vers/votre/page/publicite.dart';

class AnnonceEntreprise extends StatefulWidget {
  const AnnonceEntreprise({super.key});

  @override
  State<AnnonceEntreprise> createState() => _AnnonceEntrepriseState();
}

class _AnnonceEntrepriseState extends State<AnnonceEntreprise> {
  bool isCheckedwhatsapp = false;
  bool isCheckedtiktok = false;
  bool isCheckedinstagram = false;
  bool isCheckedfacebook = false;
  bool isCheckedtwitter = false;
  bool isCheckedtelegram = false;

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
                'Choisissez là où vos publicités apparaîtront. Plus de plateformes vous aident à atteindre vos résultats.',
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // WhatsApp
              GestureDetector(
                onTap: () {
                  // Action à exécuter lors du clic sur la ligne complète
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Publicite()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheckedwhatsapp,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedwhatsapp = value ?? false;
                          if (isCheckedwhatsapp) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Publicite()),
                            );
                          }
                        });
                      },
                    ),
                    Image.asset(
                      'assets/icons/whatsapp2.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Statut WhatsApp',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Votre statut apparaîtra sur... .',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Action lors de l'appui sur l'icône d'information
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: const Text('Votre statut apparaîtra sur... ..'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // TikTok
              GestureDetector(
                onTap: () {
                  // Action à exécuter lors du clic sur la ligne complète
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Publicite()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheckedwhatsapp,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedwhatsapp = value ?? false;
                          if (isCheckedwhatsapp) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Publicite()),
                            );
                          }
                        });
                      },
                    ),
                    Image.asset(
                      'assets/icons/tiktok.jpeg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TikTok',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Votre statut apparaîtra sur... .',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Action lors de l'appui sur l'icône d'information
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: const Text('Votre statut apparaîtra sur... ..'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  // Action à exécuter lors du clic sur la ligne complète
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Publicite()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheckedwhatsapp,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedwhatsapp = value ?? false;
                          if (isCheckedwhatsapp) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Publicite()),
                            );
                          }
                        });
                      },
                    ),
                    Image.asset(
                      'assets/icons/facebook2.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Facebook',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Votre statut apparaîtra sur... .',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Action lors de l'appui sur l'icône d'information
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: const Text('Votre statut apparaîtra sur... ..'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Instagram
              GestureDetector(
                onTap: () {
                  // Action à exécuter lors du clic sur la ligne complète
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Publicite()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheckedwhatsapp,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedwhatsapp = value ?? false;
                          if (isCheckedwhatsapp) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Publicite()),
                            );
                          }
                        });
                      },
                    ),
                    Image.asset(
                      'assets/icons/instagram2.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Instagram',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Votre statut apparaîtra sur... .',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Action lors de l'appui sur l'icône d'information
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: const Text('Votre statut apparaîtra sur... ..'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Twitter
              GestureDetector(
                onTap: () {
                  // Action à exécuter lors du clic sur la ligne complète
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Publicite()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheckedwhatsapp,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedwhatsapp = value ?? false;
                          if (isCheckedwhatsapp) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Publicite()),
                            );
                          }
                        });
                      },
                    ),
                    Image.asset(
                      'assets/icons/twitter.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Twitter',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Votre statut apparaîtra sur... .',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Action lors de l'appui sur l'icône d'information
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: const Text('Votre statut apparaîtra sur... ..'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Telegram
              GestureDetector(
                onTap: () {
                  // Action à exécuter lors du clic sur la ligne complète
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Publicite()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheckedwhatsapp,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedwhatsapp = value ?? false;
                          if (isCheckedwhatsapp) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Publicite()),
                            );
                          }
                        });
                      },
                    ),
                    Image.asset(
                      'assets/icons/telegram.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Telegram',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Votre statut apparaîtra sur... .',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Action lors de l'appui sur l'icône d'information
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: const Text('Votre statut apparaîtra sur... ..'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


