import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:ywsos2021_app/providers/scans.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';

class AddScanDialog extends StatefulWidget {
  final Uint8List image;

  AddScanDialog({Key? key, required this.image}) : super(key: key);

  @override
  _AddScanDialogState createState() => _AddScanDialogState();
}

class _AddScanDialogState extends State<AddScanDialog> {
  final TextEditingController _titleController = TextEditingController();

  final List<String> urgencyItems = [
    'Really Urgent',
    'Kind of Urgent',
    'Not Urgent'
  ];

  String? valueItem = 'Really Urgent';

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
                decoration: InputDecoration(hintText: 'Title'),
              ),
              DropdownButton<String>(
                value: valueItem,
                onChanged: (String? newValue) {
                  setState(() {});
                },
                items:
                    urgencyItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () async {
                  Provider.of<Scans>(context, listen: false).addScan(
                    Scan(
                      id: null,
                      title: _titleController.text,
                      scanDate: DateTime.now().toIso8601String(),
                      fileContents: widget.image,
                      urgency: valueItem.toString(),
                      upVote: 0,
                      scanPosition: ScanPosition(lat: 100, long: 120),
                    ),
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
