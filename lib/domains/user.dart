import 'package:firebase_auth/firebase_auth.dart';

class Us {
  String id;

  Us.fromFirebase(User user){
    id = user.uid;
  }
}