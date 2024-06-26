import 'package:flutter/material.dart';
import '../utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    final imgUrl =
        "https://unsplash.com/photos/man-in-black-hoodie-wearing-black-framed-eyeglasses-3JmfENcL24M"; // Replace with your image URL
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text("Gautam Kumar"),
            accountEmail: Text("kumargautam@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/man.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context,
                  MyRoutes.homeRoute); // Use popAndPushNamed to navigate
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(
                  context, '/profile'); // Replace with your profile route
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            onTap: () {
              Navigator.popAndPushNamed(context,
                  MyRoutes.chatRoute); // Use popAndPushNamed to navigate
            },
          ),
          ListTile(
            leading: Icon(Icons.format_quote),
            title: Text('FAQ S'),
            onTap: () {
              Navigator.popAndPushNamed(context,
                  MyRoutes.faqRoute); // Use popAndPushNamed to navigate
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text('Contact'),
            onTap: () {
              Navigator.popAndPushNamed(context,
                  MyRoutes.contactRoute); // Use popAndPushNamed to navigate
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(), // Divider line
                    ListTile(
                      leading: Icon(Icons.login),
                      title: Text('Login'),
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context,
                            MyRoutes
                                .loginRoute); // Use popAndPushNamed to navigate
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
