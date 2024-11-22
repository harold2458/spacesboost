import 'package:flutter/material.dart';

class ConditionUtilisations extends StatefulWidget {
  const ConditionUtilisations({super.key});

  @override
  State<ConditionUtilisations> createState() => _ConditionUtilisationsState();
}

class _ConditionUtilisationsState extends State<ConditionUtilisations> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conditions d\'Utilisation pour les Entreprises',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * (isPortrait ? 0.05 : 0.1),
          vertical: screenHeight * (isPortrait ? 0.03 : 0.1),
        ),
        child: const Text(
          '''
Conditions d'Utilisation de l'Application pour les Entreprises

Bienvenue dans notre application dédiée aux entreprises souhaitant collaborer avec des influenceurs pour promouvoir leurs produits et services. En utilisant cette application, vous acceptez les conditions suivantes :

1. Inscription et Création de Compte :
   - Les entreprises doivent fournir des informations exactes et complètes lors de l'inscription.
   - Vous êtes responsable de la confidentialité de vos identifiants de connexion, y compris les mots de passe. Toute activité sur votre compte est de votre responsabilité.

2. Utilisation de l'Application :
   - Cette application doit être utilisée uniquement à des fins légales, dans le cadre de la promotion et de la gestion de collaborations avec des influenceurs.
   - Les entreprises s'engagent à ne pas utiliser l'application pour des activités frauduleuses ou illicites.

3. Collaborations et Engagements :
   - Les entreprises peuvent entrer en contact avec des influenceurs pour des prestations de promotion et de communication. Cependant, toutes les collaborations sont régies par les conditions spécifiques convenues entre les deux parties.
   - Notre application n'est pas responsable des accords, performances ou résultats des collaborations entre entreprises et influenceurs.

4. Contenu et Licence :
   - En publiant du contenu (textes, images, vidéos, etc.) sur l'application, l'entreprise accorde à notre plateforme une licence mondiale, non exclusive et gratuite pour utiliser, reproduire et distribuer ce contenu aux fins de promotion des services de l'application.
   - Le contenu publié ne doit en aucun cas être offensant, illégal, ou violer les droits de tiers.

5. Respect et Comportement Professionnel :
   - Les entreprises s'engagent à traiter les influenceurs et autres utilisateurs avec respect et à ne publier aucun contenu diffamatoire, injurieux ou inapproprié.
   - Toute violation de cette règle pourra entraîner des sanctions, y compris la suspension ou la résiliation du compte.

6. Modification des Conditions d'Utilisation :
   - Nous nous réservons le droit de modifier ces conditions d'utilisation à tout moment. Les modifications seront publiées sur l'application et entreront en vigueur immédiatement.
   - Il est de la responsabilité des entreprises de consulter régulièrement les conditions mises à jour.

7. Confidentialité et Protection des Données :
   - Les informations et données fournies par les entreprises sont traitées dans le respect de la confidentialité et conformément à notre politique de confidentialité.
   - Les entreprises doivent s'assurer qu'elles respectent également les lois en matière de protection des données pour toutes informations ou données personnelles échangées avec les influenceurs.

8. Résiliation :
   - Nous nous réservons le droit de suspendre ou de résilier l'accès à l'application des entreprises en cas de violation des présentes conditions ou de tout comportement jugé inapproprié ou nuisible.
   - Les entreprises peuvent également clôturer leur compte à tout moment en nous contactant.

9. Responsabilité :
   - Notre entreprise décline toute responsabilité quant aux résultats des collaborations entre entreprises et influenceurs. Toute réclamation ou litige devra être réglé directement entre les parties concernées.

En utilisant cette application, vous reconnaissez avoir lu, compris et accepté ces conditions d'utilisation pour les entreprises.

Merci de votre compréhension et bonne utilisation de notre application pour développer vos collaborations avec les influenceurs !
          ''',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
