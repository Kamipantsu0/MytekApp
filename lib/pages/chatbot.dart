import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Chatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(91),
          topRight: Radius.circular(113),
          bottomRight: Radius.circular(156),
        ),
        gradient: RadialGradient(
          center: Alignment(0.551, -0.955),
          radius: 1.17,
          colors: <Color>[Color(0xFFC30010), Color(0xFFD1001F)],
          stops: <double>[0.348, 1],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x4F000000),
            offset: Offset(-8, 18),
            blurRadius: 3.5999999046,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 29,
              right: 12,
              top: 26,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Container(
                  width: 280,
                  height: 262,
                ),
              ),
            ),
            Text(
              'عسلامة كيفاش نجمو نعاونوك ؟',
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xFF000000),
              ),
            ),
            Positioned(
              right: 25,
              bottom: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x8FB3B3B3),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Container(
                  width: 254,
                  height: 183,
                ),
              ),
            ),
            Positioned(
              right: 25,
              bottom: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF9F9E9E),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(62),
                    topRight: Radius.circular(62),
                    bottomRight: Radius.circular(19),
                    bottomLeft: Radius.circular(19),
                  ),
                ),
                child: Container(
                  width: 254,
                  height: 24,
                ),
              ),
            ),
            Positioned(
              left: 68,
              bottom: 68,
              child: SizedBox(
                height: 29,
                child: Text(
                  '...',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    letterSpacing: 6,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 34,
              bottom: 67,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/images/keyboard.png',
                    ),
                  ),
                ),
                child: Container(
                  width: 16,
                  height: 18,
                ),
              ),
            ),
            Positioned(
              left: 42,
              top: 28,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/images/chatgpt_robot_happy_raising_left_arm.png',
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4F000000),
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  width: 51,
                  height: 81,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}