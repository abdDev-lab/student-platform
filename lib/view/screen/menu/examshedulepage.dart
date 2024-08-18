import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/controller/menu/examshedulepage_controller.dart';

import 'package:progres/core/class/handlingData.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appLinks.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/view/widgets/examshedule_widgets/costum_examtiming.dart';
import 'package:progres/view/widgets/examshedule_widgets/costum_sideBar.dart';

import 'package:uicons/uicons.dart';

class ExamSchedulePage extends StatelessWidget {
  const ExamSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExamSchedulePageController());
    return GetBuilder<ExamSchedulePageController>(builder: (controller) {
      return Scaffold(
          backgroundColor: controller.scaffoldColor,
          body: HandlingDataForPages(
              statusRequest: controller.statusRequest,
              widget: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 16,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(UIcons.regularRounded.angle_left,
                            color: Colors.white),
                      ),
                    ),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        top: controller.selectedWeakdayPostion, //87
                        left: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? AppColors.secondaryDarkColor
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  bottomLeft: Radius.circular(24))),
                          height: 70,
                          width: 90,
                        )),
                    const Positioned(left: 0, child: CostumSideBar()),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 12, bottom: 12),
                        height: Get.height,
                        width: Get.width - 85,
                        color: Get.isDarkMode
                            ? AppColors.secondaryDarkColor
                            : Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "${AppLinks.univImageLink}/${controller.myServices.sharedPreferences.getString("univlogo")}",
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("University of\nFarhat Abbas"),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      Jiffy.now().EEEE,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      Jiffy.now().yMMM,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "${Jiffy.now().date}",
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                )),
                                Padding(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Text(
                                    "Exam Schedule",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ...List.generate(
                                controller.examschedule.length,
                                (index) => controller.selectedDay ==
                                        DateTime.parse(controller
                                                .examschedule[index]
                                                .examsheduleDatetimeFrom!)
                                            .day
                                    ? CostumExamTiming(
                                        subject: controller
                                            .examschedule[index].subjectName!,
                                        classType: controller
                                            .examschedule[index]
                                            .examsheduleClasstype!,
                                        classNumber: controller
                                            .examschedule[index]
                                            .examsheduleClass!,
                                        dateTimeFrom: controller
                                            .examschedule[index]
                                            .examsheduleDatetimeFrom!,
                                        dateTimeTo: controller
                                            .examschedule[index]
                                            .examsheduleDatetimeTo!,
                                      )
                                    : Container())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              page: AppRoutes.examschedulepage));
    });
  }
}
