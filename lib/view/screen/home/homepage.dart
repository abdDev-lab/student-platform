import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/homepage_controller.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_eventsview.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_listTile.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_menu.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_newsview.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_profilecard.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_subtitle.dart';
import 'package:uicons/uicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return GetBuilder<HomePageController>(
        builder: (controller) => Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              body: ListView(
                children: [
                  CostumProfileCard(
                    name:
                        "${controller.myServices.sharedPreferences.getString("firstname")} ${controller.myServices.sharedPreferences.getString("lastname")}",
                    faculty:
                        "${controller.myServices.sharedPreferences.getString("facultyname")}",
                    specialty:
                        "${controller.myServices.sharedPreferences.getString("specialtyname")}",
                    univname:
                        "${controller.myServices.sharedPreferences.getString("univname")}",
                    year:
                        "${controller.myServices.sharedPreferences.getString("year")}",
                    id: controller.myServices.sharedPreferences.getInt("id")!,
                    group: controller.myServices.sharedPreferences
                        .getInt("group")!,
                    facultywebsite: controller.myServices.sharedPreferences
                        .getString("facultywebsite")!,
                    univlog: controller.myServices.sharedPreferences
                        .getString("univlogo")!,
                    univwebsite: controller.myServices.sharedPreferences
                        .getString("univwebsite")!,
                    image: controller.myServices.sharedPreferences
                        .getString("image")!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostumListTile(
                          title: "Student Card",
                          icon: UIcons.regularStraight.id_badge,
                          onTap: () {
                            Get.toNamed(AppRoutes.studentcardpage);
                          },
                        ),
                        CostumSubtitle(
                          title: "Menu",
                          viewallvisible: true,
                          onTapview: () {
                            controller.homeScreenController
                                .goToPageWithIndex(2);
                          },
                        ),
                        const CostumMenu(),
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 16),
                          child: Text(
                            "Events",
                            style: TextStyle(
                                fontSize: 20,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        const CostumEventsView(),
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 6),
                          child: Text(
                            "News",
                            style: TextStyle(
                                fontSize: 20,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        const CostumNewsView()
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
