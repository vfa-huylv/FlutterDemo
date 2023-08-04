import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.auth, required this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _email = 'huylv@vitalify.asia';
  String _password = '123456';
  FormType _formType = FormType.login;

  bool isValidate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (isValidate()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState!.reset();
    setState(() {
      _formType == FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState!.reset();
    setState(() {
      _formType == FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Authentication'),
        ),
        body: Center(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: inputsPart() + buttonsPart(),
          ),
        )));
  }

  List<Widget> inputsPart() {
    return [
      Padding(
        padding: const EdgeInsets.all(25),
        child: TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Enter your email'),
          validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
          onSaved: (newValue) => _email = newValue!,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Enter your password'),
          obscureText: true,
          validator: (value) =>
              value!.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (newValue) => _password = newValue!,
        ),
      ),
    ];
  }

  List<Widget> buttonsPart() {
    if (_formType == FormType.login) {
      return [
        ElevatedButton(
            onPressed: validateAndSubmit,
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20),
            )),
        TextButton(
          onPressed: moveToRegister,
          child: const Text(
            'Don\'t have an account yet? Sign Up',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ];
    } else {
      return [
        ElevatedButton(
            onPressed: validateAndSubmit,
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 20),
            )),
        TextButton(
          onPressed: moveToLogin,
          child: const Text(
            'Already have an account? Login',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ];
    }
  }
}
