import 'package:flutter/material.dart';
import 'package:projet_mobile/data/screens/Entreprise/avant_home.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool _isBalanceVisible = false;
  final double _balanceAmount = 150.75; // Exemple de montant
  bool _imagesLoaded = false;

  // Fonction pour basculer la visibilité du solde
  void _toggleBalance() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImages();
  }

  // Préchargement des images pour éviter le chargement en différé
  Future<void> _preloadImages() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/paypal.png'), context),
      precacheImage(const AssetImage('assets/images/visa.png'), context),
      precacheImage(const AssetImage('assets/images/mastercard.png'), context),
      precacheImage(const AssetImage('assets/images/bitcoin.png'), context),
      precacheImage(const AssetImage('assets/images/mtnmomo.png'), context),
      precacheImage(const AssetImage('assets/images/moovmoney.png'), context),
      precacheImage(const AssetImage('assets/images/gain.png'), context),
    ]);

    setState(() {
      _imagesLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
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
      body: isPortrait
          ? Column(
              children: [
                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: Flexible(
                    child: Text(
                      'Passez à l\'action en un clic.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Montant à payer : ',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff072858),
                      ),
                    ),
                    SizedBox(width: screenHeight * 0.05),
                    const Text(
                      '234 \$',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),

                // Ajout de la grille de méthodes de paiement
                Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPaymentButton(screenWidth, screenHeight, 'paypal.png'),
                          _buildPaymentButton(screenWidth, screenHeight, 'visa.png'),
                          _buildPaymentButton(screenWidth, screenHeight, 'mastercard.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPaymentButton(screenWidth, screenHeight, 'bitcoin.png'),
                          _buildPaymentButton(screenWidth, screenHeight, 'mtnmomo.png'),
                          _buildPaymentButton(screenWidth, screenHeight, 'moovmoney.png'),
                        ],
                      ),
                    ),
                  ],
                ),

                const Spacer(), // Ajout du Spacer pour pousser le Container vers le bas

                // Ajout du bouton Payer
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xff072858),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Annuler', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffcbc1c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                        ),

                     ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AvantHome()),
                              );
                          },
                          child: const Text(
                            'Payer',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffcbc1c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // élargit horizontalement
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  // Code pour le mode paysage...
                ],
              ),
            ),
    );
  }

  // Méthode pour créer les boutons de méthode de paiement
  Widget _buildPaymentButton(double screenWidth, double screenHeight, String imageName) {
    return Expanded(
      child: SizedBox(
        height: screenHeight * 0.1,
        child: IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            elevation: WidgetStateProperty.all(3),
          ),
          onPressed: () {
            // Ajouter la fonction pour traiter le paiement ici
          },
          icon: !_imagesLoaded
              ? const CircularProgressIndicator(color: Color(0XFF072858))
              : Image.asset('assets/images/$imageName', width: screenWidth * 0.1),
        ),
      ),
    );
  }
}
