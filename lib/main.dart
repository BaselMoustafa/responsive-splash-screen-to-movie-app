import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_screen/test.dart';
import 'package:responsive_screen/test.dart';

void main() {
  runApp( DevicePreview(builder:(context)=>MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:GoogleFonts.openSans().fontFamily ,
      ),
      home:  TestScreen(),
    );
  }
}

