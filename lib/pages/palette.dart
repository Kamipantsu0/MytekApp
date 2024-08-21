import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.fromLTRB(0, 292, 0, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/orien_nebula_color_palettesq_1.jpeg',
                ),
              ),
            ),
            child: Container(
              width: 311,
              height: 311,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/c_60_b_65_c_84_b_36_f_2576_ea_664_d_11_c_4271_a_1.png',
                  ),
                ),
              ),
              child: Container(
                width: 311,
                height: 467,
              ),
            ),
          ),
        ],
      ),
    );
  }
}