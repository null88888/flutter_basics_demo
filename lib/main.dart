// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_basics_demo/base_demo/bottom_navigation_bar_demo.dart';
import 'package:flutter_basics_demo/base_demo/i18n/intl/base_demo_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_basics_demo/router/routes.dart';

void main() {
  //defineNotificationMain();
  // notificationMain();
  runApp(App());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: WebSocketPage(title: 'WebSocket测试'),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: Locale('en', 'US'),
        localizationsDelegates: [
          BaseDemoLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ],
        routes: routes,
        debugShowCheckedModeBanner: false,
        home: BottomNavigationBarDemo(),
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0),
        ));
  }
}
