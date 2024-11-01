import 'package:flutter/material.dart';

class AdminNotifications extends StatefulWidget {
  const AdminNotifications({super.key});

  @override
  State<AdminNotifications> createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
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
            backgroundColor: const Color(0xff072858),
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été validé avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été ajouté avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été modifié avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été supprimé avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été modifié avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'Vous avez decaissé une somme de 150.000 FCFA dans le compte de l\'utilisateur AMADOU Konate, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été ajouté avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
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
                      offset: const Offset(0, 2), // Décalage de l'ombre
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * (isPortrait ? 0.03 : 0.03),),
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: Colors.red,),
                    SizedBox(width: screenWidth * (isPortrait ? 0.03 : 0.1),),
                    const Expanded(child: Text(
                      'L\'utilisateur AMADOU Konate a été ajouté avec succès, veuillez consulter la liste des utilisateurs pour plus de détail... !',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),)
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
