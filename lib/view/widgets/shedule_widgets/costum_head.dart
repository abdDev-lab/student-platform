import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/controller/home/shedulepage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:uicons/uicons.dart';

class CostumHead extends StatelessWidget {
  const CostumHead({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulePageController>(
      builder: (controller) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(top: controller.dateMargin),
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                duration: const Duration(milliseconds: 300),
                child: controller.weekdayvisible
                    ? Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 2,
                            ),
                            AnimatedOpacity(
                              opacity: controller.dateOpacity,
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                Jiffy.parseFromDateTime(DateTime.now()).yMMMd,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            AnimatedOpacity(
                              opacity: controller.dateOpacity,
                              duration: const Duration(milliseconds: 200),
                              child: const Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? AppColors.secondaryDarkColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "2024/2025",
                            ),
                          ),
                        ],
                      ),
              ),
              Row(
                children: [
                  InkWell(
                    splashColor: Colors.white.withOpacity(0),
                    onTap: () {
                      controller.changeMonth(0);
                      controller.getWeeksDayofMonth(
                          DateTime.now().year, DateTime.now().month);
                      controller.showweek();
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? AppColors.secondaryDarkColor
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          UIcons.regularRounded.calendar,
                          size: 20,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                    enabled: controller.weekdayvisible ? false : true,
                    splashRadius: 0,
                    iconSize: 20,
                    position: PopupMenuPosition.under,
                    color: Get.isDarkMode
                        ? AppColors.secondaryDarkColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onSelected: (value) {
                      controller.changeMonth(value);
                    },
                    itemBuilder: (context) => [
                      ...List.generate(
                        controller.monthsOfSeason.length,
                        (index) => PopupMenuItem(
                          value: index,
                          onTap: () {
                            controller.getWeeksDayofMonth(
                                controller.monthsOfSeason[index]["year"],
                                controller.monthsOfSeason[index]["month"]);
                          },
                          height: 35,
                          child: Text(Jiffy.parse(
                                  "2024-${controller.monthsOfSeason[index]["month"]}-01")
                              .MMMM),
                        ),
                      )
                    ],
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        width: 132,
                        height: 35,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? AppColors.secondaryDarkColor
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedPositioned(
                              left: controller.monthPostion,
                              duration: const Duration(milliseconds: 300),
                              child: SizedBox(
                                width: 112,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Jiffy.parse(
                                            "${controller.monthsOfSeason[controller.selectedMonth]["year"]}-${controller.monthsOfSeason[controller.selectedMonth]["month"]}-01")
                                        .MMMM),
                                    AnimatedOpacity(
                                      opacity: controller.anglemonthopacity,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Icon(UIcons
                                          .regularRounded.angle_small_down),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
