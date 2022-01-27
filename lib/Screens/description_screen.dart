import 'package:amazeyoo_test_app/Widgets/bottom_app_bar.dart';
import 'package:amazeyoo_test_app/vars_consts.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackCol,
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            const bottomAppBar(),
          ],
        ),
      ),
    );
  }
}
