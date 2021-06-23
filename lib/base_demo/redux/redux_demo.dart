import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

class ReduxDemo extends StatelessWidget {
  final store = Store<int>(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return FlutterReduxApp(
      title: 'Flutter Redux Demo',
      store: store,
    );
  }
}

class FlutterReduxApp extends StatelessWidget {
  const FlutterReduxApp({Key? key, required this.store, required this.title}) : super(key: key);
  final Store<int> store;
  final String title;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector(
                  builder: (context, count) {
                    return Text(
                      'Button times: $count',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                  converter: (store) => store.state.toString(),
                )
              ],
            ),
          ),
          floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                // Attach the `callback` to the `onPressed` attribute
                onPressed: callback,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
