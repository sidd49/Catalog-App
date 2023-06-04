import 'package:firstapp/pages/cart_page.dart';
import 'package:firstapp/pages/home_page.dart';
import 'package:firstapp/pages/item_details.dart';
import 'package:firstapp/pages/login_page.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
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
            "/home": (context) => const HomePage(),
            "/cart":(context) => const CartPage()
            
          },
    );
  }
}
