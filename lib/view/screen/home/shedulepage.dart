import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/shedulepage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/view/widgets/shedule_widgets/costum_daysofweek.dart';
import 'package:progres/view/widgets/shedule_widgets/costum_head.dart';
import 'package:progres/view/widgets/shedule_widgets/costum_sheduleday.dart';
import 'package:progres/view/widgets/shedule_widgets/costum_tasksList.dart';

import 'package:uicons/uicons.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SchedulePageController());
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addtaskpage);
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: Icon(UIcons.regularStraight.plus),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 24, right: 24),
          children: const [
            CostumHead(),
            SizedBox(
              height: 10,
            ),
            CostumDaysOfWeek(),
            CostumScheduleDay(),
            SizedBox(
              height: 24,
            ),
            CostumTasksList(),
            SizedBox(
              height: 56,
            )
          ],
        ),
      ),
    );
  }
}
