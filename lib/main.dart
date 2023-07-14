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
      home: const MyHomePage(title: 'Flutter Demo Input And Selection Widgets'),
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
  int radioValue = 1;
  bool checkbox1Value = false;
  bool checkbox2Value = false;
  bool checkbox3Value = false;
  bool switchValue = true;

  void radioFunc(value) {
    setState(() {
      radioValue = value;
    });
  }

  void checkbox1Func(value) {
    setState(() {
      checkbox1Value = value;
    });
  }

  void checkbox2Func(value) {
    setState(() {
      checkbox2Value = value;
    });
  }

  void checkbox3Func(value) {
    setState(() {
      checkbox3Value = value;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Registration Form',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your username'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your password'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your password again'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text('Gender'),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (rVal) {
                        radioFunc(rVal);
                      },
                      title: const Text('Male'),
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (rVal) {
                        radioFunc(rVal);
                      },
                      title: const Text('Female'),
                    ),
                    RadioListTile(
                      value: 3,
                      groupValue: radioValue,
                      onChanged: (rVal) {
                        radioFunc(rVal);
                      },
                      title: const Text('Others'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text('Hobbies'),
                    ),
                    CheckboxListTile(
                      value: checkbox1Value,
                      onChanged: (cbVal) {
                        checkbox1Func(cbVal);
                      },
                      title: const Text('Coding'),
                    ),
                    CheckboxListTile(
                      value: checkbox2Value,
                      onChanged: (cbVal) {
                        checkbox2Func(cbVal);
                      },
                      title: const Text('Cooking'),
                    ),
                    CheckboxListTile(
                      value: checkbox3Value,
                      onChanged: (cbVal) {
                        checkbox3Func(cbVal);
                      },
                      title: const Text('Running'),
                    ),
                  ],
                ),
                SwitchListTile(
                    value: switchValue,
                    activeColor: Colors.red,
                    title: const Text('Active'),
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = value;
                      });
                    }),
                const ElevatedButton(onPressed: null, child: Text('Sign up'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
