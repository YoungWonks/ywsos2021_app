import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scans.dart';
import '../screens/home_screen.dart';

class AddScanDialog extends StatefulWidget {
  final Uint8List image;

  AddScanDialog({Key? key, required this.image}) : super(key: key);

  @override
  _AddScanDialogState createState() => _AddScanDialogState();
}

class _AddScanDialogState extends State<AddScanDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();
  // final TextEditingController _positionController = TextEditingController();

  int? valueItem = 1;

  List urgencyRange = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 120,
                height: 100,
                child: Image.memory(widget.image),
              ),
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You need to put something';
                  }
                },
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(hintText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You need to put something';
                  }
                },
              ),
              // TextFormField(
              //   controller: _positionController,
              //   decoration: InputDecoration(hintText: 'Position'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'You need to put something';
              //     }
              //   },
              // ),
              DropdownButton<int>(
                value: valueItem,
                onChanged: (int? newValue) {
                  setState(() {
                    valueItem = newValue;
                  });
                },
                items: urgencyRange.map<DropdownMenuItem<int>>((value) {
                  return DropdownMenuItem<int>(
                    child: Text(value.toString()),
                    value: value,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Where is it?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _latController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You need to put something';
                        }
                      },
                      decoration: InputDecoration(hintText: 'Latitude'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      controller: _longController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Longitude'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You need to put something';
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Provider.of<Scans>(context, listen: false).addScan(
                    title: _titleController.text,
                    fileContents: widget.image,
                    position: [
                      int.parse(_latController.text),
                      int.parse(_longController.text)
                    ],
                    urgency: valueItem,
                    description: _descController.text,
                  );
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      );
    });
  }
}
