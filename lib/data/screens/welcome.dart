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
            color: Color(0xff072858),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff072858),
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
              SizedBox(height: screenHeight * (isPortrait ? 0.06 : 0.2)),
              Center(
                child: Text(
                  'Bienvenue sur SPACEBOOST !',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.05 : 0.04),
                    color: const Color(0xff072858),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.07 : 0.1)),
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
              const Spacer(), // Ajoute un espace flexible
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/welcome.png',
                    height: screenHeight * (isPortrait ? 0.5 : 0.1),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff072858),
                    ),
                    width: screenWidth * (isPortrait ? 0.13 : 0.1),
                    //height: screenHeight * (isPortrait ? 0.05 : 0.1),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Renseignement(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: screenWidth * (isPortrait ? 0.1 : 0.1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
          :
      SingleChildScrollView(
        child: Stack(
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
                SizedBox(height: screenHeight * (isPortrait ? 0.06 : 0.2)),
                Center(
                  child: Text(
                    'Bienvenue sur SPACEBOOST !',
                    style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.05 : 0.03),
                      color: const Color(0xff072858),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.07 : 0.2)),
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
                SizedBox(height: screenHeight * (isPortrait ? 0.1 : 0.2 )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/welcome.png',
                      height: screenHeight * (isPortrait ? 0.5 : 0.8),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff072858),
                      ),
                      width: screenWidth * (isPortrait ? 0.13 : 0.07),
                      //height: screenHeight * (isPortrait ? 0.05 : 0.1),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Renseignement(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                          size: screenWidth * (isPortrait ? 0.1 : 0.05),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
