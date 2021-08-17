import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/model/mods/gamemods.dart';
import 'package:fpmobilelaptop/valorantapi.dart';
import 'package:google_fonts/google_fonts.dart';

class GamemodePage extends StatefulWidget {
  const GamemodePage({Key? key}) : super(key: key);

  @override
  _GamemodePageState createState() => _GamemodePageState();
}

class _GamemodePageState extends State<GamemodePage> {
  String nullImage =
      "https://res.cloudinary.com/rizaadi/image/upload/v1628658215/ValorantAsset/iconNull_t8q1af.png";
  ValorantAPI service = ValorantAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F1722),
      body: FutureBuilder(
        future: service.getAllGamemodes(),
        builder: (context, AsyncSnapshot<List<GameMods>> snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
                child: ListView(
              shrinkWrap: false,
              physics: ScrollPhysics(),
              children: <Widget>[
                new SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    "GAMEMODES",
                    style: GoogleFonts.roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD3D3D3)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Color(0xff1F2C3C),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              snapshot.data![index].displayIcon == null
                                  ? nullImage
                                  : snapshot.data![index].displayIcon
                                      .toString(),
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                snapshot.data![index].displayName == null
                                    ? "Gamemodes"
                                    : snapshot.data![index].displayName
                                        .toString()
                                        .toUpperCase(),
                                style: TextStyle(color: Color(0xffD3D3D3)),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
