import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kamapp/data/gallery_data.dart';
import 'package:kamapp/pages/image_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:kamapp/helper/database_helper.dart';

class GalleryWidget extends StatefulWidget {
  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  List<Gallery> galleryList;
  String appDocDir;

  Future<void> _getGalleryList() async {
    Database db = await DatabaseHelper.instance.database;
    var jsondata = await db.query(DatabaseHelper.table);
    List<Gallery> temps = [];

    for (var x in jsondata) {
      print(x);
      Gallery temp = Gallery(x["id"], x["place"], x["path_image"], x["result"]);
      temps.add(temp);
    }
    if (mounted) {
      setState(() {
        galleryList = temps.reversed.toList();
      });
    }
  }

  Future<void> _returnImage() async {
    Directory temp = await getApplicationDocumentsDirectory();
    setState(() {
      appDocDir = temp.path;
    });
  }

  @override
  void initState() {
    _returnImage();
    _getGalleryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return galleryList == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            itemCount: galleryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: RotatedBox(
                      quarterTurns: 5,
                      child: Image.file(
                        File('$appDocDir/${galleryList[index].pathImage}'),
                      ),
                    ),
                    title: Text(galleryList[index].result),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagePage(
                          imagePath:
                              '$appDocDir/${galleryList[index].pathImage}',
                          result: galleryList[index].result,
                          id: galleryList[index].id,
                          index: galleryList[index].place,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
