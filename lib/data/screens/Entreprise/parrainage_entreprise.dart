import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ParrainageEntreprise extends StatefulWidget {
  const ParrainageEntreprise({super.key});

  @override
  State<ParrainageEntreprise> createState() => _ParrainageState();
}

class _ParrainageState extends State<ParrainageEntreprise> {
  final String parrainageCode = "ABC123DEFGH@123456yhesbkhdh"; // Code de parrainage à copier

  void copierCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: parrainageCode)).then((_) {
      Fluttertoast.showToast(
        msg: "Code copié : $parrainageCode",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  bool _imagesLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImages();
  }

  Future<void> _preloadImages() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/parrainage.png'), context),
      precacheImage(const AssetImage('assets/images/twitter.png'), context),
      precacheImage(const AssetImage('assets/images/linkedin.png'), context),
      precacheImage(const AssetImage('assets/images/whatsapp.png'), context),
      precacheImage(const AssetImage('assets/images/facebook.png'), context),
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
          'Sponsoring',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFF072858),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * (isPortrait ? 0.03 : 0.1),
          vertical: screenHeight * (isPortrait ? 0.03 : 0.1),
        ),
        child: Column(
          children: [
            if (!_imagesLoaded)
              const CircularProgressIndicator(color: Color(0XFFFCBC1C))
            else
              Image.asset(
                'assets/images/parrainage.png',
                width: screenWidth * (isPortrait ? 0.6 : 0.2),
              ),
            SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1)),
            Row(
              children: [
                Text(
                  'Votre code de parrainage :',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff072858),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * (isPortrait ? 0.01 : 0.08),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      parrainageCode,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Color(0xff072858)),
                    onPressed: () => copierCode(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1)),
            SizedBox(
              width: screenWidth * (isPortrait ? 0.9 : 0.8),
              height: screenHeight * (isPortrait ? 0.06 : 0.2),
              child: ElevatedButton(
                onPressed: () => copierCode(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(const Color(0XFFFCBC1C)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  elevation: WidgetStatePropertyAll(3),
                ),
                child: Text(
                  "Copier le code",
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.05 : 0.1)),
            Row(
              children: [
                Text(
                  'Partager :',
                  style: TextStyle(
                    fontSize: screenWidth * (isPortrait ? 0.04 : 0.03),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff072858),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isPortrait ? 0.04 : 0.1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/twitter.png',
                  width: screenWidth * (isPortrait ? 0.08 : 0.06),
                ),
                SizedBox(width: screenWidth * (isPortrait ? 0.04 : 0.06)),
                Image.asset(
                  'assets/images/linkedin.png',
                  width: screenWidth * (isPortrait ? 0.08 : 0.06),
                ),
                SizedBox(width: screenWidth * (isPortrait ? 0.04 : 0.06)),
                Image.asset(
                  'assets/images/whatsapp.png',
                  width: screenWidth * (isPortrait ? 0.08 : 0.06),
                ),
                SizedBox(width: screenWidth * (isPortrait ? 0.04 : 0.06)),
                Image.asset(
                  'assets/images/facebook.png',
                  width: screenWidth * (isPortrait ? 0.08 : 0.06),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
