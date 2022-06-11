import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/scan.dart';

class Scans extends ChangeNotifier {
  final _secureStorage = FlutterSecureStorage();
  List<Scan> _userScans = [];
  List<Scan> _scans = [];

  List<Scan> get userScans => [..._userScans];
  List<Scan> get scans => [..._scans];

  //final starterUrl = 'http://127.0.0.1:5000';

  final indexUrl = 'https://georepair.herokuapp.com';

  Future<void> getUserScans() async {
    var token = await _secureStorage.read(key: "token");
    final response = await http.post(
      Uri.parse('$indexUrl/api/scans/gallery'),
      headers: {"content-type": "application/json", "TOKEN": token.toString()},
    );

    final extractedData = json.decode(response.body);
    // print('DATA!: $extractedData');
    if (extractedData == null || extractedData['error'] != null) {
      return;
    }
    final List<Scan>? loadedScans = [];
    await Future.forEach(extractedData['repairs'], (dynamic scan) async {
      // print(scan['url']);
      final imageResponse =
          await http.get(Uri.parse('$indexUrl${scan['url']}'), headers: {
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
        position: scan['position'],
        title: scan['title'],
        upVote: scan['upvote'],
        urgency: scan['urgency'],
      );

      loadedScans?.add(newScan);
    });

    _userScans = loadedScans!;

    notifyListeners();
  }

  Future<void> getScans() async {
    var token = await _secureStorage.read(key: "token");
    final response = await http.post(Uri.parse('$indexUrl/api/scans/all'),
        headers: {
          "content-type": "application/json",
          "TOKEN": token.toString()
        },
        body: json.encode({
          "position": [20, 10]
        }));

    final extractedData = json.decode(response.body);
    print('DATA!: $extractedData');
    // if (extractedData == null || extractedData['error'] != null) {
    //   return;
    // }
    final List<Scan>? loadedScans = [];
    await Future.forEach(extractedData['repairs'], (dynamic scan) async {
      final imageResponse =
          await http.get(Uri.parse('$indexUrl${scan['url']}'), headers: {
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
        position: scan['position'],
        title: scan['title'],
        upVote: scan['upvote'],
        urgency: scan['urgency'],
      );

      debugPrint(imageResponse.body);
      debugPrint(imageResponse.statusCode.toString());

      loadedScans?.add(newScan);
    });

    _scans = loadedScans!;

    notifyListeners();
  }

  void addScan(
      {required String title,
      required String? description,
      required int? urgency,
      required List<int> position,
      required Uint8List fileContents}) async {
    String url = "$indexUrl/api/scans/add";
    String imageUrl = "$indexUrl/api/scans/upload";
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
            "position": position,
            "filename": json.decode(imageResponse)['filename'],
          }),
          headers: {
            "content-type": "application/json",
            "TOKEN": token.toString()
          });

      getUserScans();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
