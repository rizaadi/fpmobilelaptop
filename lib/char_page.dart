import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/model/agent/agent.dart';
import 'package:fpmobilelaptop/skill_char.dart';
import 'package:fpmobilelaptop/valorantapi.dart';
import 'package:google_fonts/google_fonts.dart';

class CharPage extends StatefulWidget {
  final String uuidAgent;

  const CharPage({Key? key, required this.uuidAgent}) : super(key: key);

  @override
  _CharPageState createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  ValorantAPI service = ValorantAPI();
  @override
  Widget build(BuildContext context) {
    String nullImage =
        "https://res.cloudinary.com/rizaadi/image/upload/v1628657588/ValorantAsset/nullFullportrait_wa8zzi.png";
    String nullIcon =
        "https://res.cloudinary.com/rizaadi/image/upload/v1628658215/ValorantAsset/iconNull_t8q1af.png";
    Size sizeHp = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0F1722),
      body: FutureBuilder(
        future: service.getAgentByUuid(widget.uuidAgent),
        builder: (
          context,
          AsyncSnapshot<Agent> snapshot,
        ) {
          if (snapshot.hasData) {
            // snapshot.data?.fullPortrait == null
            //     ? print("null anjn")
            //     : print("igakkkkkkk onok file e");
            // print(snapshot.data!.fullPortrait);
            // print(widget.uuidAgent);
            return SafeArea(
              child: Stack(
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: sizeHp.height / 7,
                          left: 20,
                        ),
                        child: Text(
                          snapshot.data!.displayName,
                          style: GoogleFonts.roboto(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD3D3D3)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                        child: Text(
                          snapshot.data!.description,
                          style: TextStyle(color: Color(0xffD3D3D3)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 70,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: snapshot.data!.abilities.length,
                                itemBuilder: (context, index) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.only(top: 10),
                                      color: Color(0xff1F2C3C),
                                      child: InkWell(
                                        onTap: () => showModalBottomSheet(
                                            backgroundColor: Color(0xff0F1722),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20))),
                                            context: context,
                                            builder: (context) => SkillInfo(
                                                idSkill: index,
                                                idAgent: widget.uuidAgent)),
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 60,
                                          width: 55,
                                          child: Image.network(
                                            // "ad",
                                            snapshot.data?.abilities[index]
                                                        .displayIcon ==
                                                    null
                                                ? nullIcon
                                                : snapshot
                                                    .data!
                                                    .abilities[index]
                                                    .displayIcon,
                                            fit: BoxFit.contain,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 500,
                              width: 300,
                              child: Image.network(
                                snapshot.data?.fullPortrait == null
                                    ? nullImage
                                    : snapshot.data!.fullPortrait,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 20, top: 15, right: 20, bottom: 5),
                      //   child: Text(
                      //     "Biography",
                      //     style: GoogleFonts.roboto(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 30,
                      //         color: Color(0xffD3D3D3)),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                      //   child: Text(
                      //     "From Korea comes Jett, an agile fighter who prioritizes movement over everything. Her abilities include a teleportation-based dash and an updraft that lets her reach higher ledges. She also has a smokebomb ability to hinder sightlines and a powerful Bladestorm ultimate that deals moderate-to-heavy damage and remains accurate even while she's moving.\nJett is one of the few Agents with a passive ability. Holding the jump key while in the air will allow Jett to slow her descent.\nJett's Ultimate allows her to wield several throwing knives that deal moderate damage and kill on headshots. Getting a kill replenishes your daggers and you can choose to throw them one at a time or throw all remaining daggers in a short-ranged burst.",
                      //     style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 20, top: 15, right: 20, bottom: 5),
                      //   child: Text(
                      //     "Personality",
                      //     style: GoogleFonts.roboto(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 30,
                      //         color: Color(0xffD3D3D3)),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                      //   child: Text(
                      //     "Jett is an aggressive agent who has a distinctive, sarcastic personality. Jett also has a cheeky, childish \"in-your-face\" attitude, seen commonly giving insults for feats she makes on the team and is always spouting her sheer amount arrogance. She does show a much more friendly personality towards teammates.",
                      //     style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 20, top: 15, right: 20, bottom: 5),
                      //   child: Text(
                      //     "Strategies",
                      //     style: GoogleFonts.roboto(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 30,
                      //         color: Color(0xffD3D3D3)),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 20, top: 5, right: 20, bottom: 20),
                      //   child: Text(
                      //     "When using Bladestorm always remember to keep moving. The blades are always fully accurate as long as your cross hair is on the enemy, using updraft can get you the on higher ground and get you some easy headshot kills.",
                      //     style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                      //   ),
                      // ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      padding:
                          EdgeInsets.only(left: 20, top: sizeHp.height / 20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff1F2C3C),
                            fixedSize: Size(44, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      )),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
    // );
  }
}
