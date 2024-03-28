
import 'package:flutter/material.dart';
import 'package:another_baikka_project/pages/home.dart';
import 'package:another_baikka_project/pages/choose_location.dart';
import 'package:another_baikka_project/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) => ChooseLocation(),
    },
  ));
}


