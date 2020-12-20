import 'package:flutter/material.dart';
// import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/screens/landing.dart';
// import 'domains/workout.dart';
// import 'screens/home.dart';


void main() => runApp(sportManagingApp());

class sportManagingApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'sport Managing App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(195, 154, 219, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.purple))
      ),
      home: LandingPage(),

    );
  }
}
