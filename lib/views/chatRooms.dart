import 'package:chat_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethod authMethod =  new AuthMethod();
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
                builder: (context)=>
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
    );
  }
}
