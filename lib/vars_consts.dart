import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String apiKey = 'e87b2f0e609feaa84404a5d956e01fe4';
const String readAccessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODdiMmYwZTYwOWZlYWE4NDQwNGE1ZDk1NmUwMWZlNCIsInN1YiI6IjYxZjBlMzljMWFkOTNiMDA0MzEyYTczMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Isfsu_cEODsRx6RTl9mgzv7EhC3u0xA-Qqc1SwfQszA';

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
