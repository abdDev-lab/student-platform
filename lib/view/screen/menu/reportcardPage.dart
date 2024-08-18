import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/menu/reportcardpage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/view/widgets/reportcard_widgets/costum_overall.dart';
import 'package:progres/view/widgets/reportcard_widgets/costum_reportcard.dart';
import 'package:progres/view/widgets/reportcard_widgets/costum_semester.dart';
import 'package:uicons/uicons.dart';

class ReportCardPage extends StatelessWidget {
  const ReportCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportCardPageController());
    return GetBuilder<ReportCardPageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 252,
              toolbarHeight: 89,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: CostumOverall(
                    progress: controller.getoverallprogress(),
                    overall: controller.getOverall()),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  UIcons.regularRounded.angle_left,
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 24),
                    width: Get.width,
                    height: Get.height - 120,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? AppColors.secondaryDarkColor
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: const Column(
                      children: [
                        CostumSelecteSemester(),
                        CostumReportCard(),
                      ],
                    ),
                  )
                ],
              ),
            ]))
          ],
        ),
      );
    });
  }
}
