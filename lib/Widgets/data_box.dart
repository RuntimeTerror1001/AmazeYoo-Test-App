import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataBox extends StatelessWidget {
  const DataBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: GoogleFonts.poppins(color: Colors.white)),
    );
  }
}
