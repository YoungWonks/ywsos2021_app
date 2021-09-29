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
  final TextEditingController _addressController = TextEditingController();

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
                decoration: InputDecoration(hintText: 'Description (Optional)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You need to put something';
                  }
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(hintText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You need to put something';
                  }
                },
              ),
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
              ElevatedButton(
                onPressed: () async {
                  Provider.of<Scans>(context, listen: false).addScan(
                    title: _titleController.text,
                    fileContents: widget.image,
                    address: _addressController.text,
                    urgency: valueItem,
                    // position: [12, 43.56],
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
