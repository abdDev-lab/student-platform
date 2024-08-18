import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/remote/menu_remote.dart';
import 'package:progres/data/model/semester_model.dart';

class EvlauationPageController extends GetxController {
  MenuData menuData = MenuData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest evaluationStatusRequest = StatusRequest.none;
  double? semesterbuttonpostion = 4;
  int semesterselected = 1;

  Color firstbuttonColor = Colors.white;
  Color secondbuttonColor = AppColors.primaryColor;
  List<SemesterModel> studentStatsFirstSemester = [];
  List<SemesterModel> studentStatsSecondSemester = [];
  Map<int, TableColumnWidth>? columnWidths = {
    0: const FlexColumnWidth(),
    1: const FixedColumnWidth(60),
    2: const FixedColumnWidth(60),
    3: const FixedColumnWidth(60),
  };

  @override
  void onInit() {
    getStudentsStatsData();
    super.onInit();
  }

  changePostionButtontoRight() {
    semesterselected = 2;
    semesterbuttonpostion = 130;
    firstbuttonColor = AppColors.primaryColor;
    secondbuttonColor = Colors.white;
    update();
  }

  changePostionButtontoLeft() {
    semesterselected = 1;
    semesterbuttonpostion = 4;
    firstbuttonColor = Colors.white;
    secondbuttonColor = AppColors.primaryColor;
    update();
  }

  getStudentsStatsData() async {
    evaluationStatusRequest = StatusRequest.loading;
    update();
    var response = await menuData.getStudentData(
        myServices.sharedPreferences.getInt("id").toString(),
        myServices.sharedPreferences.getString("year")!);
    evaluationStatusRequest = handlingdata(response);
    if (StatusRequest.success == evaluationStatusRequest) {
      if (response["status"] == "success") {
        List firstresponsebody =
            response["data"]["student_stats_first_semester"];
        List secondresponsebody =
            response["data"]["student_stats_second_semester"];
        studentStatsFirstSemester
            .addAll(firstresponsebody.map((e) => SemesterModel.fromJson(e)));
        studentStatsSecondSemester
            .addAll(secondresponsebody.map((e) => SemesterModel.fromJson(e)));
      }
    } else {
      evaluationStatusRequest = StatusRequest.serveroffline;
    }
    update();
  }

  List<SemesterModel> semesterSelectedStats() {
    if (semesterselected == 1) {
      return studentStatsFirstSemester;
    }
    if (semesterselected == 2) {
      return studentStatsSecondSemester;
    }
    return [];
  }
}
