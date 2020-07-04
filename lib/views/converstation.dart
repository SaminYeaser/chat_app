import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Stack(
        children: <Widget>[

        ],
      ),
    );
  }
}
