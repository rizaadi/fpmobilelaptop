import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/model/agent/agent.dart';
import 'package:fpmobilelaptop/valorantapi.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillInfo extends StatelessWidget {
  final int idSkill;
  final String idAgent;
  const SkillInfo({Key? key, required this.idSkill, required this.idAgent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValorantAPI service = ValorantAPI();
    return FutureBuilder(
        future: service.getAgentByUuid(idAgent),
        builder: (context, AsyncSnapshot<Agent> snapshot) {
          if (snapshot.hasData) {
            return DraggableScrollableSheet(
                initialChildSize: 0.9,
                minChildSize: 0.8,
                maxChildSize: 0.9,
                builder: (_, controller) => Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ListView(
                        controller: controller,
                        children: <Widget>[
                          Container(
                            child: Image.network(
                              snapshot.data!.abilities[idSkill].displayIcon,
                              height: 70,
                              width: 70,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 5, top: 20, bottom: 0),
                            child: Text(
                              snapshot.data!.abilities[idSkill].displayName,
                              style: GoogleFonts.roboto(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffD3D3D3)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              snapshot.data!.abilities[idSkill].description,
                              style: GoogleFonts.roboto(
                                color: Color(0xffD3D3D3),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Table(
                            border: TableBorder.symmetric(
                                inside: BorderSide(
                                    color: Color(0xff0F1722), width: 3)),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            columnWidths: const <int, TableColumnWidth>{
                              // 0: IntrinsicColumnWidth(),
                              1: FlexColumnWidth(2.7),
                              // 2: FixedColumnWidth(30),
                            },
                            children: <TableRow>[
                              TableRow(children: <Widget>[
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff1F2C3C)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Agent",
                                    style: GoogleFonts.roboto(
                                        color: Color(0xffD3D3D3)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(snapshot.data!.displayName,
                                      style: GoogleFonts.roboto(
                                          color: Color(0xffD3D3D3))),
                                )
                              ]),
                              TableRow(children: <Widget>[
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff1F2C3C)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Ability Type",
                                    style: GoogleFonts.roboto(
                                        color: Color(0xffD3D3D3)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                      snapshot.data!.abilities[idSkill].slot,
                                      style: GoogleFonts.roboto(
                                          color: Color(0xffD3D3D3))),
                                )
                              ]),
                              // TableRow(children: <Widget>[
                              //   Container(
                              //     decoration:
                              //         BoxDecoration(color: Color(0xff1F2C3C)),
                              //     padding: EdgeInsets.all(10),
                              //     child: Row(
                              //       children: [
                              //         Text(
                              //           "Creeds",
                              //           style: GoogleFonts.roboto(
                              //               color: Color(0xffD3D3D3)),
                              //         ),
                              //         Padding(
                              //           padding: EdgeInsets.only(left: 10),
                              //           child: Image.asset(
                              //             'images/Credits_icon.png',
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              //   Container(
                              //     padding: EdgeInsets.all(10),
                              //     child: Text("300",
                              //         style: GoogleFonts.roboto(
                              //             color: Color(0xffD3D3D3))),
                              //   )
                              // ]),
                              // TableRow(children: <Widget>[
                              //   Container(
                              //     decoration:
                              //         BoxDecoration(color: Color(0xff1F2C3C)),
                              //     padding: EdgeInsets.all(10),
                              //     child: Text(
                              //       "Used",
                              //       style: GoogleFonts.roboto(
                              //           color: Color(0xffD3D3D3)),
                              //     ),
                              //   ),
                              //   Container(
                              //     padding: EdgeInsets.all(10),
                              //     child: Text("3",
                              //         style: GoogleFonts.roboto(
                              //             color: Color(0xffD3D3D3))),
                              //   )
                              // ]),
                              // TableRow(children: <Widget>[
                              //   Container(
                              //     decoration:
                              //         BoxDecoration(color: Color(0xff1F2C3C)),
                              //     padding: EdgeInsets.all(10),
                              //     child: Text(
                              //       "Decault Key",
                              //       style: GoogleFonts.roboto(
                              //           color: Color(0xffD3D3D3)),
                              //     ),
                              //   ),
                              //   Container(
                              //     padding: EdgeInsets.all(10),
                              //     child: Text("C",
                              //         style: GoogleFonts.roboto(
                              //             color: Color(0xffD3D3D3))),
                              //   )
                              // ]),
                            ],
                          ),
                        ],
                      ),
                    ));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        });
  }
}
