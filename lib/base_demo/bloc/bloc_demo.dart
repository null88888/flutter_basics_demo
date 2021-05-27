import 'package:flutter/material.dart';
import 'package:flutter_basics_demo/base_demo/bloc/counter_bloc_demo.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
