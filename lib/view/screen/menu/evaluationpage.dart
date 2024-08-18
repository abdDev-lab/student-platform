import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/menu/evaluationpage_controller.dart';
import 'package:progres/core/class/handlingData.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/view/widgets/evaluationpage_widgets/costum_selectedSemesterEvaluate.dart';
import 'package:progres/view/widgets/evaluationpage_widgets/costum_studentevaluate.dart';
import 'package:uicons/uicons.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EvlauationPageController());
    return GetBuilder<EvlauationPageController>(
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                  color: Colors.white,
                  //iconSize: 22,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    UIcons.regularRounded.angle_left,
                  ))),
          body: Stack(
            children: [
              Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? AppColors.secondaryDarkColor
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40))),
                  child: HandlingDataForWidgets(
                    statusRequest: controller.evaluationStatusRequest,
                    widget: const Column(
                      children: [
                        CostumSelectedSemesterEvaluate(),
                        CostumStudentEvaluate()
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
