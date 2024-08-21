import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart'; // Import the Signup page
import 'sign_in.dart'; // Import the SignIn page
import 'homepage2.dart'; // Import the Homepage page

class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F7F7), Color(0xFFF69697)],
            stops: [0.205, 1],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 125),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -80,
                left: -30,
                right: 60,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 46,
                          color: Color(0xFF1C1C1C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Start with Sign up or Sign in',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 50), // Space before the circles
                    Container(
                      width: double.infinity,
                      height: 560,
                      decoration: BoxDecoration(
                        color: Color(0xFF666666),
                        borderRadius: BorderRadius.circular(280),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -355,
                bottom: -263,
                child: SvgPicture.asset(
                  'assets/vectors/ellipse_2_x2.svg',
                  width: 816,
                  height: 718,
                ),
              ),
              Positioned(
                right: -310,
                bottom: -300,
                child: Container(
                  width: 560,
                  height: 560,
                  decoration: BoxDecoration(
                    color: Color(0xFFDE0A26),
                    borderRadius: BorderRadius.circular(280),
                  ),
                ),
              ),
              Positioned(
                bottom: 170,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Container(
                        height: 49,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCBD1),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.itim(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Space between buttons
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Container(
                        height: 49,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCBD1),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            style: GoogleFonts.itim(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 70,
                left: 50,
                right: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Text(
                    'Continue as a Guest',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
