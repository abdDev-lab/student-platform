import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'package:progres/controller/menu/examshedulepage_controller.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumSideBar extends StatelessWidget {
  const CostumSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamSchedulePageController>(
      builder: (controller) => Container(
        width: 90,
        height: Get.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(
              height: Get.height/4.2,
            ),
            ...List.generate(
              controller.examschedule.length,
              (index) => Column(
                children: [
                  InkWell(
                    splashColor: AppColors.primaryColor,
                    onTap: () {
                      controller.changeSelectedWeakdayPostion(
                          index,
                          DateTime.parse(controller
                                  .examschedule[index].examsheduleDatetimeFrom!)
                              .day);
                    },
                    child: SizedBox(
                      width: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Jiffy.parse(controller.examschedule[index]
                                    .examsheduleDatetimeFrom!)
                                .E,
                            style: TextStyle(
                                color: controller.selectedWeakday == index
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            "${Jiffy.parse(controller.examschedule[index].examsheduleDatetimeFrom!).date}",
                            style: TextStyle(
                                color: controller.selectedWeakday == index
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
