import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/scan.dart';
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
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(hintText: 'Description (Optional)'),
              ),
              DropdownButton<String>(
                value: valueItem,
                onChanged: (String? newValue) {
                  setState(() {
                    valueItem = newValue;
                  });
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
                      position: [12, 43.56],
                      description: _descController.text,
                      fileName: 'jfaljd',
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
