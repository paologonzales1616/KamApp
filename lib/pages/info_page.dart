import 'package:flutter/material.dart';
import "../constants/constants.dart" as Constants;

class InfoPage extends StatefulWidget {
  InfoPage({@required this.index});
  final int index;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Constants.NAME[widget.index]),
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
                    "assets/${Constants.IMAGE[widget.index]}.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                Constants.NAME[widget.index],
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                Constants.SCIENTIFIC[widget.index],
                style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                Constants.DESCRIPTION[widget.index],
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                Constants.RECOMMENDATION[widget.index],
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
