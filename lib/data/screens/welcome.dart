import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'avant_home.dart';
=======
import 'renseignement.dart';
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
=======
  bool _imagesLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Préchargement des images avec un contexte valide
    _preloadImages();
  }

  // Fonction de préchargement des images
  Future<void> _preloadImages() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/bg_welcome.jpg'), context),
      precacheImage(const AssetImage('assets/images/welcome.png'), context),
    ]);

    setState(() {
      _imagesLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*if (!_imagesLoaded) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0XFFFCBC1C),
          ),
        ),
      );
    }*/
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenue',
          style: TextStyle(
            fontWeight: FontWeight.bold,
<<<<<<< HEAD
            color: Colors.white
            ,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff072858),
=======
            color: Color(0xff072858),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfffcbc1c),
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
<<<<<<< HEAD
            color: Colors.white,
          ),
        ),
      ),
      body: isPortrait ?
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_welcome.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: Text(
                    'Bienvenue sur SPACEBOOST !',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: const Color(0xff072858),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Padding(padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02
                ),
                  child: const Text(
                    'Découvrez nos fonctionnalités et profitez\n'
                        'd\'une expérience simplifiée pour collaborer\n'
                        'avec les chefs d\'entreprise.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/3H5A2218-1.png',
                        height: screenHeight * 0.6,
                      ),
                      Transform.translate(offset: Offset(screenWidth * 0.5, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff072858),
                          ),
                          width: screenWidth * 0.13,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AvantHome(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                              size: screenWidth * 0.1,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )
          :
      SingleChildScrollView(
=======
            color: Color(0xff072858),
          ),
        ),
      ),
      body: !_imagesLoaded ?
      const Center(
        child: CircularProgressIndicator(
          color: Color(0XFFFCBC1C),
        ),
      ) :

    isPortrait
          ? Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_welcome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.06),
              Center(
                child: Text(
                  'Bienvenue sur SPACEBOOST !',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: const Color(0xff072858),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02),
                child: const Text(
                  'Découvrez nos fonctionnalités et profitez\n'
                      'd\'une expérience simplifiée pour collaborer\n'
                      'avec les chefs d\'entreprise.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/welcome.png',
                      height: screenHeight * 0.6,
                    ),
                    Transform.translate(
                      offset: Offset(screenWidth * 0.6, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xff072858),
                        ),
                        width: screenWidth * 0.13,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const Renseignement(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: screenWidth * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
          : SingleChildScrollView(
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
<<<<<<< HEAD
                  image: AssetImage('assets/images/bg_welcome.jpg'),
=======
                  image: AssetImage('assets/images/bg_welcome.png'),
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: screenHeight * 0.2),
                Center(
                  child: Text(
                    'Bienvenue sur SPACEBOOST !',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: const Color(0xff072858),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.2),
                const Text(
                  'Découvrez nos fonctionnalités et profitez d\'une\n'
                      'expérience simplifiée pour collaborer avec les\n'
                      'chefs d\'entreprise.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< HEAD
=======
                    const Spacer(),
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff072858),
                      ),
                      width: screenWidth * 0.07,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
<<<<<<< HEAD
                              builder: (context) => const AvantHome(),
=======
                              builder: (context) =>
                              const Renseignement(),
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                          size: screenWidth * 0.05,
                        ),
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(width: screenWidth * 0.1),
                    Image.asset(
                      'assets/images/3H5A2218-1.png',
=======
                    SizedBox(width: screenWidth * 0.4),
                    Image.asset(
                      'assets/images/welcome.png',
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
                      height: screenHeight * 0.8,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
<<<<<<< HEAD
      )
=======
      ),
>>>>>>> 2a3ede11d66a49bf2f6ae7f40037befa6f1f7ac7
    );
  }
}
