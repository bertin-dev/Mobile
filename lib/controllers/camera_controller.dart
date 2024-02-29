import 'package:get/get.dart';
import 'package:camera/camera.dart';

class CameraControler extends GetxController {
  late CameraController? cameraControler;
   RxList<CameraDescription> cameras = (List<CameraDescription>.of([])).obs;

  cameraController() {
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras.value = await availableCameras();
    cameraControler = CameraController(cameras[0], ResolutionPreset.high);
    await cameraControler!.initialize();
  }

  Future<Rx<XFile>> takePicture() async {
    Rx<XFile> image = XFile("").obs;
    image.value = await cameraControler!.takePicture();
    return image;
  }

  @override
  void onInit() {
    cameraController();
    super.onInit();
  }

  @override
  void onClose() {
    cameraControler?.dispose();
    super.onClose();
  }
}
