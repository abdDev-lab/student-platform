import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/controller/home/homepage_controller.dart';
import 'package:progres/core/class/handlingData.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumEventsView extends StatelessWidget {
  const CostumEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        builder: (controller) => HandlingDataWithShimmerViewForEvents(
            statusRequest: controller.eventsStatusRequest,
            widget: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.events.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color:Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 192, 192, 192)
                                          .withOpacity(0.3),
                                  offset: const Offset(0, 2),
                                  blurRadius: 10,
                                  spreadRadius: 0)
                            ]),
                  width: 220,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Jiffy.parse(controller.events[index].eventsDate!).date}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      height: 0.9),
                                ),
                                Text(
                                  Jiffy.parse(
                                          controller.events[index].eventsDate!)
                                      .MMM,
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "${controller.events[index].eventsTitle}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 16,
                ),
              ),
            )));
  }
}
