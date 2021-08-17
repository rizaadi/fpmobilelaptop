import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/model/maps/maps.dart';
import 'package:fpmobilelaptop/valorantapi.dart';
import 'package:google_fonts/google_fonts.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ValorantAPI service = ValorantAPI();
    return Scaffold(
      backgroundColor: Color(0xff0F1722),
      body: FutureBuilder(
        future: service.getAllMaps(),
        builder: (context, AsyncSnapshot<List<Maps>> snapshot) {
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
                    "AGENT",
                    style: GoogleFonts.roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD3D3D3)),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: new ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color(0xff1F2C3C),
                        margin:
                            EdgeInsets.only(bottom: 24, left: 24, right: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 6,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24, bottom: 0, left: 12, right: 12),
                              child: Image.network(
                                snapshot.data![index].splash.toString(),
                              ),
                            ),
                            ListTile(
                              title: Row(
                                children: [
                                  // Padding(
                                  //     padding:
                                  //         EdgeInsets.only(right: 4, bottom: 2),
                                  //     child: Image.asset('images/Creds.png',
                                  //         height: 8, width: 8)),
                                  Text(
                                    snapshot.data?[index].displayName == null
                                        ? "Maps"
                                        : snapshot.data![index].displayName
                                            .toString()
                                            .toUpperCase(),
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              // subtitle: Text(
                              //   snapshot.data![index].displayName
                              //       .toUpperCase(),
                              //   style: TextStyle(
                              //       fontSize: 18, color: Colors.white70),
                              // ),
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
