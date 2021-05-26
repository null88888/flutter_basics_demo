// 页面 1
import 'package:flutter/material.dart';
import 'HeroAnimationPage2.dart';

String cake1 = 'assets/images/cake01.jpg';
String cake2 = 'assets/images/cake02.jpg';

/*

  Hero 动画
  Hero 动画指的是在页面切换时一个元素从旧页面运动到新页面的动画。
  Hero 动画需要使用两个 Hero 控件实现：一个用来在旧页面中，另一个在新页面。
  两个 Hero 控件需要使用相同的 tag 属性，并且不能与其他tag重复。

 */

class HeroAnimationPage1 extends StatelessWidget {
  GestureDetector buildRowItem(context, String image) {
    return GestureDetector(
      onTap: () {
        // 跳转到页面 2
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) {
            return HeroAnimationPage2(image: image);
          }),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        child: Hero(
          // 设置 Hero 的 tag 属性
          tag: image,
          child: ClipOval(child: Image.asset(image)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面 1')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildRowItem(context, cake1),
              buildRowItem(context, cake2),
            ],
          ),
        ],
      ),
    );
  }
}
