import 'package:flutter/material.dart';
import 'package:login/view/screens/intro.dart';
import 'package:login/view/screens/login.dart';
import 'package:login/view/screens/register.dart';
import 'package:login/view/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isloggedin = prefs.getBool("isloggedin") ?? false;
  bool issplashvisited = prefs.getBool("isloggedin") ?? false;
  bool isregistered = prefs.getBool("isregistered") ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 
    // (issplashvisited == false)
    //     ? "splash"
    //     :
        (isregistered == false)
            ? "register"
            :
             (isloggedin==false)
                 ?"login"
                 :"/",
    routes: {
      "/": (context) => Home(),
      // "splash": (context) => Splash(),
      "intro": (context) => Intro(),
      "login": (context) => LoginApp(),
      "register":(context) => Register(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final login = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Text("Welcome to home page "),
        ));
  }
}
