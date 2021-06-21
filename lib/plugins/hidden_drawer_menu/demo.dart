import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:flutter_basics_demo/utils/common.dart';

class HiddenDrawerMenuDemo extends StatefulWidget {
  HiddenDrawerMenuDemo({Key? key}) : super(key: key);

  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<HiddenDrawerMenuDemo> {
  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
        menu: Menu(),
        screenSelectedBuilder: (position, controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("hidden_drawer_menu"),
              actions: <Widget>[GoWeb(pluginName: 'hidden_drawer_menu')],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text("当前页面$position"),
                ),
                Center(
                  child: FlatButton(
                    child: Text("打开抽屉"),
                    onPressed: () {
                      controller.toggle();
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            child: Text("菜单一", style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              SimpleHiddenDrawerController.of(context).setSelectedMenuPosition(0);
            },
          ),
          FlatButton(
            child: Text("菜单二", style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              SimpleHiddenDrawerController.of(context).setSelectedMenuPosition(1);
            },
          )
        ],
      ),
    );
  }
}
