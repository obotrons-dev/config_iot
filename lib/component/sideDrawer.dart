import 'package:flutter/material.dart';


class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFFEF5ED);
    return Container(
      child: SafeArea(child: Drawer(
        child: ListView(
          children: [
            Container(
              color: background,
              child: DrawerHeader(
               child: Image.asset('images/chirstmas.png'),
              ),
            ) ,
            // ListTile(
            //   title: Text("setting"),
            //   leading: Icon(Icons.settings),
            //   onTap: () => Navigator.pushReplacementNamed(context, 'setting'),
            // ),
            ListTile(
              title: Text("config"),
              leading: Icon(Icons.person),
              onTap: () => Navigator.pushReplacementNamed(context, 'config'),
            ),
            ListTile(
              title: Text("Sign Out"),
              leading: Icon(Icons.logout),
              onTap: () => Navigator.pushReplacementNamed(context, 'login'),
            ),
          ],
        ),
      ),
    )
    );
  }
}
