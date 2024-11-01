import 'package:flutter/material.dart';

import 'avant_home.dart';

class WelcomeEntreprise extends StatefulWidget {
  const WelcomeEntreprise({super.key});

  @override
  State<WelcomeEntreprise> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeEntreprise> {
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
            color: Colors.white
            ,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff072858),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
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
                              builder: (context) => const AvantHome(),
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
                    SizedBox(width: screenWidth * 0.1),
                    Image.asset(
                      'assets/images/3H5A2218-1.png',
                      height: screenHeight * 0.8,
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
