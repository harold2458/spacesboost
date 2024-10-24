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

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      body: isPortrait ?
      Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gain : ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff072858),
                  ),),
                SizedBox(width: screenHeight * 0.03),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: ElevatedButton(
                    onPressed: _toggleBalance,
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Coins arrondis
                      )),
                      elevation: const WidgetStatePropertyAll(3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icône
                        Icon(
                          _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        SizedBox(width: screenWidth * 0.05), // Espacement entre l'icône et le texte
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
          SizedBox(height: screenHeight * 0.05),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: screenWidth *  0.9,
                height: screenHeight *  0.25,
              ),
              Transform.translate(offset: Offset(screenWidth * 0.1, -screenHeight * 0.02),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xfff7f7fd)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.005),
                  child: Text('Retirer', style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                ),
              ),
              Transform.translate(offset: Offset(screenWidth * 0.05, screenHeight * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.22,
                            height: screenHeight * 0.1,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  elevation: const WidgetStatePropertyAll(3),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/paypal.png', width: screenWidth * 0.1)),
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          SizedBox(
                            width: screenWidth * 0.22,
                            height: screenHeight * 0.1,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  elevation: const WidgetStatePropertyAll(3),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/visa.png', width: screenWidth * (isPortrait ? 0.1 : 0.3),)),
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          SizedBox(
                            width: screenWidth * 0.22,
                            height: screenHeight * 0.1,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  elevation: const WidgetStatePropertyAll(3),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/mastercard.png', width: screenWidth * 0.1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.22,
                            height: screenHeight * 0.1,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  elevation: const WidgetStatePropertyAll(3),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/bitcoin.png', width: screenWidth * 0.1)),
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          SizedBox(
                            width: screenWidth * 0.22,
                            height: screenHeight * 0.1,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  elevation: const WidgetStatePropertyAll(3),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/mtnmomo.png', width: screenWidth * (isPortrait ? 0.1 : 0.3),)),
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          SizedBox(
                            width: screenWidth * 0.22,
                            height: screenHeight * 0.1,
                            child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  elevation: const WidgetStatePropertyAll(3),
                                ),
                                onPressed: () {

                                }, icon: Image.asset('assets/images/moovmoney.png', width: screenWidth * 0.1)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/gain.png', height: screenHeight * 0.35),
          )
        ],
      ) :
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gain : ',
                    style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff072858),
                    ),),
                  SizedBox(width: screenHeight * (isPortrait ? 0.03 : 0.15),),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: ElevatedButton(
                      onPressed: _toggleBalance,
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Color(0xff072858)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Coins arrondis
                        )),
                        elevation: const WidgetStatePropertyAll(3),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icône
                          Icon(
                            _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          ),
                          SizedBox(width: screenWidth * 0.05), // Espacement entre l'icône et le texte
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
            SizedBox(height: screenHeight * 0.15),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.7,
                ),
                Transform.translate(offset: Offset(screenWidth * 0.1, -screenHeight * 0.1),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xfff7f7fd)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
                    child: Text('Retirer', style: TextStyle(
                      fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                  ),
                ),
                Transform.translate(offset: Offset(screenWidth * 0.05, screenHeight * 0.1),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.2,
                              child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    elevation: const WidgetStatePropertyAll(3),
                                  ),
                                  onPressed: () {

                                  }, icon: Image.asset('assets/images/paypal.png', width: screenWidth * 0.08,)),
                            ),
                            SizedBox(width: screenWidth * 0.07,),
                            SizedBox(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.2,
                              child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    elevation: const WidgetStatePropertyAll(3),
                                  ),
                                  onPressed: () {

                                  }, icon: Image.asset('assets/images/visa.png', width: screenWidth * 0.1)),
                            ),
                            SizedBox(width: screenWidth * 0.07),
                            SizedBox(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.2,
                              child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    elevation: const WidgetStatePropertyAll(3),
                                  ),
                                  onPressed: () {

                                  }, icon: Image.asset('assets/images/mastercard.png', width: screenWidth * 0.1)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.1),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.2,
                              child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    elevation: const WidgetStatePropertyAll(3),
                                  ),
                                  onPressed: () {

                                  }, icon: Image.asset('assets/images/bitcoin.png', width: screenWidth * 0.1)),
                            ),
                            SizedBox(width: screenWidth * 0.07),
                            SizedBox(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.2,
                              child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    elevation: const WidgetStatePropertyAll(3),
                                  ),
                                  onPressed: () {

                                  }, icon: Image.asset('assets/images/mtnmomo.png', width: screenWidth * 0.1)),
                            ),
                            SizedBox(width: screenWidth * 0.07),
                            SizedBox(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.2,
                              child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    elevation: const WidgetStatePropertyAll(3),
                                  ),
                                  onPressed: () {

                                  }, icon: Image.asset('assets/images/moovmoney.png', width: screenWidth * 0.1)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.1,),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/gain.png', height: screenHeight * 0.5,),
            )
          ],
        ),
      )
    );
  }
}
