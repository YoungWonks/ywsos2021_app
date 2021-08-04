import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/splash_screen.dart';
import 'package:ywsos2021_app/widgets/add_scan_dialog.dart';

class TakePictureScreen extends StatefulWidget {
  static const routeName = '/take-picture';

  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late List<CameraDescription> cameras;

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.medium);
      await _controller.initialize();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder(
        future: setupCameras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CameraPreview(_controller),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width / 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      onPressed: () async {
                        try {
                          final image = await _controller.takePicture();
                          final convertedImage = await image.readAsBytes();

                          // If the picture was taken, display it on a new screen.
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AddScanDialog(image: convertedImage);
                            },
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: Container(
                        height: 92,
                        width: 90,
                        child: Icon(
                          Icons.add,
                          size: 59,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFA9C697),
                              Color(0xFFA1C6B8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Spacer(),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return SplashScreen();
          }
        },
      ),
    );
  }
}
