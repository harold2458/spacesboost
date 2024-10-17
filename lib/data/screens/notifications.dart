import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Notification', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            centerTitle: true,
            backgroundColor: const Color(0XFFFCBC1C),
            leading: IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back, color: Colors.white,))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                          'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
                        spreadRadius: 3, // Rayon de diffusion
                        blurRadius: 7, // Flou de l'ombre
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.red,),
                      SizedBox(width: 20,),
                      Text(
                        'Votre candidature a ete envoyee avec\nsucces, veuillez a chaque fois consulter\nvotre mail pour l\'avancement. Merci .. !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        )
    );
  }
}
