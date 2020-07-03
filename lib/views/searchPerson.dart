import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
class SearchPerson extends StatefulWidget {
  @override
  _SearchPersonState createState() => _SearchPersonState();
}

class _SearchPersonState extends State<SearchPerson> {
  TextEditingController searchTextEditingController = new TextEditingController();
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
                        controller: searchTextEditingController,
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
                  Container(
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
                      child: Image.asset("assets/images/search_white.png"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
