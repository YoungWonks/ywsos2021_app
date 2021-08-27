import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ywsos2021_app/utils/variables.dart';

import 'add_photo_gallery_screen.dart';
import '../widgets/carosoul_action_item.dart';
import '../widgets/carousel_scanned_item.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/dot_indicator.dart';
import '../providers/scans.dart';
import 'splash_screen.dart';
import 'take_picture_screen.dart';

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

  void _refreshScans(BuildContext context) {
    Provider.of<Scans>(context, listen: false).getScans();
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  bool loading = true;

  @override
  void initState() {
    _refreshScans(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scans = Provider.of<Scans>(context);
    return loading == true
        ? SplashScreen()
        : Container(
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
                  child: Column(children: [
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
                      placeholder: 'What are you searching for?',
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
                          borderRadius: BorderRadius.circular(16)),
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
                      options: CarouselOptions(onPageChanged: (index, reason) {
                        setState(() {
                          _currentAction = index;
                        });
                      }),
                      carouselController: _carouselActionController,
                    ),
                    DotIndicator(
                        carouselItems: carouselItems,
                        controller: _carouselActionController,
                        current: _currentAction),
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
                    Container(
                      height: 210,
                      child: PageView.builder(
                        itemCount: scans.scans.length,
                        itemBuilder: (context, index) {
                          return CarouselScannedItem(
                            title: scans.scans[index].title,
                            subTitle: scans.scans[index].des.toString(),
                            image: scans.scans[index].fileContents,
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
  }
}
