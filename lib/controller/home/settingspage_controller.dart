import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/homeScreen_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/local/shedule_table.dart';
import 'package:progres/data/datasource/local/tasks_table.dart';
import 'package:progres/view/screen/auth/loginpage.dart';
import 'package:uicons/uicons.dart';

class SettingsPageController extends GetxController {
  late HomeScreenController homeScreenController;
  MyServices myServices = Get.find();
  bool darkmode = Get.isDarkMode ? true : false;
  ScheduleTable scheduleTable = ScheduleTable();
  TasksTable tasksTable = TasksTable();

  //prifle card animation values
  bool viewprofile = false;
  double stackProfileCardHeight = 400;
  double profileCardHeight = 270;
  double profileCardPostionTop = 110;
  double profileCardPostionLeft = 16;
  double profileCardPostionRight = 16;
  double profileCardTopLeftBorder = 20;
  double profileCardTopRightBorder = 20;
  double profileCardBottomLeftBorder = 20;
  double profileCardBottomRightBorder = 20;
  double profilePicturePostionTop = 60;
  double? profilePicturePostionRight = 40;
  double profilePicturePostionLeft = 40;
  MainAxisAlignment profileNameAlignmentRow = MainAxisAlignment.center;
  CrossAxisAlignment profileNameAlignmentColumn = CrossAxisAlignment.center;
  CrossAxisAlignment profileInfoAlignmentColumn = CrossAxisAlignment.center;
  double profileNamepadding = 0;
  double sizedBoxHeight = 6;
  double iconRotate = 0;
  double viewprofilebutton = 4;

  List<Map> settingbuttons = [
    {"title": "Language", "icon": UIcons.regularRounded.globe, "ontap": () {}},
    {
      "title": "High School Certificate",
      "icon": UIcons.regularRounded.badge,
      "ontap": () {}
    },
    {
      "title": "University certificate",
      "icon": UIcons.regularRounded.diploma,
      "ontap": () {}
    },
  ];
  List<Map> studentInfo = [];

  onToggleDarkMode(bool value) {
    if (value == true) {
      Get.changeThemeMode(ThemeMode.dark);
      myServices.sharedPreferences.setString("theme", "dark");
      homeScreenController.refresh();
    } else {
      Get.changeThemeMode(ThemeMode.light);
      myServices.sharedPreferences.setString("theme", "light");
      homeScreenController.refresh();
    }
    darkmode = value;
    update();
  }

  viewProfileCard() {
    iconRotate = 0.5;
    stackProfileCardHeight = Get.height;
    profileCardHeight = Get.height - 50;
    profileCardPostionTop = 70;
    profileCardPostionLeft = 0;
    profileCardPostionRight = 0;
    profileCardTopLeftBorder = 30;
    profileCardTopRightBorder = 30;
    profileCardBottomLeftBorder = 0;
    profileCardBottomRightBorder = 0;
    profilePicturePostionTop = 100;
    profilePicturePostionLeft = 20;
    profilePicturePostionRight = 260;
    profileInfoAlignmentColumn = CrossAxisAlignment.start;
    profileNameAlignmentRow = MainAxisAlignment.end;
    profileNameAlignmentColumn = CrossAxisAlignment.start;
    profileNamepadding = 8;
    sizedBoxHeight = 48;
    viewprofilebutton = 32;
    update();
  }

  discardProfileCard() {
    iconRotate = 0;
    profilePicturePostionTop = 60;
    profilePicturePostionLeft = 40;
    profilePicturePostionRight = 40;
    profileCardHeight = 270;
    profileCardPostionTop = 110;
    profileCardPostionLeft = 16;
    profileCardPostionRight = 16;
    profileCardTopLeftBorder = 20;
    profileCardTopRightBorder = 20;
    profileCardBottomLeftBorder = 20;
    profileCardBottomRightBorder = 20;
    stackProfileCardHeight = 400;
    profileInfoAlignmentColumn = CrossAxisAlignment.center;
    profileNameAlignmentRow = MainAxisAlignment.center;
    profileNameAlignmentColumn = CrossAxisAlignment.center;
    profileNamepadding = 0;
    sizedBoxHeight = 6;
    viewprofilebutton = 8;
    update();
  }

  changeViewProfile() {
    viewprofile = !viewprofile;
    update();
  }

  @override
  void onInit() {
    homeScreenController = Get.find();
    studentInfo = [
      {
        "title": "Faculty",
        "value": myServices.sharedPreferences.getString("facultyname")
      },
      {
        "title": "Speciality",
        "value": myServices.sharedPreferences.getString("specialtyname")
      },
      {
        "title": "Date of Birth",
        "value": myServices.sharedPreferences.getString("birthdate")
      },
      {
        "title": "Email",
        "value": myServices.sharedPreferences.getString("email")
      },
      {
        "title": "State",
        "value": myServices.sharedPreferences.getString("state")
      },
    ];
    super.onInit();
  }

  logout() {
    Get.defaultDialog(
        radius: 12,
        contentPadding: const EdgeInsets.only(left: 16, right: 16),
        title: "Log Out",
        backgroundColor:
            Get.isDarkMode ? AppColors.secondaryDarkColor : Colors.white,
        content: Column(
          children: [
            const Text(
              "Do you went to logout from this account",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print(scheduleTable.deleteSchedule());
                      print(tasksTable.deletetask());
                      FirebaseMessaging.instance
                          .unsubscribeFromTopic("student");
                      myServices.sharedPreferences.clear();
                      Get.offAll(const LoginPage());
                    },
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
