import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:http/http.dart' as http;

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
              lat: scan['lat'],
              long: scan['long'],
              scanDate: scan['scandate'],
              title: scan['title'],
              urgency: scan['urgency'],
              description: scan['description'],
              fileName: scan['filename']),
        );
      });
      _scans = loadedScans;
      print('All Scans: $_scans');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addScan(Scan scanItem) async {
    var url = "http://10.0.2.2:5000/api/scans/all";
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            "url": scanItem.fileContents,
            "lat": scanItem.lat,
            "long": scanItem.long,
            "filename": scanItem.fileName,
            "scandate": scanItem.scanDate,
            "title": scanItem.title,
            "urgency": scanItem.urgency,
            "descript": scanItem.description,
          }));
      final newScan = new Scan(
        description: scanItem.description,
        fileContents: scanItem.fileContents,
        fileName: scanItem.fileName,
        id: json.decode(response.body)['repairs']['_id'],
        lat: scanItem.lat,
        long: scanItem.long,
        scanDate: scanItem.scanDate,
        title: scanItem.title,
        upVote: scanItem.upVote,
        urgency: scanItem.urgency,
      );
      _scans.add(newScan);
      notifyListeners();
    } catch (e) {}
  }
}
