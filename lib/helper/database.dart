import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
     getUsername(String username){
      Firestore.instance.collection('users').where("name", isEqualTo: username).getDocuments();
     }
     uploadUserFunction(userMap){
       Firestore.instance.collection("users").add(userMap);
     }
}