import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/menu/teacherspage_controller.dart';
import 'package:progres/core/class/handlingData.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/view/widgets/teacherspage_widgets/costum_teachercard.dart';
import 'package:uicons/uicons.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TeachersPageController());
    return Scaffold(
        backgroundColor:
            Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
        body: GetBuilder<TeachersPageController>(
          builder: (controller) => ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 70,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(UIcons.regularRounded.angle_left)),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Colors.grey[800]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(4)),
                        child: TextField(
                          controller: controller.searchController,
                          onChanged: (value) {
                            controller.checkSearch(value);
                          },
                          onSubmitted: (value) {
                            if (value != "") {
                              controller.getSearchTeacherData();
                            }
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor:
                              Get.isDarkMode ? Colors.white : Colors.black,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 11),
                              hintText: "search",
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: Icon(
                                UIcons.regularRounded.search,
                                size: 20,
                              ),
                              suffixIcon: Visibility(
                                visible: controller.cancelsearch,
                                child: IconButton(
                                    onPressed: controller.onCancel,
                                    color: Colors.grey[500],
                                    icon: Icon(
                                        UIcons.regularRounded.cross_small)),
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: !controller.isSearch
                      ? HandlingDataForScreen(
                          statusRequest: controller.teacherStatusRequest,
                          page: AppRoutes.teacherspage,
                          widget: Column(
                            children: [
                              ...List.generate(
                                controller.teachers.length,
                                (index) => CostumTeacherCard(
                                  univname:
                                      controller.teachers[index].univName!,
                                  facultyname:
                                      controller.teachers[index].facultyName!,
                                  teacherfirstname: controller
                                      .teachers[index].teacherFirstname!,
                                  teacherlastname: controller
                                      .teachers[index].teacherLastname!,
                                  teacheremail:
                                      controller.teachers[index].teacherEmail!,
                                  teacherImage:
                                      controller.teachers[index].teachersImage,
                                ),
                              )
                            ],
                          ),
                        )
                      : HandlingDataForScreen(
                          statusRequest: controller.teacherStatusRequest,
                          page: AppRoutes.teacherspage,
                          widget: Column(
                            children: [
                              ...List.generate(
                                controller.searchteachers.length,
                                (index) => CostumTeacherCard(
                                  univname: controller
                                      .searchteachers[index].univName!,
                                  facultyname: controller
                                      .searchteachers[index].facultyName!,
                                  teacherfirstname: controller
                                      .searchteachers[index].teacherFirstname!,
                                  teacherlastname: controller
                                      .searchteachers[index].teacherLastname!,
                                  teacheremail: controller
                                      .searchteachers[index].teacherEmail!,
                                  teacherImage:
                                      controller.teachers[index].teachersImage!,
                                ),
                              )
                            ],
                          ),
                        ))
            ],
          ),
        ));
  }
}
