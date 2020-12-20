import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/auth.dart';
import 'package:flutter_app1/screens/home.dart';
import 'package:flutter_app1/domains/user.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Us user = Provider.of<Us>(context);
    final bool isLoggedIn = user != null;

    return  isLoggedIn ? HomePage() : AuthorizationPage();
  }
}