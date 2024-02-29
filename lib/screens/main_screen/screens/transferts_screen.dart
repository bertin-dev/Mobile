import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/rounded_checkbox.dart';


class TransfertsScreen extends StatelessWidget {
  TransfertsScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final TransactionController _transactionController =
      Get.put(TransactionController());
  final UserController _userController = Get.put(UserController());
  TextEditingController _phoneController = TextEditingController();
  void searchUser(BuildContext context, String value) async {
    _formController.fieldVerification(
      field: value,
      isSameUser: true,
      errorCallback: (String error) =>
          _formController.hasErrorOnRechargePhone(error),
    );
    if (_formController.isToSekureAccountTransfer.value &&
        _transactionController.phone.value.length == 9 &&
        _formController.hasErrorOnRechargePhone.isEmpty) {
      _transactionController.isSearchUser(true);
      _transactionController.receiver = UserModel().obs;
      FocusScope.of(context).requestFocus(FocusNode());
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (context) {
      //     return Container(
      //       color: Colors.transparent,
      //       child: LoadingAnimationWidget.inkDrop(
      //         color: AppColors.primary,
      //         size: 50,
      //       ),
      //     );
      //   },
      // );

      await _transactionController
          .checkReceiver(_transactionController.phone.value);
      if (_transactionController.receiver != null) {
        // Get.back();
        _transactionController.isSearchUser(false);
        if (_transactionController.receiver!.value.name == null ||
            (_transactionController.receiver!.value.name == null &&
                _transactionController.receiver!.value.name!.isEmpty)) {
          Constants.snackBar(
              bgColor: AppColors.red,
              textColor: AppColors.white,
              description: "Aucun utilisateur trouvé");
        }
      } else {
        _userController
            .isProfileExist(_transactionController.receiver!.value.photo!);
      }
      // if (_transactionController.transactions != null &&
      //     _transactionController.transactions!.isNotEmpty) {
      //   Get.back();
      // }
    }
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    String selectedPaymentMethod = '';
    return Padding(
      padding: EdgeInsets.only(top: 38 * fem),
      // padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 38.0),
      child: Obx(() {
        return SizedBox(
          // height: Constants.screenHeight(context),
          // width: Constants.screenWidth(context),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22 * fem, right: 22 * fem),
                child: Text.rich(
                  TextSpan(
                    style: AppStyles.textStyle (
                      size: 39*ffem,
                      weight: FontWeight.w500,
                      height: 0.9230769231*ffem/fem,
                      letterSpacing: -0.195*fem,
                      color: AppColors.txtSoldeColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Transferer de l’argent',
                        style: AppStyles.textStyle(
                          size: 39*ffem,
                          weight: FontWeight.w500,
                          height: 0.9230769231*ffem/fem,
                          letterSpacing: -0.195*fem,
                          color: AppColors.txtSoldeColor,
                        ),
                      ),
                      TextSpan(
                        text: ' partout en Afrique',
                        style: AppStyles.textStyle(
                          fontFamily: 'Lufga',
                          size: 39*ffem,
                          weight: FontWeight.w500,
                          height: 0.9230769231*ffem/fem,
                          letterSpacing: -0.195*fem,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: Constants.screenHeight(context),
                margin: EdgeInsets.only(top: 24*fem),
                padding:
                     EdgeInsets.only(left: 22 *fem, right: 22*fem, top: 22*fem),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27.0),
                        topRight: Radius.circular(27.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedCheckbox(
                          isChecked:
                              _formController.isToSekureAccountTransfer.value,
                          label: "Vers Compte SEKURE",
                          onChecked: (value) {
                            _formController.updateToSekureTransfer(value);
                            if (_transactionController.phone.value.isNotEmpty) {
                              searchUser(
                                  context, _transactionController.phone.value);
                            }
                          },
                        ),
                        RoundedCheckbox(
                          isChecked:
                              _formController.isToMomoAccountTransfer.value,
                          label: "Vers Mobile Money",
                          padding: 10*fem,
                          onChecked: (value) {
                            _formController.updateToMomoTransfer(value);
                            // searchUser(context,
                            //     _transactionController.phone.value.toString());
                          },
                        ),
                      ],
                    ),
                     InputLabel(
                        label: "Montant à envoyer", paddingTop: 27*fem, color: AppColors.gray700,),
                    Padding(
                      padding: EdgeInsets.only(top: 5*fem),
                      child: InputField(
                        labelText: "5000",
                        hasIcon: false,
                        isElevated: false,
                        hasShadow: false,
                        hasSuffix: true,
                        isNotRegularCaracter: true,
                        inputBg: AppColors.imputBg,
                        contentPadding: 16*fem,
                        suffixIcon: IntrinsicHeight(
                          child: IntrinsicWidth(
                            child: Container(
                                margin:
                                    EdgeInsets.symmetric(vertical: 8*fem),
                                padding: EdgeInsets.only(
                                    left: 12*fem, right: 12*fem),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Center(
                                  child: Text("FCFA",
                                      style: AppStyles.textStyle(
                                          color: AppColors.white,
                                        fontFamily: 'Poppins',
                                        size: 16*ffem,
                                        weight: FontWeight.w700,
                                        height: 1.5*ffem/fem,
                                        letterSpacing: -0.64*fem,)),
                                )),
                          ),
                        ),
                        icon: FontAwesomeIcons.a,
                        keyboardType: TextInputType.number,
                        iconColor: AppColors.dark,
                        value: _transactionController.amount.value,
                        onChanged: (String value) {
                          _transactionController.amount(value);
                          _formController.fieldVerification(
                            field: value,
                            isAmountBalance: true,
                            errorCallback: (String error) =>
                                _formController.hasErrorOnRechargeAmount(error),
                          );
                        },
                      ),
                    ),
                    _formController.hasErrorOnRechargeAmount.value.isNotEmpty
                        ? InputLabel(
                            label:
                                _formController.hasErrorOnRechargeAmount.value,
                            paddingTop: 8.0,
                            color: AppColors.red,
                          )
                        : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.only(top: 5*fem),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: AppStyles.textStyle (
                                size: 12*ffem,
                                weight: FontWeight.w400,
                                height: 2*ffem/fem,
                                color: AppColors.black900,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Frais de transfert :',
                                  style: AppStyles.textStyle(
                                      color: AppColors.black900,
                                    size: 12*ffem,
                                    weight: FontWeight.w700,
                                    height: 2*ffem/fem,),
                                ),
                                 TextSpan(
                                  text: '  0%',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12 * ffem,
                                    height: 2*ffem/fem,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Montant à débiter :',
                                  style: AppStyles.textStyle(
                                      size: 12*ffem,
                                      weight: FontWeight.w700,
                                      height: 2*ffem/fem,
                                      color: AppColors.black900),
                                ),
                                TextSpan(
                                  text: _transactionController
                                          .amount.value.isEmpty
                                      ? "0 Fcfa"
                                      : "${_transactionController.amount.value} Fcfa",
                                  style: AppStyles.textStyle(
                                      color: AppColors.primary,
                                      size: 12*ffem,
                                      weight: FontWeight.w700,
                                      height: 2*ffem/fem,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1*fem),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'NOTE:',
                              style: AppStyles.textStyle(
                                  color: AppColors.primary,
                                size: 10*ffem,
                                weight: FontWeight.w700,
                                height: 2.4*ffem/fem,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' Assurez-vous que votre solde Sekure soit suffisant',
                              style: AppStyles.textPoppinsStyle(
                                  color: AppColors.primary,
                                  size: 10*ffem,
                                  height: 2.4*ffem/fem,
                                  weight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),

                    if(_formController.isToMomoAccountTransfer.value)...{
                      InputLabel(
                        label: "Pays",
                        paddingTop: 17*fem,
                        color: AppColors.gray700,
                      ),
                      Material(
                        elevation: 0.0,
                        shadowColor: null,
                        shape: null,
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.imputBg,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: TextFormField(
                            maxLength: 1,
                            style: AppStyles.textPoppinsStyle(
                              color: AppColors.imputBg,
                              size: 11,
                              weight: FontWeight.w400,
                              height: null,
                            ),
                            initialValue: selectedPaymentMethod,
                            enabled: false,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.imputBg,
                              //labelText: 'Cameroun  237',
                              hintText: 'Cameroun  237',
                              hintStyle:
                              // isNotRegularCaracter
                              //     ?
                              AppStyles.textPoppinsStyle(
                                color: AppColors.chatFieldHint,
                                size: 12,
                              ),
                              suffixIcon: Image.asset(Assets.icons.smallCmrFlag.path),
                            ),
                          ),
                        ),
                      ),

                      InputLabel(
                        label: "Opérateur",
                        paddingTop: 17*fem,
                        color: AppColors.gray700,
                      ),
                      Material(
                        elevation: 0.0,
                        shadowColor: null,
                        shape: null,
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.imputBg,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: TextFormField(
                            maxLength: 1,
                            style: AppStyles.textPoppinsStyle(
                              color: AppColors.imputBg,
                              size: 11,
                              weight: FontWeight.w400,
                              height: null,
                            ),
                            initialValue: selectedPaymentMethod,
                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.imputBg,
                              //labelText: 'ORANGE MONEY',
                              hintText: 'ORANGE MONEY',
                              hintStyle:
                              AppStyles.textPoppinsStyle(
                                color: AppColors.chatFieldHint,
                                size: 12,
                              ),
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                        ),
                      ),

                      InputLabel(
                        label: "Numéro de téléphone du bénéficiaire",
                        paddingTop: 17*fem,
                        color: AppColors.gray700,
                      ),
                      Material(
                        elevation: 0.0,
                        shadowColor: null,
                        shape: null,
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.imputBg,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: TextFormField(
                            maxLength: 1,
                            style: AppStyles.textPoppinsStyle(
                              color: AppColors.imputBg,
                              size: 11,
                              weight: FontWeight.w400,
                              height: null,
                            ),
                            initialValue: selectedPaymentMethod,
                            enabled: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.imputBg,
                              //labelText: '655443322',
                              hintText: '655443322',
                              hintStyle:
                              AppStyles.textPoppinsStyle(
                                color: AppColors.chatFieldHint,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      )
                    } else...{
                      InputLabel(
                        label: "Numéro de téléphone du receveur sur SEKURE",
                        paddingTop: 17*fem,
                        color: AppColors.gray700,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InputField(
                          labelText: "655443322",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          hasSuffix: true,
                          isPhoneNumber: true,
                          isNotRegularCaracter: true,
                          maxLine: 1,
                          hasMaxLine: true,
                          inputBg: AppColors.imputBg,
                          contentPadding: 16*fem,
                          suffixIcon: IntrinsicWidth(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(Assets.icons.smallCmrFlag.path),
                                // const SizedBox(width: 6.0),
                                // Image.asset(Assets.icons.orange.path),
                              ],
                            ),
                          ),
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.number,
                          iconColor: AppColors.dark,
                          value: _transactionController.phone.value,
                          onChanged: (String value) async {
                            _transactionController.phone(value);
                            searchUser(context,
                                _transactionController.phone.value.toString());
                          },
                        ),
                      ),
                      if (_transactionController.isSearchUser.value)
                        Container(
                          color: Colors.transparent,
                          child: LoadingAnimationWidget.waveDots(
                            color: AppColors.primary,
                            size: 40*fem,
                          ),
                        ),
                      _formController.hasErrorOnRechargePhone.value.isNotEmpty
                          ? InputLabel(
                        label:
                        _formController.hasErrorOnRechargePhone.value,
                        paddingTop: 8*fem,
                        hasSpecialCaraters: true,
                        color: AppColors.red,
                      )
                          : const SizedBox(),
                      _transactionController.phone.value.length > 8 &&
                          (_transactionController.receiver != null &&
                              _transactionController.receiver!.value.name !=
                                  null &&
                              _transactionController
                                  .receiver!.value.name!.isNotEmpty) &&
                          !_transactionController.isSearchUser.value &&
                          _formController
                              .hasErrorOnRechargePhone.value.isEmpty
                          ? Container(
                        margin: EdgeInsets.only(top: 15*fem),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 5*fem,
                              color: AppColors.primary,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(5.0),
                                    child: SizedBox(
                                      height: 45*fem,
                                      width: 45*fem,
                                      child: _transactionController
                                          .receiver!
                                          .value
                                          .photo !=
                                          null &&
                                          _transactionController
                                              .receiver!
                                              .value
                                              .photo!
                                              .isNotEmpty &&
                                          _userController
                                              .isProfileImageExist.value
                                          ? Image.network(
                                        _transactionController
                                            .receiver!.value.photo!,
                                        width: 50*fem,
                                        fit: BoxFit.contain,
                                        // loadingBuilder: (context, child,
                                        //     loadingProgress) {
                                        //   return Container(
                                        //     color: Colors.transparent,
                                        //     child: LoadingAnimationWidget
                                        //         .inkDrop(
                                        //       color: AppColors.primary,
                                        //       size: 50,
                                        //     ),
                                        //   );
                                        // },
                                      )
                                          : SvgPicture.asset(Assets
                                          .icons.sekureUserCircle),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10*fem),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Compte correspondant:",
                                          style: AppStyles.textStyle(
                                              color: AppColors.dark,
                                              size: 11*fem),
                                        ),
                                        Text(
                                          _transactionController
                                              .receiver!.value.name!,
                                          style: AppStyles.textStyle(
                                            color: AppColors.dark,
                                            size: 12*fem,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                          : const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputLabel(
                            label: "Message pour le receveur",
                            paddingTop: 15*fem,
                            color: AppColors.gray700,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Obx(() {
                              return Text(
                                '${_transactionController.message.value.length}/100 caractères',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.6*ffem/fem,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5*fem),
                        child: InputField(
                          labelText: "Entrez un texte ...",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          contentPadding: 16.0,
                          hasMaxLine: true,
                          isNotRegularCaracter: true,
                          maxLine: 4,
                          maxLength: 20,
                          inputBg: AppColors.imputBg,
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.text,
                          iconColor: AppColors.dark,
                          value: _transactionController.message.value,
                          onChanged: (String value) {
                            _transactionController.message(value);
                            _formController.fieldVerification(
                              field: value,
                              isMessage: true,
                              errorCallback: (String error) =>
                                  _formController.hasErrorOnMessage(error),
                            );
                          },
                        ),
                      ),
                      _formController.hasErrorOnMessage.value.isNotEmpty
                          ? InputLabel(
                        label: _formController.hasErrorOnMessage.value,
                        paddingTop: 8*fem,
                        color: AppColors.red,
                      )
                          : const SizedBox(),
                    }
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
