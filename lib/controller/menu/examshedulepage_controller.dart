import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/remote/menu_remote.dart';
import 'package:progres/data/model/examshedule_model.dart';

class ExamSchedulePageController extends GetxController {
  MenuData menuData = MenuData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<ExamScheduleModel> examschedule = [];

  double selectedWeakdayPostion = Get.height/4.39;
  int selectedWeakday = 0;
  int selectedDay = 0;

  Color scaffoldColor = Colors.white;
  @override
  void onInit() {
    getExamScheduleData();
    super.onInit();
  }

  getExamScheduleData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await menuData.getExamSchedule(
      myServices.sharedPreferences.getInt("specialty_id")!.toString(),
      myServices.sharedPreferences.getString("year")!.toString(),
      myServices.sharedPreferences.getInt("group")!.toString(),
    );
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        scaffoldColor = AppColors.primaryColor;
        update();
        List responsebody = response["data"];
        examschedule
            .addAll(responsebody.map((e) => ExamScheduleModel.fromJson(e)));
        selectedDay =
            DateTime.parse(examschedule.first.examsheduleDatetimeFrom!).day;
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      statusRequest = StatusRequest.serveroffline;
    }
    update();
  }

  changeSelectedWeakdayPostion(int index, int date) {
    selectedWeakdayPostion = Get.height/4.40 + (index * 79);
    selectedWeakday = index;
    selectedDay = date;
    update();
  }

  
}
