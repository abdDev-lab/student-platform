import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/remote/menu_remote.dart';
import 'package:progres/data/model/semester_model.dart';

class ReportCardPageController extends GetxController {
  MenuData menuData = MenuData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest reportStatusRequest = StatusRequest.none;
  double? semesterbuttonpostion = 4;
  int semesterselected = 1;

  Color firstbuttonColor = Colors.white;
  Color secondbuttonColor = AppColors.primaryColor;
  List<SemesterModel> studentStatsFirstSemester = [];
  List<SemesterModel> studentStatsSecondSemester = [];
  List studenttest = [];

  double? firstSemesterAvg;
  int? firstSemesterCredit;
  double? secondSemesterAvg;
  int? secondSemesterCredit;
  double? overall;

  Map<int, TableColumnWidth>? columnWidths = {
    0: const FlexColumnWidth(),
    1: const FixedColumnWidth(50),
    2: const FixedColumnWidth(70),
    3: const FixedColumnWidth(80),
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
    reportStatusRequest = StatusRequest.loading;
    update();
    var response = await menuData.getStudentData(
        myServices.sharedPreferences.getInt("id").toString(),
        myServices.sharedPreferences.getString("year")!);
    reportStatusRequest = handlingdata(response);
    if (StatusRequest.success == reportStatusRequest) {
      if (response["status"] == "success") {
        firstSemesterAvg = double.parse(response["data"]["avergesemester"][0]
                ["averge_semester"]
            .toString());
        firstSemesterCredit =
            response["data"]["avergesemester"][0]["totalcredit"];
        secondSemesterAvg = double.parse(response["data"]["avergesemester"][1]
                ["averge_semester"]
            .toString());
        secondSemesterCredit =
            response["data"]["avergesemester"][1]["totalcredit"];
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
      reportStatusRequest = StatusRequest.serveroffline;
    }
    update();
  }

  Color getAvgColor(double avg) {
    if (avg >= 10) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Color getAvgContainerColor(double avg) {
    if (avg >= 10) {
      return Colors.green.withOpacity(0.2);
    } else {
      return Colors.red.withOpacity(0.2);
    }
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

  String semesterSelectedAvg() {
    if (semesterselected == 1) {
      if (firstSemesterAvg == null) {
        return "-";
      } else {
        return firstSemesterAvg!.toStringAsFixed(2);
      }
    }
    if (semesterselected == 2) {
      if (secondSemesterAvg == null) {
        return "-";
      } else {
        return secondSemesterAvg!.toStringAsFixed(2);
      }
    }
    return "-";
  }

  Color getcreditcolor(int credit, int studentcredit) {
    if (credit == studentcredit) {
      return Get.isDarkMode ? Colors.white : Colors.black;
    } else {
      return Colors.red;
    }
  }

  String getOverall() {
    if (firstSemesterAvg == null || secondSemesterAvg == null) {
      return "-";
    } else {
      return ((firstSemesterAvg! + secondSemesterAvg!) / 2).toStringAsFixed(2);
    }
  }

  double getoverallprogress() {
    if (firstSemesterAvg == null || secondSemesterAvg == null) {
      return 0;
    } else {
      return ((firstSemesterAvg! + secondSemesterAvg!) / 2) * 100 / 20;
    }
  }

  double getsemesterprogress() {
    if (semesterselected == 1) {
      if (firstSemesterAvg == null) {
        return 0;
      } else {
        return (firstSemesterAvg! * 100 / 20);
      }
    }
    if (semesterselected == 2) {
      if (secondSemesterAvg == null) {
        return 0;
      } else {
        return (secondSemesterAvg! * 100 / 20);
      }
    }
    return 0;
  }

  int getSemesterCredit() {
    if (firstSemesterAvg != null && secondSemesterAvg != null) {
      if (semesterselected == 1) {
        if (firstSemesterAvg! >= 10) {
          return 30;
        } else {
          return firstSemesterCredit!;
        }
      }
      if (semesterselected == 2) {
        if (secondSemesterAvg! > 10) {
          return 30;
        } else {
          return secondSemesterCredit!;
        }
      }
    }
    return 0;
  }
}
