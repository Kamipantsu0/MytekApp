import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'login_signup.dart'; // Import Timer

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the LoginSignup screen after 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        _createFadeTransition(
          page: LoginSignup(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xFFC30010), Color(0xFFD1001F)],
            stops: <double>[0, 1],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(13, 80, 12.5, 150), // Adjusted padding to fit within the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/logo_mytek_176_px_inverse_12000001.png'),
                  ),
                ),
                width: 252,
                height: 103,
              ),
              SizedBox(height: 80), // Increased space between image and text
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Trouvez le meilleur choix de produits avec les prix les plus bas chez Mytek',
                  style: GoogleFonts.getFont(
                    'Istok Web',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _createFadeTransition({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeOut;
        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        var opacityAnimation = tween.animate(curvedAnimation);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 300),
    );
  }
}
