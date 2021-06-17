import 'package:flutter/material.dart';
import 'package:flutter_basics_demo/base_demo/components/material_components.dart';
import 'package:flutter_basics_demo/base_demo/list/alllistdemo.dart';
import 'package:flutter_basics_demo/home/home.dart';
import 'package:flutter_basics_demo/plugins/plugins_page.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  var _controller = PageController(initialPage: 0);

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
      _controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: PageView(physics: NeverScrollableScrollPhysics(), controller: _controller, children: <Widget>[
          Home(),
          MaterialComponents(),
          PluginsPage(),
          AllListDemoPage(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_input_component),
            title: Text('components'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('plugins'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('demo'),
          ),
        ],
      ),
    );
  }
}
