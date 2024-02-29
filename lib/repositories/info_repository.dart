import 'package:secure_app/models/api_response.dart';
import 'package:secure_app/models/info_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/services/api_service.dart';

class InfoRepository {
  final APIService _apiService = APIService();

  Future<List<InfoModel>> getInfos() async {
    APIResponse response = await _apiService.getDataOnGet(
      uri: Constants.getInfosUri,
      token: localUser.token ?? "",
    );

    if (!response.error && response.data != null) {
      print(
          "response.data -----------------------------------------------------------------------------------------------------------------------------------");
      print(response.data);
      List<InfoModel> infos = [];
      infos = (response.data!["data"] as List<dynamic>).map((i) {
        print(i);
        InfoModel info =
            InfoModel.fromJson(i as Map<String, dynamic>);
        print("info");
        print(info.toJson());
        // info.createdAt = formatDate(info.createdAt!);
        return info;
      }).toList();
      return infos;
    }
    return [];
  }
}
