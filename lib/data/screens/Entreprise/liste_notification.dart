import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/listes_preuves.dart';

class ListeNotification extends StatefulWidget {
  const ListeNotification({super.key, required this.annonce});

  final Map<String, dynamic> annonce;

  @override
  State<ListeNotification> createState() => _ListeNotificationState();
}

class _ListeNotificationState extends State<ListeNotification> {
  final List<Map<String, dynamic>> notifications = [
    {
      'description': "L'influenceur Toto veut partager une nouvelle.",
      'date': '25/11/2024',
      'heure': '09:44',
    },
    {
      'description': "L'influenceur Jane a publié un nouvel article.",
      'date': '25/11/2024',
      'heure': '10:15',
    },
    {
      'description': "Un événement spécial est programmé aujourd'hui.",
      'date': '25/11/2024',
      'heure': '12:00',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listes des notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff072858),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: AnnonceCard(
              description: notifications[index]['description'],
              date: notifications[index]['date'],
              heure: notifications[index]['heure'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListesPreuves(
                      annonce: notifications[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AnnonceCard extends StatelessWidget {
  final String description;
  final String date;
  final String heure;
  final VoidCallback onTap;

  const AnnonceCard({
    Key? key,
    required this.description,
    required this.date,
    required this.heure,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  //color: Color(0xff072858),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range, color: Colors.yellow),
                      const SizedBox(width: 8),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.yellow),
                      const SizedBox(width: 8),
                      Text(
                        heure,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
