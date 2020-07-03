import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
     getUsername(String username) async{
      return await Firestore.instance.collection('users').where("name", isEqualTo: username).getDocuments();
     }
     uploadUserFunction(userMap){
       Firestore.instance.collection("users").add(userMap);
     }
     createChatRoom(String chatRoomID, chatRoomMap){
       Firestore.instance.collection("Chatroom").document(chatRoomID).setData(chatRoomMap).catchError((e){
         print(e.toString());
       });
     }
}