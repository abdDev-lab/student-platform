import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:progres/controller/home/homeScreen_controller.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appAssets.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/core/functions/checkinternet.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/local/shedule_table.dart';
import 'package:progres/data/datasource/remote/home_remote.dart';
import 'package:progres/data/model/events_model.dart';
import 'package:progres/data/model/news_model.dart';

class HomePageController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  late HomeScreenController homeScreenController;

  StatusRequest eventsStatusRequest = StatusRequest.none;
  StatusRequest newsStatusRequest = StatusRequest.none;
  StatusRequest scheduleStatusRequest = StatusRequest.none;
  bool showText = false;

  ScheduleTable scheduleTable = ScheduleTable();
  List<NewsModel> news = [];
  List<EventsModel> events = [];

  @override
  void onInit() {
    homeScreenController = Get.find();
    getScheduleData();
    getNewsData();
    getEventsData();

    super.onInit();
  }

  List<Map> menu = [
    {
      "title": "Exam Schedule",
      "icon": AppAssets.examscheduleIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.examschedulepage);
      }
    },
    {
      "title": "Report Card",
      "icon": AppAssets.reportcardIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.reportcardpage);
      }
    },
    {
      "title": "Evaluation",
      "icon": AppAssets.evaluationIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.evaluationpage);
      }
    },
    {
      "title": "Teachers",
      "icon": AppAssets.teacherIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.teacherspage);
      }
    },
  ];

  getNewsData() async {
    newsStatusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getNewsData(
        myServices.sharedPreferences.getInt("univ_id")!.toString());
    newsStatusRequest = handlingdata(response);
    if (StatusRequest.success == newsStatusRequest) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        news.addAll(responsebody.map(
          (e) => NewsModel.fromJson(e),
        ));
      } else {
        newsStatusRequest = StatusRequest.nodata;
      }
    } else {
      newsStatusRequest = StatusRequest.offline;
    }
    update();
  }

  getEventsData() async {
    eventsStatusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getEventsData(
        myServices.sharedPreferences.getInt("univ_id")!.toString());
    eventsStatusRequest = handlingdata(response);
    if (StatusRequest.success == eventsStatusRequest) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        events.addAll(responsebody.map(
          (e) => EventsModel.fromJson(e),
        ));
      } else {
        eventsStatusRequest = StatusRequest.nodata;
      }
    } else {
      eventsStatusRequest = StatusRequest.offline;
    }
    update();
  }

  getScheduleData() async {
    if (await checkinternet()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.defaultDialog(
          barrierDismissible: false,
          title: "",
          titleStyle: const TextStyle(fontSize: 0),
          backgroundColor: Colors.white.withOpacity(0.5),
          radius: 30,
          content: SizedBox(
            height: 200,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.primaryColor,
                    size: 50,
                  ),
                )
              ],
            ),
          ),
        );
      });
    }
    var response = await homeData.getScheduleData(
        myServices.sharedPreferences.getInt("group")!.toString(),
        myServices.sharedPreferences.getString("year")!.toString(),
        myServices.sharedPreferences.getInt("specialty_id")!.toString());
    scheduleStatusRequest = handlingdata(response);
    if (StatusRequest.success == scheduleStatusRequest) {
      if (response["status"] == "success") {
        Get.back();
        print(scheduleTable.deleteSchedule());
        print(scheduleTable.insertSchedule(response["data"]));
      }
    } else {}
    update();
  }
}
