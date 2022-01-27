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
                onTap: () {},
                child: Container(
                  width: 120,
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
