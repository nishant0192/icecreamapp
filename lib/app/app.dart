import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecreamapp/app/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
        home: const Homeview());
  }
}
