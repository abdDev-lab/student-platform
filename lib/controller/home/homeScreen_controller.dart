import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/notificationspage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:uicons/uicons.dart';

class HomeScreenController extends GetxController {
  late NotificationsPageController notificationsPageController;
  Color iconSelectedColor = AppColors.primaryColor;
  Color iconUnselectedColor = AppColors.secondaryColor;
  int indexItem = 0;
  PageController pageController = PageController();

  List<IconData> bottomIconsUnselected = [
    UIcons.regularRounded.home,
    UIcons.regularRounded.calendar,
    UIcons.regularRounded.apps,
    UIcons.regularStraight.bell,
    UIcons.regularRounded.settings
  ];

  List<IconData> bottomIconsSelected = [
    UIcons.solidRounded.home,
    UIcons.solidRounded.calendar,
    UIcons.solidRounded.apps,
    UIcons.solidStraight.bell,
    UIcons.solidRounded.settings
  ];

  goToPageWithIndex(int index) {
    indexItem = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    update();
  }

  @override
  void onInit() {
    notificationsPageController = Get.put(NotificationsPageController());
    notificationsPageController.getNotifications();

    super.onInit();
  }

  getColorIcon() {
    notificationsPageController.readNotifications();
    notificationsPageController.changeReadNotify();
    return AppColors.primaryColor;
  }
}
