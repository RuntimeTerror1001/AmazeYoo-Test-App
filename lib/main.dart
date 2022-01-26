import 'package:amazeyoo_test_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AmazeYooTestApp());
}

class AmazeYooTestApp extends StatelessWidget {
  const AmazeYooTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
