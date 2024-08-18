import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appLinks.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:uicons/uicons.dart';

class StudentCardPage extends StatelessWidget {
  const StudentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
        backgroundColor:
            Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
        appBar: AppBar(
          backgroundColor:
              Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
          title: Text(
            "Student Card",
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              UIcons.regularRounded.angle_left,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 24),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? AppColors.secondaryDarkColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 192, 192, 192)
                                          .withOpacity(0.2),
                                  offset: const Offset(0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 0)
                            ]),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl:
                        "${AppLinks.userImageLink}/${myServices.sharedPreferences.getString("image")}",
                  )),
              const SizedBox(
                height: 16,
              ),
              Text(
                "${myServices.sharedPreferences.getString("firstname")} ${myServices.sharedPreferences.getString("lastname")}",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "UNI${myServices.sharedPreferences.getInt("id")}",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Birth Date",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${myServices.sharedPreferences.getString("birthdate")}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Speciality",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${myServices.sharedPreferences.getString("specialtyname")}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "State",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${myServices.sharedPreferences.getString("state")}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Faculty",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${myServices.sharedPreferences.getString("facultyname")}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 180,
                width: 180,
                child: PrettyQrView.data(
                  data: 'https://my.portfolio.abdoudevpro.site/',
                  // ignore: non_const_call_to_literal_constructor
                  decoration: PrettyQrDecoration(
                      shape: PrettyQrSmoothSymbol(
                          color: Get.isDarkMode ? Colors.white : Colors.black)),
                ),
              )
            ],
          ),
        ));
  }
}
