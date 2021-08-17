import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/char_page.dart';
import 'package:fpmobilelaptop/model/agent/agent.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fpmobilelaptop/valorantapi.dart';

class AgentPage extends StatelessWidget {
  ValorantAPI service = ValorantAPI();
  final List roleAgent = [
    "Controller",
    "Duelist",
    "Initiator",
    "Sentinel",
  ];
  final List roleAgentAsset = [
    "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png",
    "https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png",
    "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png",
    "https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png",
  ];
  // const AgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F1722),
      body: FutureBuilder(
        future: service.getAllAgents(),
        builder: (context, AsyncSnapshot<List<Agent>> snapshot) {
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
                      itemCount: roleAgent.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return new Column(
                          children: <Widget>[
                            new Container(
                              height: 50.0,
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: new Image.network(
                                      roleAgentAsset[index],
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
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
                                  new Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0)),
                                  new Text(roleAgent[index],
                                      style: new TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                                ],
                              ),
                            ),
                            listagentConta(
                              snapshot,
                              roleAgent[index],
                            ),
                            new SizedBox(height: 20.0),
                          ],
                        );
                      },
                    ),
                  ),
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
  }

  Container listagentConta(AsyncSnapshot<List<Agent>> snapshot, roleAgent) {
    return new Container(
      height: 100,
      child: new ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          String name = snapshot.data![index].role!.displayName.toString();
          // print(name + "----->" + roleAgent);
          if (name == roleAgent) {
            return cardAgent(context, snapshot.data![index]);
          }
          return Container();
        },
      ),
    );
  }

  Card cardAgent(BuildContext context, Agent agent) {
    return new Card(
      color: Color(0xff0F1722),
      elevation: 5.0,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CharPage(uuidAgent: agent.uuid.toString());
          }));
        },
        child: new Container(
          height: 84,
          width: MediaQuery.of(context).size.width / 4,
          alignment: Alignment.center,
          child: Image.network(
            agent.displayIcon,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
