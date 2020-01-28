import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kamapp/pages/home_page.dart';
import 'package:kamapp/pages/info_page.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:kamapp/helper/database_helper.dart';

import 'package:kamapp/constants/constants.dart' as Constants;

class ImagePage extends StatefulWidget {
  ImagePage({
    @required this.imagePath,
    @required this.result,
    @required this.id,
    @required this.index
  });

  final int id;
  final int index;
  final String imagePath;
  final String result;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _delete(context);
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RotatedBox(
                  quarterTurns: 5,
                  child: Image.file(
                    File(widget.imagePath),
                  ),
                ),
              ),
            ),
        widget.result != "No Result"
            ? widget.result == "healthy"
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
        ),
      ),
    );
  }

  void _delete(BuildContext context) async {
    Database db = await DatabaseHelper.instance.database;
    await db
        .delete(DatabaseHelper.table, where: "id = ?", whereArgs: [widget.id]);
    await File(widget.imagePath).delete().then(
      (onValue) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomPage(),
          ),
        );
      },
    );
  }
}
