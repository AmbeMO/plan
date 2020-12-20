import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app1/domains/user.dart';

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<Us> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return Us.fromFirebase(user);
    }catch(e){
      return null;
    }
  }

  Future<Us> registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return Us.fromFirebase(user);
    }catch(e){
      return null;
    }
  }

  Future logOut() async{
    await _fAuth.signOut();
  }


  Stream<Us> get currentUser{
    return _fAuth.authStateChanges().map((User user) => user != null ? Us.fromFirebase(user) : null);
  }
}