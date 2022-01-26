import 'package:flutter/material.dart';

const kBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color.fromRGBO(30, 26, 23, 1), Color.fromRGBO(37, 34, 31, 1)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter));

const kRBoxDecoration = BoxDecoration(
    gradient: RadialGradient(
        colors: [Color.fromRGBO(30, 26, 23, 1), Color.fromRGBO(37, 34, 31, 1)],
        center: Alignment.center,
        radius: double.infinity));
