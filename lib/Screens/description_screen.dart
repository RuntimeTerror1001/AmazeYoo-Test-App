import 'package:amazeyoo_test_app/Widgets/bottom_app_bar.dart';
import 'package:amazeyoo_test_app/Widgets/cast_view.dart';
import 'package:amazeyoo_test_app/Widgets/data_box.dart';
import 'package:amazeyoo_test_app/Widgets/icon_button.dart';
import 'package:amazeyoo_test_app/Widgets/sub_head.dart';
import 'package:amazeyoo_test_app/vars_consts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';

class DescriptionScreen extends StatefulWidget {
  final String? name, posterURL, description, launchDate;
  final double? vote, popularity;
  final int? movieID;

  const DescriptionScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.posterURL,
    required this.launchDate,
    required this.vote,
    required this.popularity,
    required this.movieID,
  }) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  List credits = [];

  loadCredits() async {
    TMDB tmdbCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map creditResult =
        await tmdbCustomLogs.v3.movies.getCredits(widget.movieID!);

    setState(() {
      credits = creditResult['cast'];
    });
  }

  @override
  void initState() {
    loadCredits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackCol,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstATop),
                              image: NetworkImage(widget.posterURL!),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const iconButton(
                                        icon: EvaIcons.arrowIosBackOutline)),
                                const iconButton(icon: EvaIcons.castOutline)
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(widget.name ?? 'TBA',
                                  style: kHeadText.copyWith(fontSize: 30),
                                  textAlign: TextAlign.center),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  widget.vote == null
                                      ? Container()
                                      : DataBox(text: '${widget.vote}'),
                                  widget.launchDate == null
                                      ? Container()
                                      : DataBox(text: '${widget.launchDate}'),
                                  widget.popularity == null
                                      ? Container()
                                      : DataBox(text: '${widget.popularity}')
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text('Movie',
                          style: kLightText.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 30),
                      child: LinearProgressIndicator(
                        color: Color.fromRGBO(151, 109, 59, 1),
                        backgroundColor: Color.fromRGBO(151, 109, 59, 0.4),
                        value: 0.5,
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        width: 370,
                        decoration: kButtonDec,
                        child: Center(
                          child: Text(
                            'Continue Watch',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SubHead(text: 'The Cast'),
                    credits.isEmpty || credits == null
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text('Loading...',
                                  style: kHeadText.copyWith(fontSize: 20)),
                            ),
                          )
                        : CastView(castList: credits),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Text('Synopsis',
                          style: kHeadText.copyWith(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('${widget.description}',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(color: Colors.white70)),
                    ),
                    const SizedBox(height: 75),
                  ],
                ),
              ),
            ),
            const bottomAppBar(),
          ],
        ),
      ),
    );
  }
}
