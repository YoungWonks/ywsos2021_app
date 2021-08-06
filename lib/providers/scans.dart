import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:http/http.dart' as http;

class Scans extends ChangeNotifier {
  List<Scan> _scans = [];

  List<Scan> get scans => [..._scans];

  Future<void> getScansFromRadius() async {
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
          fileContents: scan['filename'],
          upVote: scan['upvote'],
          lat: scan['lat'],
          long: scan['long'],
          scanDate: scan['scandate'],
          title: scan['title'],
          urgency: scan['urgency'],
        ),
      );
    });
    _scans = loadedScans;
    print('All Scans: $_scans');
    notifyListeners();
  }

  void addScan(Scan scanItem) {
    _scans.add(scanItem);
    notifyListeners();
  }
}
