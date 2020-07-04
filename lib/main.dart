//import 'package:chat_app/views/signin.dart';
import 'package:chat_app/helper/helperFunction.dart';
import 'package:chat_app/views/chatRooms.dart';
import 'package:chat_app/views/signup.dart';
import 'package:flutter/material.dart';

import 'helper/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool  userIsLoggedIn = false;
  @override
  void initState() {
    getLoggedIn();
    super.initState();
  }
  getLoggedIn() async{
    await HelperFunction.getUserLoggedInSharePreferences().then((value){
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn ? ChatRoom(): Authenticate()
    );
  }
}
class IamBlank extends StatefulWidget {
  @override
  _IamBlankState createState() => _IamBlankState();
}

class _IamBlankState extends State<IamBlank> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
