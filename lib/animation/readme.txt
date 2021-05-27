动画本质：
    是在一段时间内不断改变屏幕上显示的内容，从而产生视觉暂留现象。

动画一般可分为两类：
    补间动画：是一种预先定义物体运动的起点和终点，物体的运动方式，运动时间，运动曲线，然后从起点过渡到终点的动画。
    基于物理的动画：是一种模拟现实世界运动的动画，通过建立运动模型来实现。例如一个篮球从高处落下，需根据其下落高度，重力加速度，地面反弹力等因素来建立运动模型。

    flutter动画概念：
        Animation：flutter动画系统基于Animation对象，它是一个抽象类，保存了当前动画的值和状态（开始，暂停，前进，快进，倒退），但不记录屏幕上显示的内容。
                UI元素通过读取Animation对象的值和监听状态变化运行build函数，然后渲染到屏幕上形成动画效果。

                一个 Animation 对象在一段时间内会持续生成介于两个值之间的值，比较常见的类型是 Animation<double>，
                    除 double 类型之外还有 Animation<Color> 或者 Animation<Size> 等。

                abstract class Animation<T> extends Listenable implements ValueListenable<T> {
                  /// ...
                }

        AnimationController:
            带有控制方法的Animation对象，用来控制动画的启动，暂停，结束，设定动画运行时间等。
            class AnimationController extends Animation<double>
              with AnimationEagerListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin {
              /// ...
            }

            AnimationController controller = AnimationController(
              vsync: this,
              duration: Duration(seconds: 10),
            );

        Tween: 用来生产不同类型和范围的动画取值。
            class Tween<T extends dynamic> extends Animatable<T> {
              Tween({ this.begin, this.end });
              /// ...
            }

            // double 类型
            Tween<double> tween = Tween<double>(begin: -200, end: 200);

            // color 类型
            ColorTween colorTween = ColorTween(begin: Colors.blue, end: Colors.yellow);

            // border radius 类型
            BorderRadiusTween radiusTween = BorderRadiusTween(
              begin: BorderRadius.circular(0.0),
              end: BorderRadius.circular(150.0),
            );

        Curve:
            FLutter动画的默认动画是匀速的，使用CurvedAnimation可以将曲线定义为非线性曲线。
            class CurvedAnimation extends Animation<double> with AnimationWithParentMixin<double> {
              /// ...
            }
            Animation animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

        Ticker:
            用来添加每次屏幕刷新的回调函数TickerCallback，每次屏幕刷新都会调用。

        class Ticker {
          /// ...
        }
        Ticker ticker = Ticker(callback);








