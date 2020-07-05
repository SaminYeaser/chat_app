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
Stream chatMessagesValue;

  Widget ChatMessageList(){
  return StreamBuilder(
    stream: chatMessagesValue,
    builder: (context, snapshot){
      return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            return MessageTile(
              snapshot.data.documents[index].data['message'],
                snapshot.data.documents[index].data['sendBy'] == Constants.myName);
      }):Container();
    },
  );
  }
  sendMessages(){
    if(messageController.text.isNotEmpty){
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": Constants.myName,
        "time": DateTime.now().millisecondsSinceEpoch
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text = '';
    }
  }
  @override
  void initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value){
      setState(() {
        chatMessagesValue = value;
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: <Widget>[
            ChatMessageList(),
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
class MessageTile extends StatelessWidget {
  final bool isSendByMe;
  final String message;
  MessageTile(this.message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: isSendByMe? 0: 24,right: isSendByMe ? 24: 0),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSendByMe ? [
              const Color(0xff007EF4),
              const Color(0xff2A75BC)
            ]
                : [
              const Color(0x1AFFFFFF),
              const Color(0x1AFFFFFF)
            ],
          ),
              borderRadius: isSendByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23),
              ) : BorderRadius.only(
        topLeft: Radius.circular(23),
        topRight: Radius.circular(23),
        bottomRight: Radius.circular(23),
      )
        ),
        child: Text(message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        ),
      ),
    );
  }
}
