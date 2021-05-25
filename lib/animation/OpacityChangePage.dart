import 'package:flutter/material.dart';

/*

 隐式动画: 使用 Flutter 框架内置的动画部件创建，通过设置动画的起始值和最终值来触发。
          当使用 setState 方法改变部件的动画属性值时，框架会自动计算出一个从旧值过渡到新值的动画。
          比如 AnimatedOpacity 部件，改变它的 opacity 值就可以触发动画。


 */



class OpacityChangePage extends StatefulWidget {
  @override
  _OpacityChangePageState createState() => _OpacityChangePageState();
}

class _OpacityChangePageState extends State<OpacityChangePage> {
  double _opacity = 1.0;

  // 改变目标值
  void _toggle() {
    _opacity = _opacity > 0 ? 0.0 : 1.0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('隐式动画')),
      body: Center(
        child: AnimatedOpacity(
          // 传入目标值
          opacity: _opacity,
          duration: Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}