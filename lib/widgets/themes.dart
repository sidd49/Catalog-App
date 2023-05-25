import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color cremeColor = const Color(0xfff5f5f5);
  static Color darkBlueColor = const Color(0xff403b58);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
