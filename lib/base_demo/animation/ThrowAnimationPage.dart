import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/*

  物理动画
  物理动画是一种模拟现实世界物体运动的动画。
  需要建立物体的运动模型，以一个物体下落为例，这个运动受到物体的下落高度，重力加速度，地面的反作用力等因素的影响。

 */

class ThrowAnimationPage extends StatefulWidget {
  @override
  _ThrowAnimationPageState createState() => _ThrowAnimationPageState();
}

class _ThrowAnimationPageState extends State<ThrowAnimationPage> {
  // 球心高度
  double y = 70.0;
  // Y 轴速度
  double vy = -10.0;
  // 重力
  double gravity = 0.1;
  // 地面反弹力
  double bounce = -0.5;
  // 球的半径
  double radius = 50.0;
  // 地面高度
  final double height = 700;

  // 下落方法
  void _fall(_) {
    y += vy;
    vy += gravity;

    // 如果球体接触到地面，根据地面反弹力改变球体的 Y 轴速度
    if (y + radius > height) {
      y = height - radius;
      vy *= bounce;
    } else if (y - radius < 0) {
      y = 0 + radius;
      vy *= bounce;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 使用一个 Ticker 在每次更新界面时运行球体下落方法
    Ticker(_fall)..start();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('物理动画')),
      body: Column(
        children: <Widget>[
          Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: y - radius,
                  left: screenWidth / 2 - radius,
                  child: Container(
                    width: radius * 2,
                    height: radius * 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container(color: Colors.blue)),
        ],
      ),
    );
  }
}
