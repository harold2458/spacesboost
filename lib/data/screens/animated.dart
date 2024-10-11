import 'package:flutter/material.dart';
import 'dart:async';
import 'package:projet_mobile/data/screens/onboarding.dart';

class Animated extends StatefulWidget {
  const Animated({super.key}); // Notez que j'ai corrigé le nom de la classe ici

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _rocketAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _curtainLeftAnimation;
  late Animation<Offset> _curtainRightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Rocket animation: moves from bottom to top
    _rocketAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Logo fade-in animation
    _logoOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    ));

    // Left curtain animation
    _curtainLeftAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-1, -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Right curtain animation
    _curtainRightAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1, -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation and then navigate to the next page
    _controller.forward().then((value) {
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: Colors.white,
          ),
          // Rocket animation
          SlideTransition(
            position: _rocketAnimation,
            child: Center(
              child: Image.asset(
                'assets/logos/rocket.jpg',
                height: 100,
              ),
            ),
          ),
          // Left curtain animation
          SlideTransition(
            position: _curtainLeftAnimation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: const Color(0xfffcbc1c),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(MediaQuery.of(context).size.width / 2),
                  ),
                ),
              ),
            ),
          ),
          // Right curtain animation
          SlideTransition(
            position: _curtainRightAnimation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: const Color(0xfffcbc1c),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(MediaQuery.of(context).size.width / 2),
                  ),
                ),
              ),
            ),
          ),
          // Logo fade-in animation
          FadeTransition(
            opacity: _logoOpacityAnimation,
            child: Center(
              child: Image.asset(
                'assets/logos/logo.png',
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
