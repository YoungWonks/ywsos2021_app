import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:ywsos2021_app/models/scan.dart';
import 'package:ywsos2021_app/widgets/custom_appbar.dart';

import '../utils/variables.dart';
import '../widgets/carousel_scanned_item.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/dot_indicator.dart';
import '../providers/scans.dart';
import 'splash_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentAction = 0;
  CarouselController _carouselActionController = CarouselController();

  TextEditingController _searchEditingController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late Future futureScans;

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  bool loading = true;

  @override
  void initState() {
    futureScans =
        Provider.of<Scans>(context, listen: false).getUserScans(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scans = Provider.of<Scans>(context).userScans;

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
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: scans.length <= 0
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'GeoRepair',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
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
                  Text(
                    'Actions',
                    style: TextStyle(
                      fontSize: 19.77,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CarouselSlider(
                    items: carouselItems,
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentAction = index;
                        });
                      },
                    ),
                    carouselController: _carouselActionController,
                  ),
                  DotIndicator(
                    carouselItems: carouselItems,
                    controller: _carouselActionController,
                    current: _currentAction,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Recently Scanned Items',
                    style: TextStyle(
                      fontSize: 19.77,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: futureScans,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator.adaptive();
                      }
                      return ListView.builder(
                        controller: ScrollController(),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: scans.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          getLocation(double lat, double long) async {
                            final location =
                                await placemarkFromCoordinates(lat, long);
                            return location;
                          }

                          try {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CarouselScannedItem(
                                title: scans[index].title,
                                subTitle: scans[index].des.toString(),
                                image: scans[index].fileContents,
                                daysAgo: scans[index].date.toString(),
                                location: scans[index].location,
                                status: scans[index].status,
                              ),
                            );
                          } catch (e) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CarouselScannedItem(
                                title: scans[index].title,
                                subTitle: scans[index].des.toString(),
                                image: '',
                                daysAgo: scans[index].date.toString(),
                                location: scans[index].location,
                                status: scans[index].status,
                              ),
                            );
                          } finally {}
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
