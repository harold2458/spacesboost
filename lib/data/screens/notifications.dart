import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
            title: const Text('Notification', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            centerTitle: true,
            backgroundColor: const Color(0XFFFCBC1C),
            leading: IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (isPortrait ? 0.05 : 0.1), vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                      spreadRadius: 2, // Rayon de diffusion
                      blurRadius: 2, // Flou de l'ombre
                      offset: const Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Text(
                      'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
