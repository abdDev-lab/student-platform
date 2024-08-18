import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumNotificationsCard extends StatelessWidget {
  final String body;
  final String dateTime;
  const CostumNotificationsCard(
      {super.key, required this.body, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColors.secondaryDarkColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Get.isDarkMode
              ? null
              : [
                  BoxShadow(
                      color: const Color.fromARGB(255, 192, 192, 192)
                          .withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 0)
                ]),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 328,
                child: Text(
                  body,
                  style: TextStyle(
                      fontSize: 15,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "${Jiffy.parse(dateTime).E} at ${Jiffy.parse(dateTime).jm}",
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
