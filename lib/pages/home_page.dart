import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(18, 0, 14, 29),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  'assets/images/menu.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: 35,
                              height: 35,
                              padding: EdgeInsets.fromLTRB(12, 31, 13, 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFC30010),
                                  borderRadius: BorderRadius.circular(88),
                                ),
                                child: Container(
                                  width: 10,
                                  height: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 242,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 36, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC30010),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Container(
                                    width: 123,
                                    height: 43,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 13, 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        'assets/images/search.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        'assets/images/shopping_cart.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 26, 387),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            right: -124,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment(1, -1),
                                  end: Alignment(-0.211, 0.24),
                                  colors: <Color>[Color(0xFF210535), Color(0xFF430D4B)],
                                  stops: <double>[0, 1],
                                ),
                              ),
                              child: Container(
                                width: 114,
                                height: 146,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                          begin: Alignment(1, -1),
                                          end: Alignment(-0.211, 0.24),
                                          colors: <Color>[Color(0xFF210535), Color(0xFF430D4B)],
                                          stops: <double>[0, 1],
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(3, 115, 4, 19),
                                        child: Text(
                                          'Essentials for Gamers',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                          begin: Alignment(1, -1),
                                          end: Alignment(-0.211, 0.24),
                                          colors: <Color>[Color(0xFF430D4B), Color(0xFF210535)],
                                          stops: <double>[0, 1],
                                        ),
                                      ),
                                      child: Container(
                                        height: 146,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        begin: Alignment(1, -0.904),
                                        end: Alignment(-1, 1),
                                        colors: <Color>[Color(0xFF7B337D), Color(0xFFC874B2)],
                                        stops: <double>[0.511, 1],
                                      ),
                                    ),
                                    child: Container(
                                      height: 146,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: -2,
                            top: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/bundle_v_311.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 117,
                                height: 117,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 54),
                    child: SizedBox(
                      width: 76,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 66, 0, 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: 24,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xFFD1001F),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          offset: Offset(1, 2),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFFD1001F),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          offset: Offset(1, 2),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(37),
                                  color: Color(0xFFC30010),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  width: 74,
                                  height: 74,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 12,
                              top: 1,
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
                    ),
                  ),
                  SizedBox(
                    height: 91,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 14),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFECECEC),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 62,
                              padding: EdgeInsets.fromLTRB(0, 44, 251, 13),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5),
                                  color: Color(0xFFF94449),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(1, 2),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  width: 5,
                                  height: 5,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 52,
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/images/male_user.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 29,
                                height: 90,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 138,
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/images/discount.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 29,
                                height: 90,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 141,
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/images/bookmark.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 29,
                                height: 90,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 55,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/images/home.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 29,
                                height: 90,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 15,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/logo_mytek_176_px_inverse_12000001.png',
                    ),
                  ),
                ),
                child: Container(
                  width: 119,
                  height: 49,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}