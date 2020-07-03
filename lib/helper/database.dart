import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
     getUsername(String username){

     }
     uploadUserFunction(userMap){
       Firestore.instance.collection("users").add(userMap);
     }
}