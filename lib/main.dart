import 'package:flutter/material.dart';
import 'package:flutter_demo/otherpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Drawer widget & Routes'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Ly Van Huy'),
                accountEmail: Text('huylv@vitalify.asia'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/mypic.jpg'),
                  child: Text('H'),
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: Text('D'),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: Text('T'),
                  )
                ],
              ),
              ListTile(
                title: const Text('Page 1'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OtherPage('Page 1')));
                },
              ),
              ListTile(
                  title: const Text('Page 2'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtherPage('Page 2')));
                  }),
              ListTile(
                  title: const Text('Close'),
                  trailing: const Icon(Icons.close),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
        body: const Center(
          child: Text('Home page'),
        ));
  }
}
