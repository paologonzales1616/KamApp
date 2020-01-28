import 'package:flutter/material.dart';
import "../constants/constants.dart" as Constants;

class InfoPestPage extends StatefulWidget {
  InfoPestPage({@required this.index});
  final int index;

  @override
  _InfoPestPageState createState() => _InfoPestPageState();
}

class _InfoPestPageState extends State<InfoPestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Constants.PEST_NAME[widget.index]),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/${Constants.PEST_IMAGE[widget.index]}",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                Constants.PEST_NAME[widget.index],
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                Constants.PEST_SCIENTIFIC[widget.index],
                style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                Constants.PEST_DESCRIPTION[widget.index],
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Damage",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                Constants.PEST_DAMAGE[widget.index],
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Recommendation",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold

                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                Constants.PEST_RECOMMENDATION[widget.index],
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
