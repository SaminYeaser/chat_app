import 'package:chat_app/models/user.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFormFirebaseUser(FirebaseUser user){
    return user != null ? User(userId: user.uid) : null;
  }
  Future signInWithEmailandPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFormFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }
  Future signUpWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFormFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }
  Future resetPassword(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }
  Future signOut(String email) async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}
