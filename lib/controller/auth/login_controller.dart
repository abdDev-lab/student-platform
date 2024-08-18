import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/remote/auth/login_remote.dart';
import 'package:uicons/uicons.dart';

abstract class LoginController extends GetxController {}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController useridcontroller;
  late TextEditingController passwordcontroller;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  IconData passwordIcon = UIcons.regularRounded.lock;
  Color userIconColor = Colors.grey;
  Color passwordIconColor = Colors.grey;
  bool infoMessage = false;
  bool infoMessageForUserId = true;
  bool infoMessageForPassword = false;
  bool errormessege = false;
  bool passwordvisble = false;
  //

  @override
  void onInit() {
    useridcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.onInit();
  }

  login() async {
    if (formstate.currentState!.validate()) {
      infoMessage = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.getData(
          useridcontroller.text, passwordcontroller.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          myServices.sharedPreferences
              .setInt("id", response["data"]["student_id"]);
          myServices.sharedPreferences
              .setString("firstname", response["data"]["student_firstname"]);
          myServices.sharedPreferences
              .setString("lastname", response["data"]["student_lastname"]);
          myServices.sharedPreferences
              .setString("email", response["data"]["student_email"]);
          myServices.sharedPreferences
              .setString("birthdate", response["data"]["student_birthdate"]);
          myServices.sharedPreferences
              .setString("image", response["data"]["student_image"]);
          myServices.sharedPreferences
              .setInt("group", response["data"]["student_group"]);
          myServices.sharedPreferences
              .setString("year", response["data"]["student_year"]);
          myServices.sharedPreferences
              .setString("state", response["data"]["student_state"]);
          myServices.sharedPreferences
              .setInt("specialty_id", response["data"]["specialty_id"]);
          myServices.sharedPreferences
              .setString("specialtyname", response["data"]["specialty_name"]);
          myServices.sharedPreferences
              .setString("facultyname", response["data"]["faculty_name"]);
          myServices.sharedPreferences
              .setString("facultywebsite", response["data"]["faculty_website"]);
          myServices.sharedPreferences
              .setInt("univ_id", response["data"]["univ_id"]);
          myServices.sharedPreferences
              .setString("univname", response["data"]["univ_name"]);
          myServices.sharedPreferences
              .setString("univlogo", response["data"]["univ_logo"]);
          myServices.sharedPreferences
              .setString("univwebsite", response["data"]["univ_website"]);
          FirebaseMessaging.instance.subscribeToTopic("student");
          Get.offAllNamed(AppRoutes.homescreen);
        } else {
          infoMessageForUserId = true;
          infoMessageForPassword = false;
          infoMessage = true;
          useridcontroller.clear();
          passwordcontroller.clear();
          Get.showSnackbar(GetSnackBar(
            animationDuration: const Duration(milliseconds: 300),
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(10),
            showProgressIndicator: true,
            snackPosition: SnackPosition.TOP,
            messageText: const Text(
              "Wrong Registration Number or Password",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            icon: Icon(
              UIcons.regularRounded.cross_circle,
              color: Colors.red,
            ),
            backgroundColor: Colors.red[100]!,
          ));
        }
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      infoMessage = true;
    }
    update();
  }

  focusUseridIconColor() {
    userIconColor = AppColors.primaryColor;
    passwordIconColor = Colors.grey;

    infoMessageForUserId = true;
    infoMessageForPassword = false;
    update();
  }

  focusPasswordIconColor() {
    passwordIconColor = AppColors.primaryColor;
    userIconColor = Colors.grey;
    infoMessageForPassword = true;
    infoMessageForUserId = false;
    update();
  }

  changeToUnFocusIconColor() {
    userIconColor = Colors.grey;
    passwordIconColor = Colors.grey;

    update();
  }

  onPressPasswordIcon() {
    passwordvisble = !passwordvisble;
    passwordIcon = passwordvisble
        ? UIcons.regularRounded.unlock
        : UIcons.regularRounded.lock;
    update();
  }

  @override
  void dispose() {
    useridcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
