import 'package:cursoflutter/view/loginpage.dart';
import 'package:cursoflutter/view/news_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CursoFlutter());
}

class CursoFlutter extends StatefulWidget {
  @override
  _CursoFlutterState createState() => _CursoFlutterState();
}

class _CursoFlutterState extends State<CursoFlutter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new Loginpage());
          case '/news':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          default:
            return null;
        }
      },
    );
  }
}
