import 'package:flutter/material.dart';
import 'package:login_db/Persondata_provider.dart';
import 'package:login_db/ProfilePage.dart';
import 'package:login_db/UpdatePage.dart';
import 'package:provider/provider.dart';

import 'CreateAccountPage.dart';
import 'LoginPage.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PersonProvider())
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev by Zaw Moe Naing',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Primary color for the app
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal, // Button background color
          textTheme: ButtonTextTheme.primary, // Button text color
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners for input fields
          ),
          labelStyle: TextStyle(color: Colors.teal),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        cardColor: Colors.red, // Background color for cards
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        // FirstPage.routeName : (context) => FirstPage(),
        // SecondPage.routeName : (context) => SecondPage(),
        LoginPage.routeName : (context) => LoginPage(),
        Createaccountpage.routeName : (context) => Createaccountpage(),
        Profilepage.routeName : (context) => Profilepage(),
        Updatepage.routeName : (context) => Updatepage()
      },
    );
  }
}


