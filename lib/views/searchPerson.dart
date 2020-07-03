import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
class SearchPerson extends StatefulWidget {
  @override
  _SearchPersonState createState() => _SearchPersonState();
}

class _SearchPersonState extends State<SearchPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: <Widget>[
             Container(
               color: Colors.white30,

               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText:'Search Username',
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  Image.asset("assets/images/search_white.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
