import 'package:flutter/material.dart';
import 'package:flutter_basics_demo/base_demo/animation/HeroAnimationPage1.dart';
import 'package:flutter_basics_demo/base_demo/animation/LogoApp1.dart';
import 'package:flutter_basics_demo/base_demo/animation/OpacityChangePage.dart';
import 'package:flutter_basics_demo/base_demo/animation/RotationAinmationPage.dart';
import 'package:flutter_basics_demo/base_demo/animation/StaggeredAnimationPage.dart';
import 'package:flutter_basics_demo/base_demo/animation/ThrowAnimationPage.dart';
import 'package:flutter_basics_demo/base_demo/animation/animation_heart_shaped.dart';
import 'package:flutter_basics_demo/base_demo/bloc/bloc_demo.dart';
import 'package:flutter_basics_demo/base_demo/http/http_demo.dart';
import 'package:flutter_basics_demo/base_demo/i18n/i18n_demo.dart';
import 'package:flutter_basics_demo/base_demo/rxdart/rxdart_demo.dart';
import 'package:flutter_basics_demo/base_demo/state/state_management_demo.dart';
import 'package:flutter_basics_demo/base_demo/stream/stream_demo.dart';
import 'package:flutter_basics_demo/base_demo/test/test_demo.dart';

class AnimationDemoPage extends StatefulWidget {
  @override
  _AnimationDemoPageState createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      primary: false,
      body: CustomScrollView(
        shrinkWrap: false,
        slivers: <Widget>[
          _dividerTopLine(),
          _divider(10),
          _personItem('Hero 动画', 1),
          _dividerLine(),
          _personItem('交织动画', 2),
          _dividerLine(),
          _personItem('物理动画', 3),
          _dividerLine(),
          _personItem('显式动画', 4),
          _dividerLine(),
          _personItem('隐式动画', 5),
          _dividerLine(),
          _personItem('例子1', 6),
          _dividerLine(),
          _personItem('例子2', 7),
          _dividerLine(),
          _divider(30),
        ],
      ),
    );
  }

  SliverToBoxAdapter _personItem(String title, int index) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              _rightArrow()
            ],
          ),
        ),
        onTap: () {
          pressIndexPage(index);
        },
      ),
    );
  }

  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(255, 204, 204, 204),
    );
  }

  SliverToBoxAdapter _dividerTopLine() {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 72.0,
            color: Color(0xFF006AB3),
          ),
          Positioned(
            top: 40,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text(
                  "动画demo",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _dividerLine() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 1.0,
        color: Color.fromARGB(255, 204, 204, 204),
      ),
    );
  }

  SliverToBoxAdapter _divider(double value) {
    return SliverToBoxAdapter(
      child: Container(
        height: value,
        color: const Color.fromARGB(255, 247, 247, 247),
      ),
    );
  }

  void pressIndexPage(int pressIndex) {
    if (pressIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HeroAnimationPage1();
      }));
    } else if (pressIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StaggeredAnimationPage();
      }));
    } else if (pressIndex == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ThrowAnimationPage();
      }));
    } else if (pressIndex == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RotationAinmationPage();
      }));
    } else if (pressIndex == 5) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return OpacityChangePage();
      }));
    } else if (pressIndex == 6) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimationHeartShaped();
      }));
    } else if (pressIndex == 7) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LogoApp1();
      }));
    }
  }
}
