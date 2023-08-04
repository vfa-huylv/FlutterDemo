import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth extends BaseAuth {
  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user!.uid;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    final user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.user!.uid;
  }

  @override
  Future<String> currentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  @override
  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }
}
