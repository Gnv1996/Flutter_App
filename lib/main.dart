import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'widgets/drawer.dart';
import 'widgets/theme.dart';
import './pages/profileScreen.dart';
import './pages/registration_page.dart';
import './pages/contactForm.dart';
import './pages/faq_page.dart';
import './pages/chat_message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: MyRoutes.loginRoute,
      debugShowCheckedModeBanner: false, // Set initial route to loginRoute
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.profileRoute: (context) => ProfileScreen(),
        MyRoutes.signUpRoute: (context) => RegistrationPage(),
        MyRoutes.contactRoute: (context) => ContactForm(),
        MyRoutes.faqRoute: (context) => FAQPage(),
        MyRoutes.chatRoute: (context) => ChatScreen(),
        // Add more routes as needed
      },
    );
  }
}
