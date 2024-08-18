import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/notificationspage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/view/widgets/notifications_widgets/costum_notificationsCard.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
      body: SafeArea(
          child: GetBuilder<NotificationsPageController>(
        builder: (controller) => RefreshIndicator(
          color: AppColors.primaryColor,
          backgroundColor:
              Get.isDarkMode ? AppColors.secondaryDarkColor : Colors.white,
          displacement: 20,
          onRefresh: () {
            return controller.getNotifications();
          },
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16),
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 16, bottom: 20),
                child: Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 26,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Column(
                children: [
                  ...List.generate(
                    controller.notifications.length,
                    (index) => CostumNotificationsCard(
                        body:
                            controller.notifications[index].notificationsBody!,
                        dateTime: controller
                            .notifications[index].notificationsDatetime!),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
