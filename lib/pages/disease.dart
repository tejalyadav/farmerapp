import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';


class Disease extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();

}

class _HomescreenState extends State<Disease> {

  File? imageURI;
  String? result;
  late String path;

  Future getImageFromCamera() async {

    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = File(image!.path) ;
      path = image!.path;
    });
  }

  Future getImageFromGallery() async {

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);


    setState(() {
      imageURI = File(image!.path)  ;
      path = image!.path;
    });
  }

  Future classifyImage() async {

    await Tflite.loadModel(model: "assets/converted_model.tflite",labels: "assets/label.txt");
    var output = await Tflite.runModelOnImage(path: path);

    setState(() {
      result = output.toString();
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  imageURI == null
                      ? Text('No image selected.')
                      : Image.file(File(imageURI!.path) , width: 300, height: 200, fit: BoxFit.cover),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: ElevatedButton(
                        onPressed: () => getImageFromCamera(),
                        child: Text('Take a photo from Camera'),
                        //textColor: Colors.white,
                        //color: Colors.blue,
                        //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      )),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        onPressed: () => getImageFromGallery(),
                        child: Text('Take a photo from Gallery'),
                        //textColor: Colors.white,
                        //color: Colors.blue,
                        //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      )),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: ElevatedButton(
                        onPressed: () => classifyImage(),
                        child: Text('Predict disease'),
                        //textColor: Colors.white,
                        //color: Colors.blue,
                        //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      )),

                  result == null
                      ? Text('Result')
                      : Text(result!)
                ]))
    );
  }
}




