import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/scan.dart';

class Scans extends ChangeNotifier {
  List<Scan>? _scans = [];

  List<Scan> get scans => [..._scans!];

  final starterUrl = 'http://127.0.0.1:5000';

  void getScans() async {
    final rangeJson = {"range": 100};
    final response = await http.post(
      Uri.parse('$starterUrl/api/scans/all'),
      body: json.encode(rangeJson),
      headers: {
        "Content-Type": "application/json",
        "Token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiNjExZDkyODI4YjgzNzhmMTY0NTUxMzQyIiwiZXhwIjoxNjI5NTE4MzI2fQ.tB7KqXIIIdVHgm9A1aoBpEcjL9i4sJL1azjY96suLrc"
      },
    );

    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }
    final List<Scan> loadedScans = [];
    await Future.forEach(extractedData['repairs'], (dynamic scan) async {
      final imageResponse =
          await http.get(Uri.parse('$starterUrl${scan['url']}'), headers: {
        // "Content-Type": 'application/json',
        // "Token":
        //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiNjExZDkyODI4YjgzNzhmMTY0NTUxMzQyIiwiZXhwIjoxNjI5NTE4MzI2fQ.tB7KqXIIIdVHgm9A1aoBpEcjL9i4sJL1azjY96suLrc"
      });
      // print('http://10.0.2.2:5000${scan['url']}');
      // final extractedImageResponse = json.decode(imageResponse.body);
      final Scan newScan = Scan(
        date: scan['scandate'],
        des: scan['description'],
        fileContents: imageResponse.bodyBytes,
        id: scan['id'],
        position: scan['position'],
        title: scan['title'],
        upVote: scan['upvote'],
        urgency: scan['urgency'],
      );

      loadedScans.add(newScan);
    });

    _scans = loadedScans;

    notifyListeners();
  }

  void addScan(
      {required String title,
      required String? description,
      required int? urgency,
      required String address,
      required Uint8List fileContents}) async {
    String url = "$starterUrl/api/scans/add";
    String imageUrl = "$starterUrl/api/scans/upload";
    try {
      var request = http.MultipartRequest("POST", Uri.parse(imageUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        fileContents,
        filename: 'filename',
        contentType: MediaType('image', 'jpeg'),
      ));
      request.headers.addAll({
        "Token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiNjExZDkyODI4YjgzNzhmMTY0NTUxMzQyIiwiZXhwIjoxNjI5NTk0NTYxfQ.tLlYkSPsznhHMyUfMH26pzuVll7TeZfQrl3N6Cp1nlA"
      });
      final res = await request.send();
      final imageResponse = await res.stream.bytesToString();
      await http.post(Uri.parse(url),
          body: json.encode({
            "title": title,
            "urgency": urgency,
            "des": description,
            "address": address,
            "filename": json.decode(imageResponse)['filename']
          }),
          headers: {
            "Content-Type": "application/json",
            "Token":
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiNjExZDkyODI4YjgzNzhmMTY0NTUxMzQyIiwiZXhwIjoxNjI5NTE4MzI2fQ.tB7KqXIIIdVHgm9A1aoBpEcjL9i4sJL1azjY96suLrc"
          });

      getScans();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
