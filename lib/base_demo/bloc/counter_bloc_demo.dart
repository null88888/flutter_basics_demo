import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context)!.bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              // _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context)!.bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({
    required this.child,
    required this.bloc,
  }) : super(child: child);

  static CounterProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>(); //控制流
  StreamSink<int> get counter => _counterActionController.sink; //输入

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream; //输出

  CounterBloc() {
    _counterActionController.stream.listen(onData); //输出流监听
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('BLoC');
  }
}
