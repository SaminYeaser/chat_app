import 'package:chat_app/helper/constents.dart';
import 'package:chat_app/helper/database.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
class Conversation extends StatefulWidget {
  final String chatRoomId;
  Conversation(this.chatRoomId);
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {

  TextEditingController messageController = new TextEditingController();

DatabaseMethods databaseMethods = new DatabaseMethods();

  Widget ChatMessageList(){

  }
  sendMessages(){
    if(messageController.text.isNotEmpty){
      Map<String, String> messageMap = {
        "message": messageController.text,
        "sendBy": Constants.myName
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              child:Container(
                color: Colors.white30,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                           controller: messageController,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                            hintText:'Message',
                            border: InputBorder.none,
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                          sendMessages();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0x36FFFFFF),
                                    const Color(0x0FFFFFFF)
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("assets/images/send.png")),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
