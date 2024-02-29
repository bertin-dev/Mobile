import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';

class OnBoardController extends GetxController {
  RxInt pageIndex = 0.obs;
  final Rx<StoryController> controller = StoryController().obs;
  void setPageIndex(int index) {
    pageIndex(index);
    print(pageIndex);
  }

  @override
  void onInit() {
    pageIndex(0);
    super.onInit();
  }
}
