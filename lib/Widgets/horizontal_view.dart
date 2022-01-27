import 'package:amazeyoo_test_app/Screens/description_screen.dart';
import 'package:flutter/material.dart';

class RecentView extends StatelessWidget {
  final List refList;
  const RecentView({Key? key, required this.refList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: refList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                                name: refList[index]['title'],
                                description: refList[index]['overview'],
                                posterURL: 'https://image.tmdb.org/t/p/w500' +
                                    refList[index]['backdrop_path'],
                                launchDate: refList[index]['release_date'],
                                vote: refList[index]['vote_average'],
                                popularity: refList[index]['popularity'],
                                movieID: refList[index]['id'],
                              )));
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                            refList[index]['poster_path']),
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            );
          }),
    );
  }
}
