import 'package:flutter/material.dart';
import 'package:kamapp/pages/info_page.dart';
import 'dart:io';
import "../constants/constants.dart" as Constants;

class ResultWidget extends StatefulWidget {
  ResultWidget(
      {this.withResult,
      this.condition,
      this.index,
      this.imagePath,
      this.rotate = true});
  final bool withResult;
  final String condition;
  final int index;
  final File imagePath;
  @required final bool rotate;
  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.rotate
                ? RotatedBox(
                    quarterTurns: 5,
                    child: Image.file(widget.imagePath),
                  )
                : Image.file(widget.imagePath),
          ),
        ),
        widget.withResult
            ? widget.condition == "healthy"
                ? Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Healthy",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )
                : Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            Constants.NAME[widget.index],
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoPage(
                                  index: widget.index,
                                ),
                              ),
                            ),
                            child: Text(
                              "Read More",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
            : Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "No Result",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
