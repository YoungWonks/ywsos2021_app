import 'dart:convert';
import 'dart:typed_data';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ywsos2021_app/utils/variables.dart';

import '../models/scan.dart';

class Scans extends ChangeNotifier {
  final _secureStorage = FlutterSecureStorage();
  List<Scan> _userScans = [];
  List<Scan> _scans = [];

  List<Scan> get userScans => [..._userScans];
  List<Scan> get scans => [..._scans];

  //final starterUrl = 'http://127.0.0.1:5000';

  Future<void> getUserScans(BuildContext context) async {
    try {
      var token = await _secureStorage.read(key: "token");
      final response = await http.post(
        Uri.parse('$indexUrl/api/scans/gallery'),
        headers: {
          "content-type": "application/json",
          "TOKEN": token.toString()
        },
      );

      final extractedData = json.decode(response.body);
      print('DATA!: $extractedData');
      if (extractedData == null || extractedData['error'] != null) {
        Flushbar(
          title: 'An error occured getting votes',
          message: 'an error occured',
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.red[300],
        )..show(context);
        return;
      }
      final List<Scan>? loadedScans = [];
      await Future.forEach(extractedData['repairs'], (dynamic scan) async {
        // print(scan['url']);
//         final imageResponse =
//             await http.get(Uri.parse('$indexUrl/${scan['url']}'), headers: {
// //          "Content-Type": 'application/json',
//           "TOKEN": token.toString()
//         });
        // print('http://10.0.2.2:5000${scan['url']}');
        // final extractedImageResponse = json.decode(imageResponse.body);
        final location = await placemarkFromCoordinates(
            scan['position']['lat'], scan['position']['long']);
        print('id of scan ${scan['id']}');
        final isVoted = await getVotedScans(context, scan['id']);
        print("Is Voted: $isVoted");
        final Scan newScan = Scan(
          date: scan['scandate'],
          des: scan['description'],
          fileContents: scan['url'].toString().split(',').last,
          id: scan['id'],
          location: location,
          title: scan['title'],
          upVote: scan['upvote'],
          urgency: scan['urgency'],
          status: scan['status'],
          isVoted: isVoted,
        );

        loadedScans?.add(newScan);
      });

      _userScans = loadedScans!;

      notifyListeners();
    } catch (e) {
      Flushbar(
        title: 'Error occured',
        message: e.toString(),
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
    }
  }

  Future<void> getScans(BuildContext context) async {
    try {
      var token = await _secureStorage.read(key: "token");
      final response = await http.post(
        Uri.parse('$indexUrl/api/scans/gallery'),
        headers: {
          "content-type": "application/json",
          "TOKEN": token.toString()
        },
      );

      final extractedData = json.decode(response.body);
      print('Extracted data error is: ' + extractedData['error']);
      // print('DATA!: $extractedData');
      if (extractedData == null || extractedData['error'] != "0") {
        Flushbar(
          title: 'An error occured getting votes',
          message: 'An error occured',
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.red[300],
        )..show(context);
        return;
      }
      final List<Scan>? loadedScans = [];
      await Future.forEach(extractedData['repairs'], (dynamic scan) async {
        // print(scan['url']);
//         final imageResponse =
//             await http.get(Uri.parse('$indexUrl/${scan['url']}'), headers: {
// //          "Content-Type": 'application/json',
//           "TOKEN": token.toString()
//         });
        // print('http://10.0.2.2:5000${scan['url']}');
        // final extractedImageResponse = json.decode(imageResponse.body);
        final location = await placemarkFromCoordinates(
            scan['position']['lat'], scan['position']['long']);

        final isVoted = await getVotedScans(context, scan['id']);

        print(isVoted);

        final Scan newScan = Scan(
          date: scan['scandate'],
          des: scan['description'],
          fileContents: scan['url'].toString().split(',').last,
          id: scan['id'],
          location: location,
          title: scan['title'],
          upVote: scan['upvote'],
          urgency: scan['urgency'],
          status: scan['status'],
          isVoted: isVoted,
        );

        loadedScans?.add(newScan);
      });

      _scans = loadedScans!;

      notifyListeners();
    } catch (e) {
      Flushbar(
        title: 'Error occured',
        message: e.toString(),
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
    }
  }

  void addScan(
      {required String title,
      required String? description,
      required int? urgency,
      required List<int> position,
      required Uint8List fileContents,
      required BuildContext context}) async {
    try {
      String url = "$indexUrl/api/scans/add";
      String imageUrl = "$indexUrl/api/scans/upload";
      var token = await _secureStorage.read(key: "token");

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

      getUserScans(context);
      notifyListeners();
    } catch (e) {
      Flushbar(
        title: 'Error occured',
        message: e.toString(),
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
    }
  }

  Future<void> upvotePost(String id, BuildContext context) async {
    try {
      var token = await _secureStorage.read(key: "token");
      final response = await http.post(Uri.parse('$indexUrl/api/vote/voting'),
          body: json.encode({
            "scan_id": id,
          }),
          headers: {
            "content-type": "application/json",
            "TOKEN": token.toString(),
          });
      final extractedData = json.decode(response.body);

      if (extractedData == null || extractedData['error'] != "0") {
        Flushbar(
          title: 'An error occured getting votes',
          message: extractedData['error'],
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.red[300],
        )..show(context);
        return;
      }
      Flushbar(
        title: 'Successfully upvoted/downvoted!',
        message: 'You have successfully upvoted/downvoted this post',
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.green[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.green[300],
      )..show(context);

      return;
    } catch (e) {
      Flushbar(
        title: 'An error occured upvoting',
        message:
            'Something went wrong. Please come back later to see if it has been resolved.',
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
    }
    notifyListeners();
  }

  Future<bool?> getVotedScans(BuildContext context, String id) async {
    try {
      var token = await _secureStorage.read(key: "token");
      final response = await http.post(Uri.parse('$indexUrl/api/vote/voted'),
          body: json.encode({
            "scan_id": id,
          }),
          headers: {
            "content-type": "application/json",
            "TOKEN": token.toString(),
          });
      print('BODY: ${response.body}');
      final extractedData = json.decode(response.body);
      print('Error is: ' + extractedData['error']);

      if (extractedData == null || extractedData['error'] != "0") {
        Flushbar(
          title: 'An error occured getting votes',
          message: 'An error occured',
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.red[300],
        )..show(context);
      }
      print('data: $extractedData');
      notifyListeners();
      return extractedData['voted'];
    } catch (e) {
      print(e.toString());
      Flushbar(
        title: 'An error occured getting votes',
        message:
            'Something went wrong. Please come back later to see if it has been resolved.',
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
      return false;
    }
  }
}
