import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUsername(String username) async {
    return await Firestore.instance.collection('users').where(
        "name", isEqualTo: username).getDocuments();
  }

  getUserByUserEmail(String email) async {
    return await Firestore.instance.collection("users").where(
        "email", isEqualTo: email).getDocuments();
  }

  uploadUserFunction(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  createChatRoom(String chatRoomID, chatRoomMap) {
    Firestore.instance.collection("Chatroom").document(chatRoomID).setData(
        chatRoomMap).catchError((e) {
      print(e.toString());
    });
  }

  addConversationMessages(String chatRoomId, messageMap) {
    Firestore.instance.collection('ChatRoom').document(chatRoomId).collection(
        'chats').
    add(messageMap).catchError((e) {
      print(e.toString());
    });
  }

  getConversationMessages(String chatRoomId) async{
    return await Firestore.instance.collection('ChatRoom').document(chatRoomId).collection('chats').orderBy('time', descending: true).
    snapshots();
  }
  getChatRoom(String username){
    return  Firestore.instance.collection("ChatRoom").where("users", arrayContains: username).snapshots();
  }
}

