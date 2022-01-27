import 'package:amazeyoo_test_app/Widgets/bottom_app_bar.dart';
import 'package:amazeyoo_test_app/Widgets/icon_button.dart';
import 'package:amazeyoo_test_app/Widgets/horizontal_view.dart';
import 'package:amazeyoo_test_app/Widgets/sub_head.dart';
import 'package:amazeyoo_test_app/Widgets/trending_view.dart';
import 'package:amazeyoo_test_app/vars_consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String apiKey = 'e87b2f0e609feaa84404a5d956e01fe4';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODdiMmYwZTYwOWZlYWE4NDQwNGE1ZDk1NmUwMWZlNCIsInN1YiI6IjYxZjBlMzljMWFkOTNiMDA0MzEyYTczMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Isfsu_cEODsRx6RTl9mgzv7EhC3u0xA-Qqc1SwfQszA';
  List trendingMovies = [];
  List recentWatched = [];
  List myFav = [];

  loadMovies() async {
    TMDB tmdbCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbCustomLogs.v3.trending.getTrending();
    Map recentResult = await tmdbCustomLogs.v3.movies.getNowPlaying();
    Map favResult = await tmdbCustomLogs.v3.movies.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      recentWatched = recentResult['results'];
      myFav = favResult['results'];
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackCol,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
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
                            style: kLightText,
                          ),
                          Text(
                            'Parth D.',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20),
                          )
                        ],
                      ),
                      const Spacer(),
                      const iconButton(icon: EvaIcons.bellOutline),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Movies', style: kCatTextStyle),
                      Text('TV Shows',
                          style: kCatTextStyle.copyWith(color: Colors.white30)),
                      Text('Anime',
                          style: kCatTextStyle.copyWith(color: Colors.white30)),
                      Text('My List',
                          style: kCatTextStyle.copyWith(color: Colors.white30))
                    ],
                  ),
                ),
                TrendingView(trending: trendingMovies),
                Center(
                  child: Text(
                    'Episode 1',
                    style: kLightText,
                  ),
                ),
                Center(
                  child: Text(
                    'Pow Pow',
                    style: kHeadText,
                  ),
                ),
                const Center(
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: 1,
                    decorator: DotsDecorator(
                        color: Colors.white30,
                        activeColor: Colors.white,
                        size: Size.fromRadius(3),
                        activeSize: Size.fromRadius(3)),
                  ),
                ),
                const subHead(text: 'Recent Watched'),
                RecentView(refList: recentWatched),
                const subHead(text: 'My Favourites'),
                RecentView(refList: myFav),
              ],
            ),
          ),
          bottomAppBar()
        ]),
      ),
    );
  }
}
