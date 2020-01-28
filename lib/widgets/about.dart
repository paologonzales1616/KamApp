import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text("The KamApp application is an android application that suitable to use for classifying the condition of healthy and unhealthy condition of tomato but this android application has a certain limitation. Yet this application required a good quality of camera to be able to take a crisp image. This application can no longer classify the condition of the tomato plants if the camera has not capable to produce a good quality images and captured an image has a certain necessity such as size or angle of the image at list 90° degrees angle or must be front, lightness of image or exposing from the sunlight may cause of irresolute of health condition, colorful background and exact distance of 10 inches and above expanse from the tomato plants. The android application KamApp can’t determine and process the image if it is more than 2-above image, it can captured 1 substance tomato plant image at a time. Also, it can’t classify the image if it is blurred or inexactly captured the tomato plant, it has an appropriate capturing of tomato plant.", style: TextStyle(fontSize: 18.0),),
    );
  }
}