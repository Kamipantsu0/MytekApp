import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_signup.dart';
import 'sign_in.dart'; // Import the SignIn page

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate the bottom padding based on the keyboard's height
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Avoid automatic resizing
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF7F7F7), Color(0xFFF69697)],
                stops: [0.245, 1],
              ),
            ),
            child: Stack(
              children: [
                // Background ellipse
                Positioned(
                  left: -150,
                  top: 400,
                  child: SvgPicture.asset(
                    'assets/vectors/ellipse_22_x2.svg',
                    width: 800,
                    height: 800,
                  ),
                ),
                // Red circle
                Positioned(
                  right: -70,
                  top: 50,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Color(0xFFC30010),
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main content
          Positioned.fill(
            top: 150, // Adjust this value to move content down
            bottom: bottomPadding, // Add padding for keyboard
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView( // Ensure scroll view
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 48,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hello! let’s join with us',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildTextField('Email', 'assets/images/at_sign.png'),
                    SizedBox(height: 16),
                    _buildTextField('Password', 'assets/images/key.png', obscureText: true),
                    SizedBox(height: 16),
                    _buildTextField('Confirm Password', 'assets/images/key.png', obscureText: true),
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.all(16),
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
                    SizedBox(height: 20), // Space between button and text
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'You already have an account?',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFDE0A26),
                              borderRadius: BorderRadius.circular(158.5),
                            ),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Extra space to avoid bottom overflow
                  ],
                ),
              ),
            ),
          ),
          // Arrow Position
          Positioned(
            top: 60, // Move the arrow up
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginSignup()),
                );
              },
              child: Transform.scale(
                scaleX: -1.0, // Flip horizontally
                child: Image.asset(
                  'assets/images/forward.png',
                  color: Colors.black, // Set color to black
                  width: 46,
                  height: 46,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String iconPath, {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0x69000000),
            offset: Offset(0, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText, // Use the obscureText parameter
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(13),
            child: Image.asset(
              iconPath,
              color: Colors.black.withOpacity(0.4), // Set color with 40% transparency
              width: 25,
              height: 25,
            ),
          ),
          hintText: label,
          hintStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Color(0x66000000),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
