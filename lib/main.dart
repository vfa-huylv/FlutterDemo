import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert Dialog demo'),
            content: const Text('Would you like to close this?'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close))
            ],
          );
        });
  }

  final showSnackBar =
      const SnackBar(content: Text('This is a snack bar demo!'));

  void showSimpleDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Get picture options'),
            children: [
              SimpleDialogOption(
                child: const Text('Take a new picture'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: const Text('Select from gallery'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
                },
                child: const Text('Show SnackBar')),
            ElevatedButton(
                onPressed: () {
                  showAlertDialog();
                },
                child: const Text('Show Alert Dialog')),
            ElevatedButton(
                onPressed: () {
                  showSimpleDialog();
                },
                child: const Text('Show Simple Dialog')),
          ],
        ),
      ),
    );
  }
}
