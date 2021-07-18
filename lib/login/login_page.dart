import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/dashboard_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// ignore: camel_case_types
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// ignore: camel_case_types
class _LoginPageState extends State<LoginPage> {
  final FirebaseMessaging fc = FirebaseMessaging.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0F1722),
        // appBar: AppBar(title: Text("data"),),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/valorant-red.png",
                  height: size.height * 0.3,
                  width: size.width * 0.6,
                ),
                TextFieldContainer(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ),
                ),
                TextFieldContainer2(
                    child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
                Container(
                    padding: EdgeInsets.all(0),
                    width: size.width * 0.8,
                    height: 60,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(),
                    child: RaisedButton(
                        color: Color(0xffFF4655),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return dashboardpage();
                          }));
                        }))
                // Container(
                //   margin: EdgeInsets.all(10),
                //   width: 300,
                //   height: 60,
                //   // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                //         hintText: "Password",
                //         fillColor: Color(0xff1F2C3C),
                //         filled: true,
                //         border: InputBorder.none,
                //              ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
  void configureCallbacks() {
  fc.sub
}
}


class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF4655), width: 3),
        color: Color(0xff1F2C3C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class TextFieldContainer2 extends StatelessWidget {
  final Widget child;
  const TextFieldContainer2({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xff1F2C3C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
