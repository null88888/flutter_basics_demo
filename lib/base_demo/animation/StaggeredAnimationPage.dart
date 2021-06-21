import 'package:flutter/material.dart';

/*
  交织动画
  交织动画是由一系列的小动画组成的动画。每个小动画可以是连续或间断的，也可以相互重叠。
  其关键点在于使用 Interval 部件给每个小动画设置一个时间间隔，以及为每个动画的设置一个取值范围 Tween，
  最后使用一个 AnimationController 控制总体的动画状态。

Interval 继承至 Curve 类，通过设置属性 begin 和 end 来确定这个小动画的运行范围。

class Interval extends Curve {
  /// 动画起始点
  final double begin;
  /// 动画结束点
  final double end;
  /// 动画缓动曲线
  final Curve curve;

  /// ...
}

 这是一个由 5 个小动画组成的交织动画，宽度，高度，颜色，圆角，边框，每个动画都有自己的动画区间。

*/

class StaggeredAnimationPage extends StatefulWidget {
  @override
  _StaggeredAnimationPageState createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _width;
  late Animation<double> _height;
  late Animation<Color?> _color;
  late Animation<double> _border;
  late Animation<BorderRadius> _borderRadius;

  void _play() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _width = Tween<double>(
      begin: 100,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.ease,
        ),
      ),
    );

    _height = Tween<double>(
      begin: 100,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.ease,
        ),
      ),
    );

    _color = ColorTween(
      begin: Colors.blue,
      end: Colors.yellow,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          0.6,
          curve: Curves.ease,
        ),
      ),
    );

    _borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(150.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.ease,
        ),
      ),
    );

    _border = Tween<double>(
      begin: 0,
      end: 25,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('交织动画')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: _width.value,
              height: _height.value,
              decoration: BoxDecoration(
                color: _color.value,
                borderRadius: _borderRadius.value,
                border: Border.all(
                  width: _border.value,
                  color: Colors.orange,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _play,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
