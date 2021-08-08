import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoGalleryScreen extends StatefulWidget {
  static const routeName = '/add-photo-gallery';
  const AddPhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  _AddPhotoGalleryScreenState createState() => _AddPhotoGalleryScreenState();
}

class _AddPhotoGalleryScreenState extends State<AddPhotoGalleryScreen> {
  XFile? _image;
  final urgencyItems = [
    'Really Urgent',
    'Kind Of Urgent',
    'Not Urgent',
  ];
  String? valueItem = 'Really Urgent';

  _showImgFromGallery() async {
    final picker = ImagePicker();
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _turnImageToBytes(XFile file) async {
    return await file.readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                _showImgFromGallery();
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.memory(
                          _turnImageToBytes(_image!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          // TextFormField(),
          StatefulBuilder(builder: (context, snapshot) {
            return DropdownButton<String>(
              value: valueItem,
              onChanged: (String? newValue) {
                setState(() {
                  valueItem = newValue;
                });
              },
              items: urgencyItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
