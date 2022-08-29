import 'package:flutter/material.dart';
import 'PremiereLeagueModel.dart';

class detailView extends StatelessWidget {
  final PremiereLeagueModel premiereLeagueModel;
  final int index;

  detailView({Key? key, required this.premiereLeagueModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(premiereLeagueModel.teams![index].strTeam.toString()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined), 
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
                padding: EdgeInsets.only(bottom: 80),
                child: Image.network(premiereLeagueModel.teams![index].strTeamLogo.toString(), fit: BoxFit.fitWidth)
              ),
              Text(
                "Nama: " + premiereLeagueModel.teams![index].strTeam.toString() + 
                "\n\nStadium: " + premiereLeagueModel.teams![index].strStadium.toString() +
                "\n\nDescription: " + "\n" + premiereLeagueModel.teams![index].strDescriptionEN.toString()
              , style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
