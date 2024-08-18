import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appAssets.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appLinks.dart';

class CostumTeacherCard extends StatelessWidget {
  final String univname;
  final String facultyname;
  final String teacherfirstname;
  final String teacherlastname;
  final String teacheremail;
  final String? teacherImage;
  const CostumTeacherCard(
      {super.key,
      required this.univname,
      required this.facultyname,
      required this.teacheremail,
      required this.teacherfirstname,
      required this.teacherlastname,
      required this.teacherImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 150,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Get.isDarkMode ? AppColors.secondaryDarkColor : Colors.white,
        boxShadow: Get.isDarkMode
            ? null
            : [
                BoxShadow(
                    color: const Color.fromARGB(255, 192, 192, 192)
                        .withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 20,
                    spreadRadius: 0)
              ],
      ),
      child: Row(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              width: 130,
              alignment: Alignment.center,
              child: Container(
                  height: 85,
                  width: 85,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 192, 192, 192)
                                          .withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius: 0)
                            ]),
                  child: teacherImage != null
                      ? CachedNetworkImage(
                          imageUrl:
                              "${AppLinks.teachersImageLink}/$teacherImage")
                      : Image.asset(AppAssets.teacherProfileIcon))),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "University of",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.5),
                      child: Text(
                        " $univname",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(facultyname, style: const TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "$teacherfirstname $teacherlastname",
                  style: const TextStyle(color: AppColors.primaryColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(teacheremail),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
