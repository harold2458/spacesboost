import 'package:flutter/material.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {

  bool _isBalanceVisible = false;
  final double _balanceAmount = 150.75; // Montant de l'exemple

  void _toggleBalance() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Row(children: [
            const Text(
              'Se connecter',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            const SizedBox(width: 20,),
            ElevatedButton(
              onPressed: _toggleBalance,
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)), // Couleur de fond
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 20)), // Espacement
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Coins arrondis
                )),
                elevation: const WidgetStatePropertyAll(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icône
                  Icon(
                    _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10), // Espacement entre l'icône et le texte
                  // Texte
                  Text(
                    _isBalanceVisible
                        ? '\$ $_balanceAmount' // Afficher le montant
                        : 'Afficher solde', // Afficher le texte initial
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ]),
            const SizedBox(height: 10,),
          Image.asset('assets/image/gain.png')
        ],
      )
    );
  }
}
