import 'package:flutter/material.dart';
import 'package:flutter_demo/home_page.dart';
import 'login_page.dart';
import 'auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    // Firebase.initializeApp().whenComplete(() {

    // });
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
          auth: widget.auth,
          onSignedIn: signedIn,
        );
      case AuthStatus.signedIn:
        return HomePage(auth: widget.auth, onSignedOut: signedOut);
      default:
        return LoginPage(
          auth: widget.auth,
          onSignedIn: signedIn,
        );
    }
  }
}
