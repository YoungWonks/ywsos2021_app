import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:ywsos2021_app/widgets/carousel_scanned_item.dart';
import '../widgets/custom_drawer.dart';
import '../providers/scans.dart';

class ForumScreen extends StatefulWidget {
  static const routeName = "/forum";
  const ForumScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  TextEditingController _searchEditingController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future? futureScans;
  late List<Scan> scans;

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  bool loading = true;

  @override
  void didChangeDependencies() {
    futureScans = Provider.of<Scans>(context, listen: false).getScans();
    scans = Provider.of<Scans>(context).scans;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF97AC94),
            Color(0xFF5C745C),
            // Color(0xFFA2C08B),
            // Color(0xFF82C1D6),
            Color(0xFF64919F),
          ],
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
              onTap: () {
                if (_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState!.openEndDrawer();
                } else {
                  _scaffoldKey.currentState!.openDrawer();
                }
              },
              child: Image.asset('./assets/images/drawer_icon.png')),
          elevation: 0,
          centerTitle: true,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'TATA',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: Colors.black),
                ),
                Text(
                  'Personal profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9.0,
                    color: Colors.white.withOpacity(0.77),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset(
              './assets/images/profile_pic.png',
              width: 55,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'GeoRepair',
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(
                      width: 18.52,
                    ),
                    Image.asset(
                      './assets/hammer.png',
                      width: 45.96,
                      height: 44.35,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CupertinoSearchTextField(
                  itemColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  placeholder: 'What scan are you searching for?',
                  placeholderStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17.0,
                  ),
                  controller: _searchEditingController,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9DB68E),
                        Colors.white.withOpacity(0.56),
                        Color(0xFF64919F).withOpacity(0.71),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onChanged: (value) {
                    final allScans =
                        Provider.of<Scans>(context, listen: false).scans;
                    scans = allScans.where((scan) {
                      final titleLower = scan.title.toLowerCase();
                      final searchLower = value.toLowerCase();

                      return titleLower.contains(searchLower);
                    }).toList();

                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: futureScans,
                  builder: (context, snapshot) {
                    return SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: scans.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarouselScannedItem(
                              title: scans[index].title,
                              subTitle: scans[index].des.toString(),
                              image: scans[index].fileContents,
                              daysAgo: scans[index].date.toString(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
