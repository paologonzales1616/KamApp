import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamapp/helper/database_helper.dart';
import 'package:kamapp/widgets/about.dart';
import 'package:kamapp/widgets/gallery.dart';
import 'package:kamapp/widgets/library.dart';
import 'package:kamapp/widgets/result.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:tflite/tflite.dart';
import "../constants/constants.dart" as Constants;
import 'package:uuid/uuid.dart';

class HomPage extends StatefulWidget {
  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  Widget currentBody;
  int pageIndex;

  @override
  initState() {
    super.initState();
    currentBody = LibraryWidget();
    pageIndex = 4;
  }

  _insert(String pathImage, String result, int place) async {
    Database db = await DatabaseHelper.instance.database;
    await db.insert(DatabaseHelper.table,
        {"path_image": pathImage, "result": result, "place": place});
  }

  _getCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // getting a directory path for saving
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      String uuid = Uuid().v1();
      await image.copy('${appDocDir.path}/$uuid.png');
      List<dynamic> conditionResult = await _classifyCondition(image.path);
      if (conditionResult.isEmpty) {
        await _insert("$uuid.png", "No Result", 0);
        setState(() {
          pageIndex = 1;
          currentBody = ResultWidget(
            imagePath: image,
            withResult: false,
          );
        });
      } else {
        if (conditionResult[0]['label'] == "healthy") {
          await _insert("$uuid.png", "Healthy", 0);
          setState(() {
            pageIndex = 1;
            currentBody = ResultWidget(
              condition: "healthy",
              imagePath: image,
              withResult: true,
            );
          });
        } else {
          List<dynamic> diseaseResult = await _classifyDisease(image.path);
          if (diseaseResult.isEmpty) {
            await _insert("$uuid.png", "No Result", 0);
            setState(() {
              pageIndex = 1;
              currentBody = ResultWidget(
                imagePath: image,
                withResult: false,
              );
            });
          } else {
            int temp =
                Constants.COMPARE_NAME.indexOf(diseaseResult[0]['label']);
            await _insert("$uuid.png", Constants.NAME[temp], temp);

            setState(() {
              pageIndex = 1;
              currentBody = ResultWidget(
                withResult: true,
                condition: "unhealthy",
                index: temp,
                imagePath: image,
              );
            });
          }
        }
      }
    }
  }

  _getImport() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // getting a directory path for saving
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      String uuid = Uuid().v1();

      await image.copy('${appDocDir.path}/$uuid.png');
      List<dynamic> conditionResult = await _classifyCondition(image.path);
      if (conditionResult.isEmpty) {
        await _insert("$uuid.png", "No Result", 0);
        setState(() {
          pageIndex = 2;
          currentBody = ResultWidget(
            imagePath: image,
            withResult: false,
            rotate: false,
          );
        });
      } else {
        if (conditionResult[0]['label'] == "healthy") {
          await _insert("$uuid.png", "Healthy", 0);
          setState(() {
            pageIndex = 2;
            currentBody = ResultWidget(
              condition: "healthy",
              imagePath: image,
              withResult: true,
              rotate: false,
            );
          });
        } else {
          List<dynamic> diseaseResult = await _classifyDisease(image.path);
          if (diseaseResult.isEmpty) {
            await _insert("$uuid.png", "No Result", 0);
            setState(() {
              pageIndex = 2;
              currentBody = ResultWidget(
                imagePath: image,
                withResult: false,
                rotate: false,
              );
            });
          } else {
            int temp =
                Constants.COMPARE_NAME.indexOf(diseaseResult[0]['label']);
            await _insert("$uuid.png", Constants.NAME[temp], temp);
            setState(() {
              pageIndex = 2;
              currentBody = ResultWidget(
                withResult: true,
                condition: "unhealthy",
                index: temp,
                imagePath: image,
                rotate: false,
              );
            });
          }
        }
      }
    }
  }

  Future<List<dynamic>> _classifyCondition(String filepath) async {
    await Tflite.loadModel(
      model: "assets/model.lite",
      labels: "assets/labels.txt",
      numThreads: 2,
    );
    List<dynamic> recognitions = await Tflite.runModelOnImage(
        path: filepath, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 1, // defaults to 5
        threshold: 0.8, // defaults to 0.1
        asynch: true // defaults to true
        );
    Tflite.close();
    return recognitions;
  }

  Future<List<dynamic>> _classifyDisease(String filepath) async {
    await Tflite.loadModel(
        model: "assets/model_1.lite",
        labels: "assets/labels_1.txt",
        numThreads: 2);
    List<dynamic> recognitions = await Tflite.runModelOnImage(
        path: filepath, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 1, // defaults to 5
        threshold: 0.4, // defaults to 0.1
        asynch: true // defaults to true
        );
    print(recognitions);
    Tflite.close();
    return recognitions;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset("assets/kamapp_logo.png"),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _getCamera(),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pageIndex == 1
                                      ? Color.fromRGBO(159, 210, 127, 0.62)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/lens.png",
                                    ),
                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _getImport(),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pageIndex == 2
                                      ? Color.fromRGBO(159, 210, 127, 0.62)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/import.png",
                                    ),
                                    Text(
                                      "Import",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageIndex = 3;
                                  currentBody = GalleryWidget();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pageIndex == 3
                                      ? Color.fromRGBO(159, 210, 127, 0.62)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/picture.png",
                                    ),
                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentBody = LibraryWidget();
                                  pageIndex = 4;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pageIndex == 4
                                      ? Color.fromRGBO(159, 210, 127, 0.62)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/books.png",
                                    ),
                                    Text(
                                      "Library",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentBody = AboutWidget();
                                  pageIndex = 5;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pageIndex == 5
                                      ? Color.fromRGBO(159, 210, 127, 0.62)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/tomato.png",
                                    ),
                                    Text(
                                      "About",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                  ],
                ),
                Expanded(
                  child: currentBody,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
