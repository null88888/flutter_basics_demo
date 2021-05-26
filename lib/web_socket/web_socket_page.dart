import 'dart:io';
import 'package:flutter/material.dart';
import 'content.dart';
import 'message.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class WebSocketPage extends StatefulWidget {
  WebSocketPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _WebSocketPageState createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  var _log = "";
  late IOWebSocketChannel _ws;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _wsInit());
  }

  void _wsInit() async {
    _ws = IOWebSocketChannel.connect('wss://api.', headers: {});
    print(_ws);

    _ws.stream.listen(
      _onReceive,
      onDone: _onDone,
      onError: _onError,
      cancelOnError: _cancelOnError(),
    );
  }

  void _onReceive(data) {
    print(data);
    setState(() {
      _log += data;
    });
  }

  void _onDone() {
    print("done");
  }

  void _onError(data) {
    print("_onError: ");
    print(data);
  }

  bool _cancelOnError() {
    print("_cancelOnError: ");
    return true;
  }

  void _send() {
    Message message = Message(
        id: Uuid().v4().toString(),
        content: Content(
          code: 0,
          route: ".test",
          data: {},
          message: '',
        ),
        sent_at: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        type: 1,
        from: '',
        to_user: [],
        from_user: 0,
        to: []);
    _ws.sink.add(json.encode(message.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ''),
        ),
        body: Column(
          children: <Widget>[
            Text("日志："),
            Text(_log),
            MaterialButton(
              onPressed: _send,
              child: Icon(Icons.add),
            )
          ],
        ));
  }
}
