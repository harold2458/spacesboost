import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/publicite_entreprise.dart';


class AnnonceEntreprise extends StatefulWidget {
  const AnnonceEntreprise({super.key});

  @override
  State<AnnonceEntreprise> createState() => _AnnonceEntrepriseState();
}

class _AnnonceEntrepriseState extends State<AnnonceEntreprise> {
  final List<Map<String, dynamic>> annonces = [
    {
      'image': 'assets/images/couverture.jpg',
      'name': 'Ordinateur',
      'description': 'Un ordinateur performant pour vos besoins quotidiens.',
      'localisation par region': 'Abomey-Calavi',
      'localisation par adress': 'Rue 123, Abomey-Calavi',
      'domaine d\'intervention': 'Technologie',
      'age': '18 - 48 ans',
      'genre': 'Tout',
      'nombre de personne toucher': 20,
      'date de debut': '12/11/2024',
      'heure de debut': '8h:00',
      'duree': '30 jours',
      'date de fin': '12/12/2025',
      'budget': 10000.0,
    },
    {
      'image': 'assets/images/couverture.jpg',
      'name': 'Tablette',
      'description': 'Une tablette légère et performante pour le travail.',
      'localisation par region': 'Cotonou',
      'localisation par adress': 'Boulevard Steinmetz',
      'domaine d\'intervention': 'Éducation',
      'age': '25 - 50 ans',
      'genre': 'Tout',
      'nombre de personne toucher': 50,
      'date de debut': '01/01/2024',
      'heure de debut': '10h:00',
      'duree': '15 jours',
      'date de fin': '16/01/2024',
      'budget': 5000.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: annonces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: AnnonceCard(
              image: annonces[index]['image'],
              name: annonces[index]['name'],
              description: annonces[index]['description'],
              region: annonces[index]['localisation par region'],
              address: annonces[index]['localisation par adress'],
              domaine: annonces[index]['domaine d\'intervention'],
              age: annonces[index]['age'],
              genre: annonces[index]['genre'],
              nombrePersonne: annonces[index]['nombre de personne toucher'],
              dateDebut: annonces[index]['date de debut'],
              heureDebut: annonces[index]['heure de debut'],
              duree: annonces[index]['duree'],
              dateFin: annonces[index]['date de fin'],
              budget: annonces[index]['budget'],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PubliciteEntreprise(),
            ),
          );
        },
        backgroundColor: const Color(0XFFFCBC1C),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}

class AnnonceCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String region;
  final String address;
  final String domaine;
  final String age;
  final String genre;
  final int nombrePersonne;
  final String dateDebut;
  final String heureDebut;
  final String duree;
  final String dateFin;
  final double budget;

  const AnnonceCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.region,
    required this.address,
    required this.domaine,
    required this.age,
    required this.genre,
    required this.nombrePersonne,
    required this.dateDebut,
    required this.heureDebut,
    required this.duree,
    required this.dateFin,
    required this.budget,
  }) : super(key: key);

  Widget buildInformationText({
    required String title,
    required String content,
    required double screenWidth,
    required bool isPortrait,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isPortrait ? 14 : 16,
              color: const Color(0xff072858), // Bleu foncé
            ),
          ),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: isPortrait ? 14 : 16,
                color: Colors.black, // Noir pour la valeur
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                buildInformationText(
                  title: 'Description : ',
                  content: description,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Localisation : ',
                  content: region,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                if (address.isNotEmpty)
                  buildInformationText(
                    title: 'Adresse : ',
                    content: address,
                    screenWidth: screenWidth,
                    isPortrait: isPortrait,
                  ),
                buildInformationText(
                  title: 'Domaine : ',
                  content: domaine,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Âge : ',
                  content: age,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Genre : ',
                  content: genre,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Nombre de personnes : ',
                  content: nombrePersonne.toString(),
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Date de début : ',
                  content: dateDebut,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Heure de début : ',
                  content: heureDebut,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Durée : ',
                  content: duree,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Date de fin : ',
                  content: dateFin,
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
                buildInformationText(
                  title: 'Budget : ',
                  content: '${budget.toStringAsFixed(2)} FCFA',
                  screenWidth: screenWidth,
                  isPortrait: isPortrait,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
