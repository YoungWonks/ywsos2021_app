import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:ywsos2021_app/widgets/carousel_scanned_item.dart';
import 'package:ywsos2021_app/widgets/custom_appbar.dart';
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

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  bool loading = true;

  @override
  void initState() {
    futureScans = Provider.of<Scans>(context, listen: false).getScans(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scans = Provider.of<Scans>(context).scans;
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
        backgroundColor: Colors.transparent,
        drawer: AppDrawer(),
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
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
                      'assets/hammer.png',
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

                    setState(() {
                      scans = allScans.where((scan) {
                        final titleLower = scan.title.toLowerCase();
                        final searchLower = value.toLowerCase();

                        return titleLower.contains(searchLower);
                      }).toList();
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: futureScans,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: scans.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarouselScannedItem(
                              ifPersonUpVoted: scans[index].isVoted,
                              upVote: scans[index].upVote!.toInt(),
                              title: scans[index].title,
                              subTitle: scans[index].des.toString(),
                              image: scans[index].fileContents,
                              daysAgo: scans[index].date.toString(),
                              location: scans[index].location,
                              status: scans[index].status,
                              id: scans[index].id.toString(),
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
