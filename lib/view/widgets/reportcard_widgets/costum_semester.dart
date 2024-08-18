import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/menu/reportcardpage_controller.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumSelecteSemester extends StatelessWidget {
  const CostumSelecteSemester({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportCardPageController>(
      builder: (controller) => Container(
          width: Get.width,
          margin: const EdgeInsets.only(top: 24),
          alignment: Alignment.center,
          child: SizedBox(
              //color: Colors.blue,

              height: 40,
              width: 252,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: controller.semesterbuttonpostion,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        splashColor: Colors.white.withOpacity(0),
                        onPressed: () {
                          controller.changePostionButtontoLeft();
                        },
                        child: Text(
                          "Semester 1",
                          style: TextStyle(color: controller.firstbuttonColor),
                        ),
                      ),
                      MaterialButton(
                        splashColor: Colors.white.withOpacity(0),
                        onPressed: () {
                          controller.changePostionButtontoRight();
                        },
                        child: Text(
                          "Semester 2",
                          style: TextStyle(color: controller.secondbuttonColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
