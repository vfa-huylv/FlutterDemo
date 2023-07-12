import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Car',
  'Motorbike',
  'Bike',
];
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
      home: const AppBarAndTabbar(),
    );
  }
}

class AppBarAndTabbar extends StatelessWidget {
  const AppBarAndTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color oddItemColorCar = colorScheme.secondary.withOpacity(0.05);
    final Color evenItemColorCar = colorScheme.secondary.withOpacity(0.15);
    final Color oddItemColorMotorbike = Colors.green.withOpacity(0.05);
    final Color evenItemColorMotorbike = Colors.green.withOpacity(0.15);
    final Color oddItemColorBike = Colors.yellow.withOpacity(0.05);
    final Color evenItemColorBike = Colors.yellow.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vehicle list'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          leading: const Icon(Icons.menu),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.settings))
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.directions_car),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.motorcycle),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.directions_bike),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: [
                ListTile(
                  tileColor: oddItemColorCar,
                  title: const Text('Honda'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorCar,
                  title: const Text('Toyota'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorCar,
                  title: const Text('Mercedes'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorCar,
                  title: const Text('Audi'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorCar,
                  title: const Text('Porsche'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorCar,
                  title: const Text('VinFast'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorCar,
                  title: const Text('Lexus'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorCar,
                  title: const Text('Hyundai'),
                  trailing: const Icon(Icons.directions_car_filled_rounded),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  tileColor: oddItemColorMotorbike,
                  title: const Text('Honda'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorMotorbike,
                  title: const Text('Yamaha'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorMotorbike,
                  title: const Text('Suzuki'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorMotorbike,
                  title: const Text('Piaggio'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorMotorbike,
                  title: const Text('Ducati'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorMotorbike,
                  title: const Text('SYM'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorMotorbike,
                  title: const Text('KTM'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorMotorbike,
                  title: const Text('Kawasaki'),
                  trailing: const Icon(Icons.motorcycle_rounded),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  tileColor: oddItemColorBike,
                  title: const Text('Merida'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorBike,
                  title: const Text('Trek'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorBike,
                  title: const Text('CANONDALE'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorBike,
                  title: const Text('Scott'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorBike,
                  title: const Text('Kona'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
                ListTile(
                  tileColor: evenItemColorBike,
                  title: const Text('SPECIALIZED'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
                ListTile(
                  tileColor: oddItemColorBike,
                  title: const Text('Marin'),
                  trailing: const Icon(Icons.directions_bike_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
