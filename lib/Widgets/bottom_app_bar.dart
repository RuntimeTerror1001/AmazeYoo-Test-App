import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class bottomAppBar extends StatelessWidget {
  const bottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 8,
      left: 8,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(51, 46, 37, 0.85),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(EvaIcons.homeOutline, color: Colors.white70, size: 23),
            Icon(EvaIcons.playCircleOutline, color: Colors.white38, size: 23),
            Icon(EvaIcons.searchOutline, color: Colors.white38, size: 23),
            Icon(EvaIcons.heartOutline, color: Colors.white38, size: 23),
            Icon(EvaIcons.personOutline, color: Colors.white38, size: 23)
          ],
        ),
      ),
    );
  }
}
