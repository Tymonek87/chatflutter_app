import 'package:chatflutter_app/modal/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
final FirebaseAuth _auth = FirebaseAuth.instance;


///Condition ? True : False
UserId _userFromFirebaseUser (User user) {
  return user != null ? UserId (uid: user.uid) : null;
}

Future signInWithEmailAndPassword(String email, String password) async {
  try {
UserCredential result = await _auth.signInWithEmailAndPassword
  (email: email, password: password);
User user = result.user;
return _userFromFirebaseUser(user);
  }catch (e) {
print(e);
  }
}

Future signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}


Future resetPass(String email)async {
  try{
    return await _auth.sendPasswordResetEmail(email: email);
  }catch (e){
    print(e.toString());
  }
}

Future signOut() async{
  try{
    return await _auth.signOut();
  }catch(e){

  }
}
}