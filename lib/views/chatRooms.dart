import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/helper/constents.dart';
import 'package:chat_app/helper/helperFunction.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/searchPerson.dart';
import 'package:chat_app/views/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethod authMethod =  new AuthMethod();

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  getUserInfo() async{
    Constants.myName = await HelperFunction.getUserNameInSharePreferences();
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AlaapCharita'
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              authMethod.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>Authenticate()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>SearchPerson()
          ));
        },
      ),
    );
  }
}
