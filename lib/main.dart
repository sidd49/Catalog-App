import 'package:firstapp/pages/home_page.dart';
import 'package:firstapp/pages/login_page.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.lightTheme(context),
          initialRoute: "/home",
          routes: {
            "/": (context) => const LoginPage(),
            "/login": (context) => const LoginPage(),
            "/home": (context) => const HomePage()
          },
    );
  }
}
