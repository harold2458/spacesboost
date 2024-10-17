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
          const SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Text(
              'Gain : ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff072858),
              ),),
            const SizedBox(width: 30,),
            SizedBox(
              width: 175,
              child: ElevatedButton(
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
            )
          ]),
          const SizedBox(height: 50,),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  width: 360,
                  height: 220,
                ),
                Transform.translate(offset: const Offset(40, -15),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xfff7f7fd)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: const Text('Retirer', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                ),
                ),
                Transform.translate(offset: const Offset(20, 25),
                child: Column(
                  children: [
                    SizedBox(
                      width: 320,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90,
                            height: 80,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  elevation: const WidgetStatePropertyAll(15),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/paypal.png', width: 50,)),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            width: 90,
                            height: 80,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  elevation: const WidgetStatePropertyAll(15),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/visa.png', width: 50,)),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            width: 90,
                            height: 80,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  elevation: const WidgetStatePropertyAll(15),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/mastercard.png', width: 50,)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 320,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90,
                            height: 80,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  elevation: const WidgetStatePropertyAll(15),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/bitcoin.png', width: 50,)),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            width: 90,
                            height: 80,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  elevation: const WidgetStatePropertyAll(15),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/mtnmomo.png', width: 50,)),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            width: 90,
                            height: 80,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  elevation: const WidgetStatePropertyAll(15),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/moovmoney.png', width: 50,)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                )
              ],
            ),
            const SizedBox(height: 20,),
          Transform.translate(offset: const Offset(44, 9),
          child: Image.asset('assets/images/gain.png', width: 320,),)
        ],
      )
    );
  }
}
