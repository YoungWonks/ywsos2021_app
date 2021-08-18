import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/scan.dart';

class Scans extends ChangeNotifier {
  List<Scan> _scans = [];

  List<Scan> get scans => [..._scans];

  Future<void> getScansFromRadius() async {
    try {
      final rangeJson = {"range": 1};
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/scans/all'),
        body: json.encode(rangeJson),
        headers: {"Content-Type": "application/json"},
      );

      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      final List<Scan> loadedScans = [];
      extractedData['repairs'].forEach((scan) {
        loadedScans.add(
          Scan(
              id: scan['_id'],
              fileContents: scan['fileContents'],
              upVote: scan['upvote'],
              position: scan['position'],
              scanDate: scan['scandate'],
              title: scan['title'],
              urgency: scan['urgency'],
              description: scan['description'],
              fileName: scan['filename']),
        );
      });
      _scans = loadedScans;
      // print('All Scans: $_scans');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addScan(Scan scanItem) async {
    String url = "http://10.0.2.2:5000/api/scans/add";
    String imageUrl = "http://10.0.2.2:5000/api/scans/upload";
    try {
      var request = http.MultipartRequest("POST", Uri.parse(imageUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        scanItem.fileContents,
      ));
      final res = await request.send();
      final imageResponse = await res.stream.bytesToString();
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            // "url": scanItem.fileContents,
            "position": scanItem.position, // ex: [2, 23.5]
            // "filename": scanItem.fileName,
            "title": scanItem.title,
            "urgency": scanItem.urgency,
            "descript": scanItem.description,
            "imageid": json.decode(imageResponse)['imageId']
          }));

      final date = DateTime.now().millisecondsSinceEpoch;

      final newScan = Scan(
        description: scanItem.description,
        fileContents: scanItem.fileContents,
        fileName: scanItem.fileName,
        scanDate: date.toString(),
        id: json.decode(response.body)['_id'],
        position: scanItem.position,
        title: scanItem.title,
        upVote: scanItem.upVote,
        urgency: scanItem.urgency,
      );
      _scans.add(newScan);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
