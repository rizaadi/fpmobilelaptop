import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FireBase_Messaging extends StatefulWidget {
  @override
  _FireBase_MessagingState createState() => _FireBase_MessagingState();
}

class _FireBase_MessagingState extends State<FireBase_Messaging> {
  final FirebaseMessaging fc = FirebaseMessaging.instance;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
