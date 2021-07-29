import 'package:flutter/foundation.dart';
import 'package:objectid/objectid.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:ywsos2021_app/widgets/carosoul_action_item.dart';
import 'package:ywsos2021_app/widgets/carousel_scanned_item.dart';

class Scans extends ChangeNotifier {
  final List<Scan> _scans = [];

  List<Scan> get scans => [..._scans];

  void addScan(Scan scanItem) {
    _scans.add(scanItem);
    notifyListeners();
  }
}
