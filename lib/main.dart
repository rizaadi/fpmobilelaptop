import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/login/login_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Valorant App",
      home: LoginPage(),
    );
  }
}