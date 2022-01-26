import 'package:amazeyoo_test_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kRBoxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: GoogleFonts.openSans(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            'Parth D.',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(EvaIcons.bellOutline,
                            color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Movies',
                          style: GoogleFonts.ptSans(
                              color: Colors.white, fontSize: 18)),
                      Text('TV Shows',
                          style: GoogleFonts.ptSans(
                              color: Colors.white30, fontSize: 18)),
                      Text('Anime',
                          style: GoogleFonts.ptSans(
                              color: Colors.white30, fontSize: 18)),
                      Text('My List',
                          style: GoogleFonts.ptSans(
                              color: Colors.white30, fontSize: 18))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
