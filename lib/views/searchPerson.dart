import 'package:chat_app/helper/database.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SearchPerson extends StatefulWidget {
  @override
  _SearchPersonState createState() => _SearchPersonState();
}

class _SearchPersonState extends State<SearchPerson> {
  TextEditingController searchTextEditingController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot querySnapshot;
  initateSearch(){
    databaseMethods.getUsername(searchTextEditingController.text).then((val){
      setState(() {
        querySnapshot = val;
      });
    });
  }

  Widget searchList(){
    return querySnapshot != null ? ListView.builder(
      shrinkWrap: true,
        itemCount: querySnapshot.documents.length,
        itemBuilder: (context, index){
          return SearchTile(
            userName: querySnapshot.documents[index].data['name'],
            email: querySnapshot.documents[index].data['email'],
          );
    }):Container();
  }
  createChatRoomAndStartConvo(String userName){
    List<String> users = [userName,];
    databaseMethods.createChatRoom(chatRoomID, chatRoomMap);
  }
  @override
  void initState() {
    initateSearch();
    super.initState();
  }
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
                  GestureDetector(
                    onTap: (){
                      initateSearch();
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
                        child: Image.asset("assets/images/search_white.png")),
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}
class SearchTile extends StatelessWidget {
  final String userName;
  final String email;

  const SearchTile({Key key, this.userName, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
              Text(
                email,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChatRoomAndStartConvo();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text('Message',
              style: TextStyle(
                fontSize: 16
              ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
