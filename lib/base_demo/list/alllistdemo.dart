import 'package:flutter/material.dart';
import 'package:flutter_basics_demo/base_demo/animation/animation_demo.dart';
import 'package:flutter_basics_demo/base_demo/bloc/bloc_demo.dart';
import 'package:flutter_basics_demo/base_demo/http/http_demo.dart';
import 'package:flutter_basics_demo/base_demo/i18n/i18n_demo.dart';
import 'package:flutter_basics_demo/base_demo/rxdart/rxdart_demo.dart';
import 'package:flutter_basics_demo/base_demo/state/state_management_demo.dart';
import 'package:flutter_basics_demo/base_demo/stream/stream_demo.dart';
import 'package:flutter_basics_demo/base_demo/test/test_demo.dart';

class AllListDemoPage extends StatefulWidget {
  @override
  _AllListDemoState createState() => _AllListDemoState();
}

class _AllListDemoState extends State<AllListDemoPage> {
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
          _personItem('AnimationDemo', 1),
          _dividerLine(),
          _personItem('bloc', 2),
          _dividerLine(),
          _personItem('http', 3),
          _dividerLine(),
          _personItem('i18n', 4),
          _dividerLine(),
          _personItem('rxdart', 5),
          _dividerLine(),
          _personItem('state', 6),
          _dividerLine(),
          _personItem('stream', 7),
          _dividerLine(),
          _personItem('test', 8),
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
                  "蓝普",
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
        return AnimationDemo();
      }));
    } else if (pressIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BlocDemo();
      }));
    } else if (pressIndex == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HttpDemo();
      }));
    } else if (pressIndex == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return I18nDemo();
      }));
    } else if (pressIndex == 5) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RxDartDemo();
      }));
    } else if (pressIndex == 6) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StateManagementDemo();
      }));
    } else if (pressIndex == 7) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StreamDemo();
      }));
    } else if (pressIndex == 8) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TestDemo();
      }));
    }
  }
}
