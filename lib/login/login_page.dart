import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpmobilelaptop/providers/valodator.dart';
import 'package:fpmobilelaptop/services/local_notification_service.dart';

// ignore: camel_case_types
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// ignore: camel_case_types
class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    });

    //app berjalan di background & user tap notif diarahkan ke route
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

    final _registerFormKey = GlobalKey<FormState>();
    //login
    final _nameTextController = TextEditingController();
    final _emailTextController = TextEditingController();
    final _passwordTextController = TextEditingController();

    final _focusName = FocusNode();
    final _focusEmail = FocusNode();
    final _focusPassword = FocusNode();

    bool _isProcessing = false;
  Widget build(BuildContext context) {
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      return firebaseApp;
    }

    @override
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          backgroundColor: Color(0xff0F1722),
          // appBar: AppBar(title: Text("data"),),
          body: FutureBuilder(
              future: _initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _registerFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/valorant-red.png",
                              height: size.height * 0.3,
                              width: size.width * 0.6,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffFF4655), width: 3),
                                color: Color(0xff1F2C3C),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                controller: _nameTextController,
                                focusNode: _focusName,
                                validator: (values) => Validator.validateName(
                                    name: values.toString()),
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  border: InputBorder.none,
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // TextFieldContainer2(
                            //     child: TextFormField(
                            //   obscureText: true,
                            //   decoration: InputDecoration(
                            //     hintText: "Password",
                            //     border: InputBorder.none,
                            //     hintStyle: TextStyle(
                            //         fontSize: 20, color: Colors.white),
                            //   ),
                            // )),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LoginPage();
                                      }));
                                    }
                                    ))
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
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  // _isProcessing
                  //     ? Center(
                  //         child: CircularProgressIndicator(),
                  //       )
                  //     : setState(() {
                  //         _isProcessing = true;
                  //       });
                }
              })),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final String name;
  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.name,
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
