import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethods{
  getUserByUsername(String username)async {
return FirebaseFirestore.instance.collection("users")
    .where("name", isEqualTo: username);
  }

  uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection(("users"))
        .add(userMap).catchError((e){
      print(e.toString());
    });
  }
}