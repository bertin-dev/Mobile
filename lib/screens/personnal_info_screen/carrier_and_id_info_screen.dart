import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/screens/personnal_info_screen/components/resume_dropdown_component.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class CarrierAndIdInfoScreen extends StatelessWidget {
  CarrierAndIdInfoScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());
  List<String> professionList = ["Etudiant", "Travailleur"];
  List<String> incomesMean = [
    "0-100 000 Fcfa / mois",
    "100 000-500 000 Fcfa / mois",
    "500 000-1 000 000 Fcfa / mois"
  ];
  List<String> identificationDocumentList = [
    "Récépissé",
    "CNI",
    "Permis de conduire",
    "Passeport"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Constants.screenHeight(context) / 2.2,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel(label: "Profession", paddingTop: 13.0),
                DropDownComponent(
                  hasIcon: false,
                  fieldLabel: "Profession",
                  itemsList: professionList,
                  onChanged: (String? value) {
                    _userController.profession(value);
                    _formController.fieldVerification(
                      field: value!,
                      isName: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnProfession(error),
                    );
                  },
                ),
                _formController.hasErrorOnProfession.value.isNotEmpty
                    ? InputLabel(
                        label: _formController.hasErrorOnProfession.value,
                        paddingTop: 8.0,
                        color: AppColors.red,
                      )
                    : const SizedBox(),
                InputLabel(label: "Revenu moyen", paddingTop: 13.0),
                DropDownComponent(
                  hasIcon: false,
                  fieldLabel: "Revenu moyen",
                  itemsList: incomesMean,
                  onChanged: (String? value) {
                    _userController.meanIncomes(value);
                    _formController.fieldVerification(
                      field: value!,
                      isName: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnMeanIncomes(error),
                    );
                  },
                )
              ],
            ),
            _formController.hasErrorOnMeanIncomes.value.isNotEmpty
                ? InputLabel(
                    label: _formController.hasErrorOnMeanIncomes.value,
                    paddingTop: 8.0,
                    color: AppColors.red,
                  )
                : const SizedBox(),
            const SizedBox(height: 46.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel(
                    label: "Piece officielle d’identification",
                    paddingTop: 13.0),
                DropDownComponent(
                  hasIcon: false,
                  fieldLabel: "Piece officielle",
                  itemsList: identificationDocumentList,
                  onChanged: (String? value) {
                    _userController.idType(value);
                    _formController.fieldVerification(
                      field: value!,
                      isName: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnIDType(error),
                    );
                  },
                ),
                _formController.hasErrorOnIDType.value.isNotEmpty
                    ? InputLabel(
                        label: _formController.hasErrorOnIDType.value,
                        paddingTop: 8.0,
                        color: AppColors.red,
                      )
                    : const SizedBox(),
                InputLabel(
                    label: "Numero unique de la piece officielle",
                    paddingTop: 13.0),
                InputField(
                  labelText: "",
                  hasIcon: false,
                  isElevated: false,
                  hasShadow: false,
                  hasSuffix: false,
                  contentPadding: 16.0,
                  // isPhoneNumber: true,
                  icon: FontAwesomeIcons.a,
                  keyboardType: TextInputType.text,
                  iconColor: AppColors.dark,
                  value: _userController.idNumber.value,
                  onChanged: (String value) {
                    _userController.idNumber(value);
                    _formController.fieldVerification(
                      field: value,
                      isName: true,
                      errorCallback: (String error) =>
                          _formController.hasErrorOnIDNumber(error),
                    );
                  },
                ),
                _formController.hasErrorOnIDNumber.value.isNotEmpty
                    ? InputLabel(
                        label: _formController.hasErrorOnIDNumber.value,
                        paddingTop: 8.0,
                        color: AppColors.red,
                      )
                    : const SizedBox(),
              ],
            )
          ],
        );
      }),
    );
  }
}
