import 'package:flutter/material.dart';

class CastView extends StatelessWidget {
  final List castList;
  const CastView({Key? key, required this.castList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: castList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                          castList[index]['profile_path']),
                      fit: BoxFit.fill,
                    )),
              ),
            );
          }),
    );
  }
}
