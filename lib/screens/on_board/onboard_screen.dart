import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/on_board_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/screens/register_screen/register_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';

/*class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});
  final OnBoardController _onBoardController = Get.put(OnBoardController());
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  final PageController _controller = PageController();
  Widget pages(
      {required String title1,
        required String title2,
      required String subtitle1,
      required String subtitle2,
      String? subtitle3,
      required String imagePath,
      required BuildContext context,
      required double fem,
      required double ffem,
      bool isPng = false}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: Constants.screenWidth(context) / 1.4,
              child: Column(
                children: [
                  Text(
                    title1,
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                        color: AppColors.white,
                        size: 25.0,
                        height: 0.9*ffem/fem,
                        letterSpacing: -0.5*fem,
                        weight: FontWeight.w500),
                  ),
                  Text(
                    title2,
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                        color: AppColors.white,
                        size: 25.0,
                        height: 0.9*ffem/fem,
                        letterSpacing: -0.5*fem,
                        weight: FontWeight.w500),
                  ),
                ],
              )
            ),
          ),
          SizedBox(height: 3*fem,),
          Container(
            //padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            margin: EdgeInsets.only(
              left: 40*fem,
              right: 39*fem,
            ),
            child: SizedBox(
              width: Constants.screenWidth(context) / 1.4,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: subtitle1,
                      style: AppStyles.textStyle(
                          color: AppColors.white,
                          size: 12.0,
                          letterSpacing: -1*fem,
                          height: 1.38*ffem/fem,
                          weight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: subtitle2,
                      style: AppStyles.textStyle(
                          color: AppColors.white,
                          size: 12.0,
                          letterSpacing: -1*fem,
                          height: 1.38*ffem/fem,
                          weight: FontWeight.w700),
                    ),
                    if(subtitle3 != null)...{
                      TextSpan(
                        text: subtitle3,
                        style: AppStyles.textStyle(
                            color: AppColors.white,
                            size: 12.0,
                            letterSpacing: -1*fem,
                            height: 1.38*ffem/fem,
                            weight: FontWeight.w300),
                      ),
                    }
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 17*fem),
          Center(
            // height: double.infinity,
            // width: Constants.screenWidth(context) / 1.2,
              child: SizedBox(
                //width: double.infinity,
                height: 393*fem,
                width: 388*fem,
                // height: Constants.screenHeight(context),
                child: isPng ? Image.asset(
                  imagePath,
                  fit: BoxFit.cover,)
                    : SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  // width: 20.0,
                ),
              )),




          SizedBox(height: 77*fem),
          SizedBox(
            child: DotsIndicator(
              dotsCount: 3,
              position: _onBoardController.pageIndex.value,
              decorator: DotsDecorator(
                color: AppColors.white.withOpacity(0.5),
                activeColor: AppColors.white,
                size: const Size.square(10.0),
                activeSize: const Size(30.0, 10.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          SizedBox(height: 16*fem),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _userController.resetLoginData();
                      _formController.resetFormErrors();
                      Get.offAll(RegisterScreen()); //FIXME: Put Get.to...
                    },
                    child: const PrimaryButton(
                      textButton: "Créer un compte",
                      hasIcon: false,
                      radius: 32.0,
                      buttonColor: AppColors.white101,
                      iconColor: AppColors.white,
                      textColor: AppColors.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 19.0),
                    child: GestureDetector(
                      onTap: () {
                        _userController.resetLoginData();
                        _formController.resetFormErrors();
                        Get.offAll(LoginScreen()); //FIXME: Put Get.to...
                      },
                      child: const PrimaryButton(
                        textButton: "J’ai un compte",
                        buttonColor: Colors.transparent,
                        textColor: AppColors.white,
                        radius: 32,
                        hasBorder: true,
                        hasIcon: false,
                        borderColor: AppColors.white
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      //backgroundColor: AppColors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          // gradient: LinearGradient(
          //   begin: Alignment(0.02, 0),
          //   end: Alignment(0.89, 0.98),
          //   colors: [
          //     Color(0XFF18BC7A),
          //     Color(0XFF25DA91),
          //     Color(0XFF18BC7A),
          //   ],
          // ),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/img_group_825.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 34.0*fem),
          child: Container(
            margin: EdgeInsets.only(bottom: 5*fem),
            padding: EdgeInsets.symmetric(horizontal: 22*fem),
            child: PageView(
              controller: _controller,
              onPageChanged: (int index) {
                _onBoardController.setPageIndex(index);
              },
              children: [
                pages(
                    title1: "Redéfinir votre",
                    title2: "manière de payer",
                    subtitle1:
                    "Découvrez des solutions de paiement ",
                    subtitle2: "faciles, rapides et moins couteux ...  ",
                    imagePath: 'assets/images/onboarding_home2.png',
                    context: context,
                    fem : fem,
                    ffem : ffem,
                    isPng : true
                ),
                pages(
                    title1: "Payer en ligne va",
                    title2: "devenir facile",
                    subtitle1:
                    "Les paiements en ligne n’auront plus de limites pour vous avec nos",
                    subtitle2: " cartes visa et Mastercard ...",
                    imagePath: Assets.images.rechargeOnboardingPage,
                    context: context,
                    fem : fem,
                    ffem : ffem
                ),
                pages(
                    title1: "Envoyez et recevez",
                    title2: "de l’argent en afrique",
                    subtitle1:
                    "Affranchissez vous des limites en Afrique avec des",
                    subtitle2: " solutions d’envoi d’argent",
                    subtitle3: " moins couteuses qui vous rapprochent de ceux qui comptent ",
                    imagePath: Assets.images.transfertOnboardingPage,
                    context: context,
                    fem : fem,
                    ffem : ffem
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final OnBoardController _onBoardController = Get.put(OnBoardController());
    final FormController _formController = Get.put(FormController());
    final UserController _userController = Get.put(UserController());
    
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/img_group_825.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.only(bottom: 5*fem),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 14*fem,),
                SizedBox(
                  height: 500,
                  child: PageView.builder(
                    itemCount: data.length,
                    onPageChanged: (index){
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                      itemBuilder: (context, index){
                        return OnboardContent(
                            title1: data[index]['title1'],
                            title2: data[index]['title2'],
                            subtitle1: data[index]['subtitle1'],
                            subtitle2: data[index]['subtitle2'],
                            imagePath: data[index]['imagePath'],
                            isPng: data[index]['isPng']
                        );
                      }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(data.length, (index) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: AnimatedDot(isActive: _selectedIndex == index,),
                  ),),
                ),
                SizedBox(height: 24*fem,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 38*fem),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _userController.resetLoginData();
                            _formController.resetFormErrors();
                            Get.offAll(RegisterScreen()); //FIXME: Put Get.to...
                          },
                          child: const PrimaryButton(
                            textButton: "Créer un compte",
                            hasIcon: false,
                            radius: 32.0,
                            buttonColor: AppColors.white101,
                            iconColor: AppColors.white,
                            textColor: AppColors.primary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: GestureDetector(
                            onTap: () {
                              _userController.resetLoginData();
                              _formController.resetFormErrors();
                              Get.offAll(LoginScreen()); //FIXME: Put Get.to...
                            },
                            child: const PrimaryButton(
                                textButton: "J’ai un compte",
                                buttonColor: Colors.transparent,
                                textColor: AppColors.white,
                                radius: 32,
                                hasBorder: true,
                                hasIcon: false,
                                borderColor: AppColors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> data = [
    {
      "title1": "Redéfinir votre",
      "title2": "manière de payer",
      "subtitle1": "Découvrez des solutions de paiement ",
      "subtitle2": "faciles, rapides et moins couteux ...  ",
      "subtitle3": null,
      "imagePath": 'assets/images/onboarding_home2.png',
      "isPng" : true
    },
    {
      "title1": "Payer en ligne va",
      "title2": "devenir facile",
      "subtitle1": "Les paiements en ligne n’auront plus de limites pour vous avec nos",
      "subtitle2": " cartes visa et Mastercard ...",
      "subtitle3": null,
      "imagePath": Assets.images.rechargeOnboardingPage,
      "isPng" : false
    },
    {
      "title1": "Envoyez et recevez",
      "title2": "de l’argent en afrique",
      "subtitle1": "Affranchissez vous des limites en Afrique avec des",
      "subtitle2": " solutions d’envoi d’argent",
      "subtitle3": " moins couteuses qui vous rapprochent de ceux qui comptent ",
      "imagePath": Assets.images.transfertOnboardingPage,
      "isPng" : false
    }
  ];
}

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key, required this.isActive,
  });

    final bool isActive;
    @override
    Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 8,
    width: isActive ? 20 : 6,
    decoration: BoxDecoration(
    color: isActive ? AppColors.white : AppColors.white.withOpacity(0.5),
      borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    this.subtitle3,
    required this.imagePath,
    required this.isPng});

  final String title1, title2, subtitle1, subtitle2, imagePath;
  final String? subtitle3;
  final bool isPng;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
              width: Constants.screenWidth(context) / 1.4,
              child: Column(
                children: [
                  Text(
                    title1,
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                        color: AppColors.white,
                        size: 25.0,
                        height: 0.9*ffem/fem,
                        letterSpacing: -0.5*fem,
                        weight: FontWeight.w500),
                  ),
                  Text(
                    title2,
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                        color: AppColors.white,
                        size: 25.0,
                        height: 0.9*ffem/fem,
                        letterSpacing: -0.5*fem,
                        weight: FontWeight.w500),
                  ),
                ],
              )
          ),
        ),
        SizedBox(height: 3*fem,),
        Container(
          //padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          margin: EdgeInsets.only(
            left: 40*fem,
            right: 39*fem,
          ),
          child: SizedBox(
            width: Constants.screenWidth(context) / 1.4,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: subtitle1,
                    style: AppStyles.textStyle(
                        color: AppColors.white,
                        size: 12.0,
                        letterSpacing: -1*fem,
                        height: 1.38*ffem/fem,
                        weight: FontWeight.w300),
                  ),
                  TextSpan(
                    text: subtitle2,
                    style: AppStyles.textStyle(
                        color: AppColors.white,
                        size: 12.0,
                        letterSpacing: -1*fem,
                        height: 1.38*ffem/fem,
                        weight: FontWeight.w700),
                  ),
                  if(subtitle3 != null)...{
                    TextSpan(
                      text: subtitle3,
                      style: AppStyles.textStyle(
                          color: AppColors.white,
                          size: 12.0,
                          letterSpacing: -1*fem,
                          height: 1.38*ffem/fem,
                          weight: FontWeight.w300),
                    ),
                  }
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 17*fem),
        AspectRatio(
          aspectRatio: 1,
          child: isPng ? Image.asset(
            imagePath,
            fit: BoxFit.cover,)
              : SvgPicture.asset(
            imagePath,
            fit: BoxFit.cover,
            // width: 20.0,
          ),
        ),
      ],
    );
  }
}
