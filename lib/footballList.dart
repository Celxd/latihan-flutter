import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_flutter/detailView.dart';
import 'detailView.dart';
import 'PremiereLeagueModel.dart';

class footballList extends StatefulWidget {
  const footballList({Key? key}) : super(key: key);

  @override
  State<footballList> createState() => _footballListState();
}

class _footballListState extends State<footballList> {
  PremiereLeagueModel? premiereLeagueModel;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("status code " + res.statusCode.toString());
    premiereLeagueModel =
        PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: isloaded == true
              ? ListView.builder(
                  itemCount: premiereLeagueModel!.teams!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detailView(
                                  premiereLeagueModel: premiereLeagueModel!, index: index),
                            ));
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 20,
                                height: 20,
                                child: Image.network(premiereLeagueModel!
                                    .teams![index].strTeamLogo
                                    .toString()),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(premiereLeagueModel!
                                      .teams![index].strTeam
                                      .toString()),
                                  Text(premiereLeagueModel!
                                      .teams![index].strStadium
                                      .toString()),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
