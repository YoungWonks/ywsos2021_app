import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ywsos2021_app/widgets/carosoul_action_item.dart';
import 'package:ywsos2021_app/widgets/carousel_scanned_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentAction = 0;
  int _currentScanned = 0;
  CarouselController _carouselActioncontroller = CarouselController();
  CarouselController _carouselScannedController = CarouselController();

  TextEditingController _searchEditingController = TextEditingController();

  final List<Widget> carouselItems = [
    CarouselActionItem(
      title: 'New Scan',
      subTitle: 'You have 67 scans left',
      image: Image.asset('./assets/images/bar_code.png'),
    ),
    CarouselActionItem(
      title: 'View Gallery',
      subTitle: 'Your storage is 65% full',
      image: Image.asset(
        './assets/images/file_folder.png',
        height: 110,
      ),
    ),
  ];

  final List<Widget> carouselScannedItems = [
    CarouselScannedItem(
      title: 'Fire Hydrant',
      subTitle: 'Scanned 6 days ago',
      image: Image.asset(
        './assets/images/fire_hydrant.png',
        height: 110,
      ),
    ),
    CarouselScannedItem(
      title: 'Fire Hydrant',
      subTitle: 'Scanned 9 days ago',
      image: Image.asset(
        './assets/images/fire_hydrant.png',
        height: 110,
      ),
    ),
  ];

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
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
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
          child: ListView(children: [
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
              carouselController: _carouselActioncontroller,
            ),
            DotIndicator(
                carouselItems: carouselItems,
                controller: _carouselActioncontroller,
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
            CarouselSlider(
              items: carouselScannedItems,
              options: CarouselOptions(onPageChanged: (index, reason) {
                setState(() {
                  _currentScanned = index;
                });
              }),
            ),
            DotIndicator(
              carouselItems: carouselScannedItems,
              controller: _carouselScannedController,
              current: _currentScanned,
            ),
          ]),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.carouselItems,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final List<Widget> carouselItems;
  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: carouselItems.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
