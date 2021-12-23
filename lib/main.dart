import 'package:bloc_using_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counterCubit = CounterCubit();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc using cubit'),
      ),
      body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
        bloc: counterCubit,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(state.counter.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      counterCubit.increment(state);
                    },
                    child: Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterCubit.decrement(state);
                    },
                    child: Text('Decrement'),
                  ), 
                ],
              )
            ],
          );
        },
      )),
    );
  }
}
