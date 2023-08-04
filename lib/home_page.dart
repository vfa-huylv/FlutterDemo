import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.auth, required this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          TextButton(
              onPressed: signOut,
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to Flutter!!!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
