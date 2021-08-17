import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/login/login_page_new.dart';
import 'package:fpmobilelaptop/providers/auth.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late User _currentUser;
  @override
  void initState() {
    // _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeHp = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: sizeHp.width,
        height: sizeHp.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFF4655),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                // backgroundImage: NetworkImage(
                // 'https://stickershop.line-scdn.net/stickershop/v1/product/1405437/LINEStorePC/main.png;compress=true'),
                backgroundImage: NetworkImage(user.photoURL == null
                    ? "https://stickershop.line-scdn.net/stickershop/v1/product/1405437/LINEStorePC/main.png;compress=true"
                    : user.photoURL!),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              contentPadding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              title: Text("Setting"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
                onTap: () async {
                  // final provider =
                  //     Provider.of<FireAuth>(context, listen: false);
                  // provider.signOut(context: context);
                  
                  await FireAuth.signOut(context: context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginPageNew(),
                  ));
                },
                contentPadding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                title: Text("Log Out"),
                leading: Icon(Icons.logout)),
          ],
        ),
      )),
    );
  }
}
