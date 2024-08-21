import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart'; // Import the Signup widget
import 'login_signup.dart'; // Import your LoginSignup widget

class SignIn extends StatelessWidget {
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
                // Background ellipses
                Positioned(
                  left: -543,
                  top: 370,
                  child: SizedBox(
                    width: 940,
                    height: 752,
                    child: SvgPicture.asset('assets/vectors/ellipse_1_x2.svg'),
                  ),
                ),
                Positioned(
                  left: -364,
                  top: 612,
                  child: SizedBox(
                    width: 816,
                    height: 718,
                    child: SvgPicture.asset('assets/vectors/ellipse_21_x2.svg'),
                  ),
                ),
                // Red circle
                Positioned(
                  right: -204,
                  top: -32,
                  child: Container(
                    width: 285,
                    height: 285,
                    decoration: BoxDecoration(
                      color: Color(0xFFD1001F),
                      borderRadius: BorderRadius.circular(142.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Back arrow
          Positioned(
            top: 60, // Adjust this value to move the arrow up or down
            left: 20, // Adjust this value to move the arrow left or right
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignup()),
                ); // Navigate to the LoginSignup page
              },
              child: Transform.scale(
                scaleX: -1.0, // Flip horizontally
                child: Image.asset(
                  'assets/images/forward.png',
                  color: Colors.black,
                  width: 46,
                  height: 46,
                ),
              ),
            ),
          ),
          // Main content
          Positioned.fill(
            top: 100, // Adjust this value to move content down
            bottom: bottomPadding, // Add padding for keyboard
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView( // Ensure scroll view
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60), // Space for the arrow
                    // Welcome text
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        color: Color(0xFF1C1C1C),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hey! Good to see you again',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Email text field
                    _buildTextField('Email', 'assets/images/at_sign.png'),
                    SizedBox(height: 16),
                    // Password text field
                    _buildTextField('Password', 'assets/images/key.png'),
                    SizedBox(height: 20),
                    // Forgot password text
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forget password?',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Sign In button
                    GestureDetector(
                      onTap: () {
                        // Handle sign in action
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
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
                    SizedBox(height: 20), // Space between button and text
                    // Sign up prompt
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You don’t have an account? ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            ); // Navigate to the Signup page
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFDE0A26),
                              borderRadius: BorderRadius.circular(158.5),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up',
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
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String iconPath) {
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
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(13),
            child: Image.asset(
              iconPath,
              color: Colors.black.withOpacity(0.4),
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
        obscureText: label == 'Password', // Hide text for password field
      ),
    );
  }
}
