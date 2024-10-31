
import 'package:bloc_practice/bloc/CounterBloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_event.dart';
import 'package:bloc_practice/bloc/CounterBloc/counter_state.dart';
import 'package:bloc_practice/switch_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favourite_app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,CounterState>(builder: (context, state) {
              return Text(
                state.counter.toString(),
              );
            },),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(DecrementCounter());
            },
                child: const Text(
              'Decrement'
            )),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SwitchExample(),));
            },
                child: const Text(
                    'Next'
                )),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouriteApp(),));
            },
                child: const Text(
                    'Favourite Example'
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<CounterBloc>().add(IncrementCounter());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}