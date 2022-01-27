import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class subHead extends StatelessWidget {
  final String text;
  const subHead({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: GoogleFonts.poppins(color: Colors.white)),
          Text('See All', style: GoogleFonts.poppins(color: Colors.white54)),
        ],
      ),
    );
  }
}
