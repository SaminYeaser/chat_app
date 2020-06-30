import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            TextField(
              style: textFieldStyle(),
              decoration: inputTextDecoration('Email'),
            ),
            TextField(
              style: textFieldStyle(),
              decoration: inputTextDecoration('Password'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
