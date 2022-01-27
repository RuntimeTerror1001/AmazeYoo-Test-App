import 'package:amazeyoo_test_app/Screens/description_screen.dart';
import 'package:amazeyoo_test_app/vars_consts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class TrendingView extends StatelessWidget {
  final List trending;

  const TrendingView({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: trending.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.75), BlendMode.dstATop),
                        image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                            trending[index]['backdrop_path']),
                        fit: BoxFit.fill)),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          //Navigate to Description Screen
                          MaterialPageRoute(
                              builder: (context) => DescriptionScreen(
                                    name: trending[index]['title'],
                                    description: trending[index]['overview'],
                                    posterURL:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    launchDate: trending[index]['release_date'],
                                    vote: trending[index]['vote_average'],
                                    popularity: trending[index]['popularity'],
                                    movieID: trending[index]['id'],
                                  )));
                    },
                    //Center - Play Button
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: kButtonDec,
                      child: const Icon(EvaIcons.arrowRightOutline,
                          color: Colors.white, size: 35),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
