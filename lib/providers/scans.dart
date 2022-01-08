import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/scan.dart';

class Scans extends ChangeNotifier {
  final _secureStorage = FlutterSecureStorage();
  List<Scan> _scans = [];

  List<Scan> get scans => [..._scans];

  //final starterUrl = 'http://127.0.0.1:5000';

  final starterUrl = 'http://10.0.2.2:5000';

  Future<void> getScans() async {
    final rangeJson = {"range": 100};
    var token = await _secureStorage.read(key: "token");
    final response = await http.post(
      Uri.parse('$starterUrl/api/scans/all'),
      body: json.encode(rangeJson),
      headers: {"content-type": "application/json", "TOKEN": token.toString()},
    );

    final extractedData = json.decode(response.body);
    print('DATA!: $extractedData');
    if (extractedData == null || extractedData["error"] >= 1) {
      return;
    }
    final List<Scan>? loadedScans = [];
    await Future.forEach(extractedData, (dynamic scan) async {
      final imageResponse =
          await http.get(Uri.parse('$starterUrl${scan['url']}'), headers: {
//          "Content-Type": 'application/json',
        "TOKEN": token.toString()

      });
      // print('http://10.0.2.2:5000${scan['url']}');
      // final extractedImageResponse = json.decode(imageResponse.body);
      final Scan newScan = Scan(
        date: scan['scandate'],
        des: scan['description'],
        fileContents: imageResponse.bodyBytes,
        id: scan['id'],
        address: scan['position'],
        title: scan['title'],
        upVote: scan['upvote'],
        urgency: scan['urgency'],
      );

      loadedScans?.add(newScan);
    });

    _scans = loadedScans!;

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
    var token = await _secureStorage.read(key: "token");
    try {
      var request = http.MultipartRequest("POST", Uri.parse(imageUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        fileContents,
        filename: 'filename',
        contentType: MediaType('image', 'jpeg'),
      ));
      request.headers.addAll({"TOKEN": token.toString()});
      final res = await request.send();
      final imageResponse = await res.stream.bytesToString();
      await http.post(Uri.parse(url),
          body: json.encode({
            "title": title,
            "urgency": urgency,
            "des": description,
            // "address": address,
            "filename": json.decode(imageResponse)['filename']
          }),
          headers: {
            "content-type": "application/json",
            "TOKEN": token.toString()

          });

      getScans();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
