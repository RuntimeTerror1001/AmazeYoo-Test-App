import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kBackCol = Color.fromRGBO(20, 20, 20, 1);

var kCatTextStyle = GoogleFonts.ptSans(color: Colors.white, fontSize: 18);

var kButtonDec = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [Colors.white, Color.fromRGBO(151, 109, 59, 1)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ));

var kLightText = GoogleFonts.openSans(color: Colors.white70, fontSize: 15);

var kHeadText = GoogleFonts.poppins(
    fontWeight: FontWeight.w500, color: Colors.white, fontSize: 25);
