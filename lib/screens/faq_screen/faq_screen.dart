import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/profile_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/screens/faq_screen/components/question_component.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});
  final List faqList = [
    {
      "question": "C’est quoi une carte Virtuelle ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Comment recharger ma carte",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Dans quels pays est ce que la carte est dipsonible ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "C’est quoi une carte Virtuelle ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Comment recharger ma carte",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Dans quels pays est ce que la carte est dipsonible ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "C’est quoi une carte Virtuelle ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Comment recharger ma carte",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Dans quels pays est ce que la carte est dipsonible ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
  ];
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.imputBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: AppColors.dark,
                    // size: 25.0,
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: faqList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          if (_profileController.selectedQuestion.value ==
                              index) {
                            _profileController.selectedQuestion.value = -1;
                          } else {
                            _profileController.selectedQuestion.value = index;
                          }
                        },
                        child: QuestionComponent(
                          question: faqList[index]["question"],
                          response: faqList[index]["response"],
                          isResponseVisible:
                              _profileController.selectedQuestion.value ==
                                  index,
                        ),
                      );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
