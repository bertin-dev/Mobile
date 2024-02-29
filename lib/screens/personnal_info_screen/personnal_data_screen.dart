import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/data.dart';
import 'package:secure_app/screens/personnal_info_screen/components/resume_dropdown_component.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class PersonalDataScreen extends StatelessWidget {
  PersonalDataScreen({super.key});

  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  List<String> countryList = ["Cameroun"];
  // List<String> cityList = ["Douala", "Yaoundé", "Bafoussam"];
  List<String> genderList = ["Masculin", "Feminin"];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputLabel(label: "Pays d origine", paddingTop: 13.0),
          DropDownComponent(
            hasIcon: true,
            fieldLabel: "Pays d origine",
            itemsList: countryList,
            onChanged: (String? value) {
              _userController.country(value);
              _formController.fieldVerification(
                field: value!,
                isName: true,
                errorCallback: (String error) =>
                    _formController.hasErrorOnCountry(error),
              );
            },
          ),
          _formController.hasErrorOnCountry.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnCountry.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
          InputLabel(label: "Ville", paddingTop: 13.0),
          DropDownComponent(
            hasIcon: false,
            fieldLabel: "Ville",
            itemsList: cityList,
            onChanged: (String? value) {
              _userController.city(value);
              _formController.fieldVerification(
                field: value!,
                isName: true,
                errorCallback: (String error) =>
                    _formController.hasErrorOnCity(error),
              );
            },
          ),
          _formController.hasErrorOnCity.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnCity.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
          InputLabel(label: "Adresse", paddingTop: 13.0),
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
            value: _userController.adress.value,
            onChanged: (String value) {
              _userController.adress(value);
              _formController.fieldVerification(
                field: value,
                isName: true,
                errorCallback: (String error) =>
                    _formController.hasErrorOnAdress(error),
              );
            },
          ),
          _formController.hasErrorOnAdress.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnAdress.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
          InputLabel(label: "Date de naissance", paddingTop: 46.0),
          GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                    fieldHintText: "Choissez une date",
                    locale: const Locale('fr'),
                    fieldLabelText: "Date",
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1920),
                    lastDate: DateTime.now());
                print(picked);
                if (picked != null &&
                    picked.toString() != _userController.birthday.value) {
                  _userController
                      .birthday(DateFormat('yyyy-MM-dd').format(picked));
                }
                _formController.fieldVerification(
                  field: picked.toString(),
                  isName: true,
                  errorCallback: (String error) =>
                      _formController.hasErrorOnBirthday(error),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical:
                        _userController.birthday.value.isNotEmpty ? 18.0 : 25.0,
                    horizontal: 12.0),
                decoration: BoxDecoration(
                    color: AppColors.imputBg,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  _userController.birthday.value,
                  style: AppStyles.textPoppinsStyle(
                      color: AppColors.dark, size: 12.0),
                ),
              )),
          _formController.hasErrorOnBirthday.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnBirthday.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
          // InputField(
          //   labelText: "",
          //   hasIcon: false,
          //   isElevated: false,
          //   hasShadow: false,
          //   hasSuffix: false,
          //   contentPadding: 16.0,
          //   // isPhoneNumber: true,
          //   icon: FontAwesomeIcons.a,
          //   keyboardType: TextInputType.visiblePassword,
          //   iconColor: AppColors.dark,
          //   value: "",
          //   onChanged: (String value) {},
          // ),
          InputLabel(label: "Sexe", paddingTop: 13.0),
          DropDownComponent(
            hasIcon: false,
            fieldLabel: "Sexe",
            itemsList: genderList,
            onChanged: (String? value) {
              _userController.sexe(value);
              _formController.fieldVerification(
                field: value!,
                isName: true,
                errorCallback: (String error) =>
                    _formController.hasErrorOnSexe(error),
              );
            },
          ),
          _formController.hasErrorOnSexe.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnSexe.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
