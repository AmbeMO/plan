import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/services/auth.dart';
import 'package:flutter_app1/screens/landing.dart';
import 'package:flutter_app1/domains/workout.dart';
import 'package:flutter_app1/domains/user.dart';
import 'screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); await Firebase.initializeApp();
runApp(sportManagingApp());}

class sportManagingApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamProvider<Us>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        title: 'sport Managing App',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(195, 154, 219, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.purple))
        ),
        home: LandingPage(),

      ),
    );
  }
}
