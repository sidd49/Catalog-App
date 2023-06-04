import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static Color cremeColor = const Color(0xfff5f5f5);
  static Color darkBlueColor = const Color(0xff403b58);
  static Color darkCreamColor = Vx.gray900;
   static Color lightBluishColor = Vx.indigo500;

  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.white,
      canvasColor: cremeColor,
      splashColor: darkBlueColor,

      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black), 
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium, titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ), 
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple,accentColor: darkBlueColor
      )
      );
 
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      splashColor: lightBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.black, 
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: Theme.of(context).textTheme.copyWith(
              titleLarge:
                  context.textTheme.titleLarge?.copyWith(color: Colors.white),
            ).bodyMedium, titleTextStyle: Theme.of(context).textTheme.copyWith(
              titleLarge:
                  context.textTheme.titleLarge?.copyWith(color: Colors.white),
            ).titleLarge,
        ),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white).copyWith(secondary: Colors.white, brightness: Brightness.dark));
}
