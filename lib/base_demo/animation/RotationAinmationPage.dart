import 'dart:math';
import 'package:flutter/material.dart';
/*

  显式动画
    显式动画指的是需要手动设置动画的时间，运动曲线，取值范围的动画。
    将值传递给动画部件如: RotationTransition，最后使用一个AnimationController 控制动画的开始和结束。

  除了 RotationTransition 外，还有其他的显示动画部件如：FadeTransition, ScaleTransition,
                                                 SizeTransition, SlideTransition 等。
 */

class RotationAinmationPage extends StatefulWidget {
  @override
  _RotationAinmationPageState createState() => _RotationAinmationPageState();
}

class _RotationAinmationPageState extends State<RotationAinmationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _turns;
  bool _playing = false;

  // 控制动画运行状态
  void _toggle() {
    if (_playing) {
      _playing = false;
      _controller.stop();
    } else {
      _controller.forward()..whenComplete(() => _controller.reverse());
      _playing = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器，设置动画时间
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    // 设置动画取值范围和时间曲线
    _turns = Tween(begin: 0.0, end: pi * 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('显示动画')),
      body: Center(
        child: RotationTransition(
          // 传入动画值
          turns: _turns,
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'assets/images/fan.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        child: Icon(_playing ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
