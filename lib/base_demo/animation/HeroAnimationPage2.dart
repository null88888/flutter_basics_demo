// 页面 2
import 'package:flutter/material.dart';

class HeroAnimationPage2 extends StatelessWidget {
  final String? image;

  const HeroAnimationPage2({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400.0,
            title: Text('页面 2'),
            backgroundColor: Colors.grey[200],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Hero(
                // 使用从页面 1 传入的 tag 值
                tag: image!,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(height: 600.0, color: Colors.grey[200]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
