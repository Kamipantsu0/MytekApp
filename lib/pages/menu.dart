import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(58),
          bottomRight: Radius.circular(58),
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(21, 93, 21, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(11, 0, 11, 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/ellipse_8.png',
                          ),
                        ),
                      ),
                      child: Container(
                        width: 58,
                        height: 58,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(11, 0, 11, 7),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Ameni Amdouni',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(11, 0, 9.9, 65),
                  child: Text(
                    'AmdouniAmeni663@gmail.com',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w200,
                      fontSize: 10,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              top: 220, // Moved up slightly
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/bill.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 23,
                      height: 71,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'My Order',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 265, // Moved up slightly
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/male_user_1.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 23,
                      height: 71,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'My Profile',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 310, // Moved up slightly
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/location.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 23,
                      height: 71,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Delivery Address',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 355, // Moved up slightly
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/coin_in_hand.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 23,
                      height: 71,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Payment Methods',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 400, // Moved up slightly
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/support.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 23,
                      height: 71,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Contact Us',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 445, // Moved up slightly
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/help.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 23,
                      height: 71,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Helps and FAQs',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -8,
              top: -106,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/images/close.png',
                    ),
                  ),
                ),
                child: Container(
                  width: 38,
                  height: 117,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
