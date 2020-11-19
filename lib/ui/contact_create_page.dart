import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

class ContactCreate extends StatefulWidget {
  @override
  _ContactCreateState createState() => _ContactCreateState();
}

class _ContactCreateState extends State<ContactCreate> {
  @override
  File _image;

  final picker = ImagePicker();

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
          backgroundColor: Colors.red),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save, size: 18.0),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: GestureDetector(
                child: Image.asset(
                  "images/person.png",
                  width: 300,
                  height: 300,
                ),
                onTap: () {
                  _getImage();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
