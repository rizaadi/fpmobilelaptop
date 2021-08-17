import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgentPage extends StatelessWidget {
  // const AgentPage({Key? key}) : super(key: key);

  // NEXT PAKAI ITERASI FOREACH<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  // EXTRACT METHOD
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff0F1722),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Text(
                            "AGENT",
                            style: GoogleFonts.roboto(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD3D3D3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          "images/DuelistClassSymbol.png")),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "DUELIST",
                                  style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffD3D3D3)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return new GestureDetector(
                                  child: new Card(
                                    child: Container(
                                      height: size.height / 3,
                                      width: size.width / 3,
                                      alignment: Alignment.center,
                                      child: Text(myProducts[index]["name"]),
                                    ),
                                  ),
                                  onTap: () {
                                    print(2141);
                                  },
                                );
                              }),
                        )
                      ],
                    )),
                // Stack(
                //   children: <Widget>[
                //     Container(
                //       width: size.width,
                //       height: size.height,
                //       child: Padding(
                //         padding: EdgeInsets.only(left: 10, right: 10),
                //         child: GridView.builder(
                //           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //               maxCrossAxisExtent: 200,
                //               childAspectRatio: 3 / 2,
                //               crossAxisSpacing: 20,
                //               mainAxisSpacing: 20),
                //           itemCount: myProducts.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Container(
                //               alignment: Alignment.center,
                //               child: Text(myProducts[index]["name"]),
                //               decoration: BoxDecoration(
                //                   color: Colors.amber,
                //                   borderRadius: BorderRadius.circular(15)),
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //     ListView(
                //       children: <Widget>[
                //         // Container(
                //         //   padding: EdgeInsets.only(top: 120, left: 20, right: 20),
                //         //   child: Text(
                //         //     "AGENT",
                //         //     style: GoogleFonts.roboto(
                //         //         fontSize: 48,
                //         //         fontWeight: FontWeight.bold,
                //         //         color: Color(0xffD3D3D3)),
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, top: 10),
                //         //   child: Row(
                //         //     children: <Widget>[
                //         //       Container(
                //         //         height: 20,
                //         //         width: 20,
                //         //         decoration: BoxDecoration(
                //         //           image: DecorationImage(
                //         //               fit: BoxFit.contain,
                //         //               image:
                //         //                   AssetImage("images/DuelistClassSymbol.png")),
                //         //         ),
                //         //       ),
                //         //       Container(
                //         //         padding: EdgeInsets.only(left: 10),
                //         //         child: Text(
                //         //           "DUELIST",
                //         //           style: GoogleFonts.roboto(
                //         //               fontSize: 24,
                //         //               fontWeight: FontWeight.w500,
                //         //               color: Color(0xffD3D3D3)),
                //         //         ),
                //         //       )
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, right: 20),
                //         //   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         //   crossAxisCount: 4
                //         // ), itemBuilder: (BuildContext context, int index) {
                //         //   return Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {
                //         //             Navigator.push(context,
                //         //                 MaterialPageRoute(builder: (context) {
                //         //               return CharPage();
                //         //             }));
                //         //           },
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //           ),
                //         //         ),
                //         //       );
                //         // },),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, right: 20),
                //         //   child: Row(
                //         //     mainAxisAlignment: MainAxisAlignment.start,
                //         //     children: <Widget>[
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {
                //         //             Navigator.push(context,
                //         //                 MaterialPageRoute(builder: (context) {
                //         //               return CharPage();
                //         //             }));
                //         //           },
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset("images/char-jett.png"),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-phoenix.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-raze.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-reyna.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, top: 10),
                //         //   child: Row(
                //         //     children: <Widget>[
                //         //       Container(
                //         //         height: 20,
                //         //         width: 20,
                //         //         decoration: BoxDecoration(
                //         //           image: DecorationImage(
                //         //               fit: BoxFit.contain,
                //         //               image: AssetImage(
                //         //                   'images/ControllerClassSymbol.png')),
                //         //         ),
                //         //       ),
                //         //       Container(
                //         //         padding: EdgeInsets.only(left: 10),
                //         //         child: Text(
                //         //           "CONTROLLERS",
                //         //           style: GoogleFonts.roboto(
                //         //               fontSize: 24,
                //         //               fontWeight: FontWeight.w500,
                //         //               color: Color(0xffD3D3D3)),
                //         //         ),
                //         //       )
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, right: 20),
                //         //   child: Row(
                //         //     mainAxisAlignment: MainAxisAlignment.start,
                //         //     children: <Widget>[
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {
                //         //             Navigator.push(context,
                //         //                 MaterialPageRoute(builder: (context) {
                //         //               return CharPage();
                //         //             }));
                //         //           },
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-astra.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-brim.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-omen.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-viper.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, top: 10),
                //         //   child: Row(
                //         //     children: <Widget>[
                //         //       Container(
                //         //         height: 20,
                //         //         width: 20,
                //         //         decoration: BoxDecoration(
                //         //           image: DecorationImage(
                //         //               fit: BoxFit.contain,
                //         //               image: AssetImage(
                //         //                   'images/InitiatorClassSymbol.png')),
                //         //         ),
                //         //       ),
                //         //       Container(
                //         //         padding: EdgeInsets.only(left: 10),
                //         //         child: Text(
                //         //           "INITIATORS",
                //         //           style: GoogleFonts.roboto(
                //         //               fontSize: 24,
                //         //               fontWeight: FontWeight.w500,
                //         //               color: Color(0xffD3D3D3)),
                //         //         ),
                //         //       )
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, right: 20),
                //         //   child: Row(
                //         //     mainAxisAlignment: MainAxisAlignment.start,
                //         //     children: <Widget>[
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {
                //         //             Navigator.push(context,
                //         //                 MaterialPageRoute(builder: (context) {
                //         //               return CharPage();
                //         //             }));
                //         //           },
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-breach.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-skye.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-sova.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, top: 10),
                //         //   child: Row(
                //         //     children: <Widget>[
                //         //       Container(
                //         //         height: 20,
                //         //         width: 20,
                //         //         decoration: BoxDecoration(
                //         //           image: DecorationImage(
                //         //               fit: BoxFit.contain,
                //         //               image:
                //         //                   AssetImage('images/SentinelClassSymbol.png')),
                //         //         ),
                //         //       ),
                //         //       Container(
                //         //         padding: EdgeInsets.only(left: 10),
                //         //         child: Text(
                //         //           "SENTINELS",
                //         //           style: GoogleFonts.roboto(
                //         //               fontSize: 24,
                //         //               fontWeight: FontWeight.w500,
                //         //               color: Color(0xffD3D3D3)),
                //         //         ),
                //         //       )
                //         //     ],
                //         //   ),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.only(left: 20, right: 20),
                //         //   child: Row(
                //         //     mainAxisAlignment: MainAxisAlignment.start,
                //         //     children: <Widget>[
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {
                //         //             Navigator.push(context,
                //         //                 MaterialPageRoute(builder: (context) {
                //         //               return CharPage();
                //         //             }));
                //         //           },
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-cyper.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-killjoy.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //       Card(
                //         //         color: Color(0xff0F1722),
                //         //         child: InkWell(
                //         //           onTap: () {},
                //         //           child: SizedBox(
                //         //             height: 84,
                //         //             width: 84,
                //         //             child: Image.asset('images/char-sage.png'),
                //         //           ),
                //         //         ),
                //         //       ),
                //         //     ],
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //     Container(
                //         decoration:
                //             BoxDecoration(borderRadius: BorderRadius.circular(50)),
                //         padding: EdgeInsets.only(left: 20, top: 70),
                //         child: ElevatedButton.icon(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           icon: Icon(Icons.arrow_back_ios_new_rounded),
                //           label: Text(""),
                //           style: ElevatedButton.styleFrom(
                //               primary: Color(0xff1F2C3C),
                //               fixedSize: Size(44, 60),
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15))),
                //         )),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
