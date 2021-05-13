import 'package:chatflutter_app/services/auth.dart';
import 'package:chatflutter_app/helper/authenticate.dart';
import 'package:chatflutter_app/view/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthMethods authMethods = new AuthMethods();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png",
        height: 50,),
        actions: [
          GestureDetector(
            onTap: (){
                authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Authenticate()
              ));
              },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 ),
              child: Container(child: Icon(Icons.exit_to_app)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (contex) => SearchScreen()
          ));
        },
      ),
    );
  }
}
