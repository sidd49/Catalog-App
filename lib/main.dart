import 'package:firstapp/pages/cart_page.dart';
import 'package:firstapp/pages/home_page.dart';
import 'package:firstapp/pages/login_page.dart';
import 'package:firstapp/utils/my_routes.dart';
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
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          debugShowCheckedModeBanner: false,
          initialRoute: MyRoutes.homeRoute,
          routes: {
            "/": (context) => const LoginPage(),
            MyRoutes.loginRoute: (context) => const LoginPage(),
            MyRoutes.homeRoute: (context) => const HomePage(),
            MyRoutes.cartRoute:(context) => const CartPage()
            
          },
    );
  }
}
