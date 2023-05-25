import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  static String myimageurl =
      "https://media.licdn.com/dms/image/C4D03AQEQG-CoSjn_Vw/profile-displayphoto-shrink_800_800/0/1661972232059?e=1689811200&v=beta&t=2VxmUx1c4fGLpHKWOTlOJjeYJ-tOelhBXkbTnlKL_-I";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                // ignore: prefer_const_constructors
                child: UserAccountsDrawerHeader(
                  accountName: const Text("Siddhant"),
                  accountEmail: const Text("siddhant.sonar20@pccoepune.org"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(myimageurl),
                  ),
                )),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white
              ),
              ),
              
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
