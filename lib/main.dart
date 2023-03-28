import 'package:flutter/material.dart';
import 'package:flutter_application_block_28march/bloc/Counter%20Bloc/counter_bloc.dart';
import 'package:flutter_application_block_28march/bloc/Counter%20Bloc/counter_event.dart';
import 'package:flutter_application_block_28march/bloc/Counter%20Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(child: _counterUi(counter: 0));
          } else if (state is UpdateState) {
            return Center(child: _counterUi(counter: state.counter));
          }
          return Container();
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _counterUi extends StatelessWidget {
  final int counter;
  const _counterUi({
    required this.counter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          counter.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(NumberIncrease()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(NumberDecrease()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        )
      ],
    );
  }
}
