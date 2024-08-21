import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(58),
          bottomRight: Radius.circular(58),
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
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
    );
  }
}