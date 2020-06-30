import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
    title: Text(
      'AlaapCharita'
    ),
  );
}
InputDecoration inputTextDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          color: Colors.white54
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white30)
      ),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red)
      )
  );
}
TextStyle textFieldStyle(){
  return TextStyle(
    color: Colors.white70
  );
}