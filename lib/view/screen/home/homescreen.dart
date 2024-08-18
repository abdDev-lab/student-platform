import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/homeScreen_controller.dart';
import 'package:progres/controller/home/notificationspage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/view/screen/home/homepage.dart';
import 'package:progres/view/screen/home/menupage.dart';
import 'package:progres/view/screen/home/notificationspage.dart';
import 'package:progres/view/screen/home/settingspage.dart';
import 'package:progres/view/screen/home/shedulepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
         
          bottomNavigationBar: BottomAppBar(
            height: 70,
            color: Theme.of(context).colorScheme.secondary,
            elevation: 10,
            shadowColor: Colors.grey,
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...List.generate(
                    5,
                    (index) => MaterialButton(
                        splashColor: Colors.white.withOpacity(0),
                        highlightColor: Colors.white.withOpacity(0),
                        minWidth: 40,
                        onPressed: () {
                          controller.goToPageWithIndex(index);
                        },
                        child: index != 3
                            ? Icon(
                                index == controller.indexItem
                                    ? controller.bottomIconsSelected[index]
                                    : controller.bottomIconsUnselected[index],
                                color: index == controller.indexItem
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                              )
                            : SizedBox(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      index == controller.indexItem
                                          ? controller
                                              .bottomIconsSelected[index]
                                          : controller
                                              .bottomIconsUnselected[index],
                                      color: index == controller.indexItem
                                          ? controller.getColorIcon()
                                          : AppColors.secondaryColor,
                                    ),
                                    GetBuilder<NotificationsPageController>(
                                      builder: (notificationsPageController) =>
                                          Visibility(
                                              visible:
                                                  notificationsPageController
                                                              .notReadNotify !=
                                                          0
                                                      ? true
                                                      : false,
                                              child: Positioned(
                                                  top: 2,
                                                  right: 2,
                                                  child: Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: AppColors
                                                                .primaryColor),
                                                  ))),
                                    )
                                  ],
                                ),
                              )),
                  )
                ],
              ),
            ),
          ),
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children:  const [
              HomePage(),
              SchedulePage(),
              MenuPage(),
              NotificationsPage(),
              SettingsPage()
            ],
          )),
    );
  }
}
