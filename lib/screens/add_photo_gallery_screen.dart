import 'dart:typed_data';

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
  Uint8List? convertedImage;
  int? valueItem = 0;

  void _showImgFromGallery() async {
    final picker = ImagePicker();
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
    convertedImage = await _image!.readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF97AC94),
            Color(0xFF5C745C),
            // Color(0xFFA2C08B),
            // Color(0xFF82C1D6),
            Color(0xFF64919F),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GeoRepair',
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF).withOpacity(0.53)),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                './assets/hammer.png',
                width: 45.96,
                height: 44.35,
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  _showImgFromGallery();
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white.withOpacity(.53),
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.memory(
                            convertedImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.6),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Urgency: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                StatefulBuilder(builder: (context, snapshot) {
                  return DropdownButton<int>(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    value: valueItem,
                    onChanged: (int? newValue) {
                      setState(() {
                        valueItem = newValue;
                      });
                    },
                    dropdownColor: Color(0xFF5C745C),
                    iconEnabledColor: Colors.white,
                    items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
            Container(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF97AC94),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                label: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// body:
