import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Incremented'),
              duration: Duration(milliseconds: 300),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Decremented'),
              duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('The counter is displayed:'),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(state.counterValue.toString());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'btn1',
                    onPressed: () =>
                        {BlocProvider.of<CounterCubit>(context).decrement()},
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: () =>
                        {BlocProvider.of<CounterCubit>(context).increment()},
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                color: widget.color,
                child: const Text('Go to second screen'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                color: widget.color,
                child: const Text('Go to third screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
