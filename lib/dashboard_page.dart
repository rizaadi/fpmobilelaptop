import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/agent_page.dart';
import 'package:fpmobilelaptop/event_page.dart';
import 'package:fpmobilelaptop/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: camel_case_types
class dashboardpage extends StatefulWidget {
  @override
  _dashboardpageState createState() => _dashboardpageState();
}

  // NEXT PAKAI ITERASI FOREACH<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  // EXTRACT METHOD

// ignore: camel_case_types
class _dashboardpageState extends State<dashboardpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      // theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: Scaffold(
        backgroundColor: Color(0xff0F1722),
        body: ListView(
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
                    width: size.width * 0.16,
                    height: size.height * 0.08,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.network(
                          'https://stickershop.line-scdn.net/stickershop/v1/product/1405437/LINEStorePC/main.png;compress=true',
                          fit: BoxFit.contain,
                        )),
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     fit: BoxFit.contain,
                      //     image: NetworkImage(
                      //         "https://stickershop.line-scdn.net/stickershop/v1/product/1405437/LINEStorePC/main.png;compress=true")),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffFF4655), width: 3),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                    onPressed: () {},
                    child: Text("WEAPONS"),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff1F2C3C),
                        fixedSize: Size(size.width / 2.45, 160)),
                  ),
                  ElevatedButton(
                      onPressed: () {},
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
                onPressed: () {},
                child: Text("GAME MODE"),
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
            infoCard(context),
            infoCard(context)
          ],
        ),
      ),
    );
  }

  Container infoCard(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 7, left: 20, right: 20),
        child: Card(
            elevation: 0,
            color: Color(0xff0F1722),
            child: Column(
              children: <Widget>[
                // ElevatedButton(onPressed: () {}, child: DecoratedBox())
                ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return event_page();
                  }));
                    },
                    leading: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt1b4bd2115fdbb2c0/60b7c5d9e5c1e71981818ebe/JubilantCelebration_1920x1080.jpg")),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    title: Text(
                      "TUNJUKKAN KERAGAMAN ",
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      "Tunjukkan Keragaman Warnamu ke seluruh dunia yang anjuing ini didalam keadaan",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10))
              ],
            )));
  }
}
