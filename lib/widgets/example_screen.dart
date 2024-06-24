import 'package:flutter/material.dart';
import '../utils/routes.dart'; // Import your routes.dart file

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          ),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Your Example Screen Content Here',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
