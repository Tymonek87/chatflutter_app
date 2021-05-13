import 'package:chatflutter_app/services/database.dart';
import 'package:chatflutter_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch(){
  databaseMethods
  .getUserByUsername(searchTextEditingController.text)
      .then((val){
    searchSnapshot = val;
  });
}

  Widget searchList(){
    return ListView.builder(
        itemCount: searchSnapshot.docs.length ,
        itemBuilder: (context, index){
      return SearchTile(
        userName: searchSnapshot.docs[index].data['name'],
        userEmail: searchSnapshot.docs[index].data["email"],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: searchTextEditingController,
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                          decoration: InputDecoration(
                            hintText: "search username...",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            border: InputBorder.none
                          ),
                        )),
                    GestureDetector(
                      onTap: (){
                        initiateSearch();
},
                      child: Container(
                        height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0x36FFFFFF),
                                const Color(0x0FFFFFF)
                              ]
                            ),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(12),
                          child: Image.asset("assets/images/search_white.png")),
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
class SearchTile extends StatelessWidget {

  final String userName;
  final String userEmail;
  SearchTile({this.userName,this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(userName, style: simpleTextFieldStyle(),),
              Text(userEmail,style: simpleTextFieldStyle(),)
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Text(
              "messsage"
            ),
          )
        ],
      ),
    );
  }
}
