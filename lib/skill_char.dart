import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillInfo extends StatelessWidget {
  const SkillInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset(
                      'images/Cloudburst.png',
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, top: 20, bottom: 0),
                    child: Text(
                      "CLOUDBURST",
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
                      "Throw out a cloud of fog that obscures vision on impact. Hold down the ability button to bend the cloud’s in-flight trajectory",
                      style: GoogleFonts.roboto(
                        color: Color(0xffD3D3D3),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide(color: Color(0xff0F1722), width: 3)),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const <int, TableColumnWidth>{
                      // 0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(2.7),
                      // 2: FixedColumnWidth(30),
                    },
                    children: <TableRow>[
                      TableRow(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1F2C3C)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Agent",
                            style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Jett",
                              style:
                                  GoogleFonts.roboto(color: Color(0xffD3D3D3))),
                        )
                      ]),
                      TableRow(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1F2C3C)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Ability Type",
                            style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Basic",
                              style:
                                  GoogleFonts.roboto(color: Color(0xffD3D3D3))),
                        )
                      ]),
                      TableRow(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1F2C3C)),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                "Creeds",
                                style: GoogleFonts.roboto(
                                    color: Color(0xffD3D3D3)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  'images/Credits_icon.png',
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("300",
                              style:
                                  GoogleFonts.roboto(color: Color(0xffD3D3D3))),
                        )
                      ]),
                      TableRow(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1F2C3C)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Used",
                            style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("3",
                              style:
                                  GoogleFonts.roboto(color: Color(0xffD3D3D3))),
                        )
                      ]),
                      TableRow(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1F2C3C)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Decault Key",
                            style: GoogleFonts.roboto(color: Color(0xffD3D3D3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("C",
                              style:
                                  GoogleFonts.roboto(color: Color(0xffD3D3D3))),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
            ));
  }
}
