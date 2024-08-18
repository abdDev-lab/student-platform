import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumSemsterStudentAvg extends StatelessWidget {
  final String semesteravg;
  final int semesterCredit;
  final double semesterprogress;
  const CostumSemsterStudentAvg(
      {super.key,
      required this.semesteravg,
      required this.semesterprogress,
      required this.semesterCredit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: Get.isDarkMode
              ? null
              : [
                  BoxShadow(
                      color: const Color.fromARGB(255, 192, 192, 192)
                          .withOpacity(0.3),
                      offset: const Offset(0, 1),
                      blurRadius: 20,
                      spreadRadius: 0)
                ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Credit",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                "AVG",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Semester",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    "$semesterCredit",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 39,
                  ),
                  SizedBox(
                    height: 80,
                    child: DashedCircularProgressBar.aspectRatio(
                      aspectRatio: 0.9, // width ÷ height
                      valueNotifier: ValueNotifier(75),
                      progress: semesterprogress,
                      startAngle: 225,
                      sweepAngle: 270,
                      foregroundColor: AppColors.primaryColor,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                      foregroundStrokeWidth: 8,
                      backgroundStrokeWidth: 7,
                      animation: true,
                      seekSize: 5,
                      seekColor: const Color(0xffeeeeee),
                      child: Center(
                        child: Text(
                          semesteravg,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
