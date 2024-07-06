import 'dart:async';

import 'package:exam_advance/screen/home/homescreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
    return Scaffold(
      backgroundColor: Color(0xffEDF7EF),
      body: Container(
        height: 800,
        width: 800,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img/logo.png'))),
      ),
    );
  }
}
