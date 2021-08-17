import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/agent_page.dart';
import 'package:fpmobilelaptop/info/event_page.dart';
import 'package:fpmobilelaptop/gamemode/gamemode_page.dart';
import 'package:fpmobilelaptop/maps/maps_page.dart';
import 'package:fpmobilelaptop/model/info/info.dart';
import 'package:fpmobilelaptop/page/profile_page.dart';
import 'package:fpmobilelaptop/valorantapi.dart';
import 'package:fpmobilelaptop/weapons/weapons_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class dashboardpage extends StatefulWidget {
  final User user;
  const dashboardpage({required this.user});
  @override
  _dashboardpageState createState() => _dashboardpageState();
}

// ignore: camel_case_types
class _dashboardpageState extends State<dashboardpage> {
  late User _currentUser;
  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValorantAPI service = ValorantAPI();
    @override
    Size size = MediaQuery.of(context).size;
    // final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      // theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: Scaffold(
          backgroundColor: Color(0xff0F1722),
          body: ListView(
            shrinkWrap: false,
            physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.57,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                  "images/valorant-red-horizontal.png"))),
                    ),
                    Container(
                      // width: size.width * 0.16,
                      // height: size.height * 0.08,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(user: _currentUser),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffFF4655),
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.blue,
                            // backgroundImage: NetworkImage(
                            //     'https://stickershop.line-scdn.net/stickershop/v1/product/1405437/LINEStorePC/main.png;compress=true'),
                            backgroundImage: NetworkImage(_currentUser
                                        .photoURL ==
                                    null
                                ? "https://stickershop.line-scdn.net/stickershop/v1/product/1405437/LINEStorePC/main.png;compress=true"
                                : _currentUser.photoURL!),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AgentPage();
                    }));
                  },
                  child: Text("AGENT"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1F2C3C),
                      fixedSize: Size(size.width, 160)),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WeaponsPage();
                        }));
                      },
                      child: Text("WEAPONS"),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff1F2C3C),
                          fixedSize: Size(size.width / 2.45, 160)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MapsPage();
                          }));
                        },
                        child: Text("MAPS"),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff1F2C3C),
                            fixedSize: Size(size.width / 2.45, 160))),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GamemodePage();
                    }));
                  },
                  child: Text("GAMEMODES"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1F2C3C),
                      fixedSize: Size(size.width, 160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 20,
                  right: 20,
                ),
                child: Text("INFO",
                    style:
                        // GoogleFonts.roboto(
                        //     fontSize: 24,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold)
                        TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              FutureBuilder(
                future: service.getWebsiteArticles(),
                builder: (context, AsyncSnapshot<List<Info>> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.only(top: 7, left: 20, right: 20),
                      height: 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Card(
                              elevation: 0,
                              color: Color(0xff0F1722),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return event_page(
                                              info: snapshot.data![index].url);
                                        }));
                                      },
                                      leading: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data![index].bannerUrl)),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      title: Text(
                                        snapshot.data![index].title,
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                      subtitle: Text(
                                        DateFormat("dd/MM/yy")
                                            .format(snapshot.data![index].date),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 10))
                                ],
                              ));
                        },
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // infoCard(context),
              // infoCard(context)
            ],
          )),
    );
  }
}
