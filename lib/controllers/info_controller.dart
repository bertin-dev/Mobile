import 'package:get/get.dart';
import 'package:secure_app/models/info_model.dart';
import 'package:secure_app/repositories/info_repository.dart';
import 'package:secure_app/ressources/constants.dart';

class InfoController extends GetxController {
  final InfoRepository _infoRepository = InfoRepository();
  RxString err = "".obs;
  RxBool isLoading = false.obs;
  RxList<dynamic>? infos = (List<dynamic>.of([])).obs;

  Future<void> getInfos() async {
    err('');
    try {
      isLoading(true);
      infos!(await _infoRepository.getInfos());
      if (infos != null && infos!.isNotEmpty) {
        isLoading(false);
        for (InfoModel info in infos!) {
          // print(transaction.createdAt);
          info.createdAt = Constants.formatCardDate(info.createdAt!);
          // assignTransactions(transactions);
        }
        infos!.sort((a, b) {
          String? dateA = a.createdAt;
          String? dateB = b.createdAt;
          // print(dateB);
          return dateB!.compareTo(dateA!);
        });

        err('success');
      }
      isLoading(false);
    } catch (error) {
      isLoading(false);
      err("Une erreur est survenue, veuillez reessayer!");
    }
  }

  @override
  void onInit() {
    getInfos();
    super.onInit();
  }
}
