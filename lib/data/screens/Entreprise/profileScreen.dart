import 'package:flutter/material.dart';

// Classe principale de la page Profile Influencer
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileInfluencerState();
}

class _ProfileInfluencerState extends State<ProfileScreen> {
  // Variables d'exemple pour les images, vidéos et la note de l'influenceur
  final int rating = 4; // Note de 0 à 5 étoiles
  final List<String> imageUrls = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
  ];

  final List<String> videoUrls = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Influencer',
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
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            // Couverture fixe
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/couverture.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Contenu défilant
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 180), // Espace pour la couverture
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        padding: const EdgeInsets.only(
                            top: 80, left: 20, right: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            const Text(
                              'Marc TOTO',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Abomey-Calavi, Benin',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                'Passionné par le voyage, la mode et le lifestyle.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                );
                              }),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop({'isInfluencerChecked': true});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff072858),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 12),
                              ),
                              child: const Text(
                                'Ajouter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const TabBar(
                              tabs: [
                                Tab(
                                  text: "Images",
                                  icon:
                                      Icon(Icons.image, color: Colors.amber),
                                ),
                                Tab(
                                  text: "Vidéos",
                                  icon: Icon(Icons.video_library,
                                      color: Colors.amber),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 300,
                              child: TabBarView(
                                children: [
                                  GridView.builder(
                                    padding: const EdgeInsets.all(8.0),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemCount: imageUrls.length,
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                        imageUrls[index],
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                  GridView.builder(
                                    padding: const EdgeInsets.all(8.0),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemCount: videoUrls.length,
                                    itemBuilder: (context, index) {
                                      return VideoPlayerWidget(
                                        url: videoUrls[index],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: -30,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/profil.jpg'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget fictif pour la lecture de vidéos
class VideoPlayerWidget extends StatelessWidget {
  final String url;

  const VideoPlayerWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      alignment: Alignment.center,
      child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
    );
  }
}
