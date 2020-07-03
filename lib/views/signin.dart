import 'package:chat_app/helper/database.dart';
import 'package:chat_app/helper/helperFunction.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'chatRooms.dart';

class SignIn extends StatefulWidget {
  final Function toogle;
  SignIn(this.toogle);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthMethod authMethod = new AuthMethod();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  bool loading = false;
  QuerySnapshot snapShotUserInfo;
  final formkey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController =
  new TextEditingController();
  TextEditingController passwordTextEditingController =
  new TextEditingController();

  signIn(){
    if(formkey.currentState.validate()){

      HelperFunction.saveUserEmailInSharePreferences(emailTextEditingController.text);

      setState(() {
        loading = true;
      });

      databaseMethods.getUserByUserEmail(emailTextEditingController.text).then((val){
        snapShotUserInfo = val;
      });

      authMethod.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((value){
        if(value!=null) {

          HelperFunction.saveUserLoggedInSharePreferences(true);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => ChatRoom()
          ));
        }
      });


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)
                              ? null
                              : "Please provide a valid email";
                        },
                        controller: emailTextEditingController,
                        style: textFieldStyle(),
                        decoration: inputTextDecoration('Email'),
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.length < 6
                              ? "Your password should be longer than 6+"
                              : null;
                        },
                        controller: passwordTextEditingController,
                        style: textFieldStyle(),
                        decoration: inputTextDecoration('Password'),
                      ),
                    ],
                  ),
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
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC)
                        ]
                      )
                    ),
                    child: Text('Sign in',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white
                  ),
                  child: Text('Sign In with Google',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: (){
                        widget.toogle();
                      },
                      child: Container(
                        child: Text('Register',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 17
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
