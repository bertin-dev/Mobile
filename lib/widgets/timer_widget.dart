import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget({
    required this.duration,
    required this.label,
    // required this.restartTimer,
    this.onEnd,
    this.isLoader = false,
    Key? key,
  }) : super(key: key);

  ///[In seconds]
  int duration;

  String label;
  void Function()? onEnd;
  // final void Function() restartTimer;
  final bool isLoader;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final FormController _formController = Get.put(FormController());
  late int currentDuration;
  @override
  void initState() {
    super.initState();
    currentDuration = widget.duration;
  }

  @override
  void didUpdateWidget(covariant TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      currentDuration =
          widget.duration; // Mettez à jour la durée actuelle si la durée change
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: Duration(seconds: currentDuration),
      tween: Tween(
          begin: Duration(seconds: currentDuration + 1), end: Duration.zero),
      onEnd: () {
        _formController.isAskNewCodeVisible(true);
        widget.duration = 0;
        print(_formController.isAskNewCodeVisible.value);
        //FIXME: Repair and globalise these method
        // Navigator.of(context).push(
        //   //pushReplacement(
        //   MaterialPageRoute(
        //     builder: ((context) {
        //       return const AppRootScreen(); legalih113@aramask.com
        //     }),
        //   ),
        // );
        if (widget.isLoader) {
          Constants.snackBar(
              // duration: const Duration(seconds: 5),
              bgColor: AppColors.red,
              textColor: AppColors.white,
              description:
                  "Votre transaction a pris plus de temps que prévu nous allons vous renvoyer à la page d'accueil,  vous recevrez le statut final de votre transaction sous peu. Merci de votre patience");
          Future.delayed(const Duration(seconds: 10), () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
          });
        }
        widget.duration = 0;
      },
      builder: (BuildContext context, Duration value, Widget? child) {
        final minutes = value.inMinutes;
        final seconds = value.inSeconds % 60;
        return GestureDetector(
          onTap: () {
            // widget.restartTimer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: widget.label,
                style: AppStyles.textPoppinsStyle(
                  color: AppColors.grey,
                  size: 11.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "  $minutes:$seconds",
                    style: AppStyles.textPoppinsStyle(
                      color: AppColors.primary,
                      size: 14.0,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
