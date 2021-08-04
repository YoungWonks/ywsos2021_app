import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:http/http.dart' as http;

class Scans extends ChangeNotifier {
  List<Scan> _scans = [];

  List<Scan> get scans => [..._scans];

  Future<void> getScansFromRadius() async {
    var url = 'http://localhost:8000/api/scans/all';
    try {
      final response = await http.post(Uri.parse(url), body: {
        "radius": 1,
      });
      final extractedData =
          json.decode(response.body) as List<Map<String, dynamic>>?;
      if (extractedData == null) {
        return;
      }
      final List<Scan> loadedScans = [];
      extractedData.forEach((scan) {
        loadedScans.add(
          Scan(
            id: scan['_id'],
            fileContents: scan['filename'],
            upVote: scan['upvote'],
            scanPosition: scan['position'],
            scanDate: scan['scandate'],
            title: scan['title'],
            urgency: scan['urgency'],
          ),
        );
      });
      _scans = loadedScans;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addScan(Scan scanItem) {
    _scans.add(scanItem);
    notifyListeners();
  }
}
