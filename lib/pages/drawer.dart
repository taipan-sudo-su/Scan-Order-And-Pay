import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "juit cafetria",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text("www.juitsolan.in"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    // child: Image.asset(
                    //   "assets/images/logo.png",
                    //   height: 90,
                    //   width: 90,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 113, 103),
                // image: DecorationImage(
                //     image: NetworkImage("https://shorturl.at/hqsBG"),
                //     fit: BoxFit.cover)
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text("Account"),
              onTap: () {
                (() => homepage());
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
              onTap: () {
                (() => homepage());
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("cart"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => cart())));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("favorite"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => loginPage())));
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text("orders"),
              onTap: () {
                (() => homepage());
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("logout"),
              onTap: () {
                (() => homepage());
              },
            )
          ],
        ),
      ),
    );
  }
}
