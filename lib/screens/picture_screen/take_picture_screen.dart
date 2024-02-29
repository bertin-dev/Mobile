import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/camera_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    this.isSelfie = false,
  }) : super(key: key);
  final bool isSelfie;
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  final CameraControler cameraControler = Get.find();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      !widget.isSelfie
          ? cameraControler.cameras[0]
          : cameraControler.cameras[1],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prendre une photo",
          style: AppStyles.textStyle(color: AppColors.dark),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            FontAwesomeIcons.arrowLeft,
            // size: 25.0,
          ),
        ),
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: Stack(
        children: [
          SizedBox(
            // width: Constants.screenWidth(context),
            // height: Constants.screenHeight(context),
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  final image = await _controller.takePicture();

                  Navigator.of(context).pop({'imagePath': image.path});
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(bottom: 30.0),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(18.0)),
                child: Icon(
                  Icons.camera_alt,
                  color: AppColors.white,
                  size: 30.0,
                ),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primary,
      //   // Provide an onPressed callback.
      //   onPressed: () async {
      //     // Take the Picture in a try / catch block. If anything goes wrong,
      //     // catch the error.
      //     try {
      //       // Ensure that the camera is initialized.
      //       await _initializeControllerFuture;

      //       // Attempt to take a picture and get the file `image`
      //       // where it was saved.
      //       final image = await _controller.takePicture();

      //       Navigator.of(context).pop({'imagePath': image.path});
      //     } catch (e) {
      //       // If an error occurs, log the error to the console.
      //       if (kDebugMode) {
      //         print(e);
      //       }
      //     }
      //   },
      //   child: const Icon(
      //     Icons.camera_alt,
      //     color: AppColors.white,
      //   ),
      // ),
    );
  }
}
