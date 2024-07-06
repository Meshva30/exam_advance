import 'package:exam_advance/screen/home/homescreen.dart';
import 'package:exam_advance/screen/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: Splashscreen(),
    );
  }
}
