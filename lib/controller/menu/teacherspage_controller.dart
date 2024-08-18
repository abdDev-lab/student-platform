import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/data/datasource/remote/menu_remote.dart';
import 'package:progres/data/model/teacher_model.dart';

class TeachersPageController extends GetxController {
  MenuData menuData = MenuData(Get.find());
  StatusRequest teacherStatusRequest = StatusRequest.none;
  List<TeacherModel> teachers = [];
  List<TeacherModel> searchteachers = [];

  late TextEditingController searchController;
  bool isSearch = false;
  bool cancelsearch = false;

  @override
  void onInit() {
    getTeacherData();
    searchController = TextEditingController();
    super.onInit();
  }

  getTeacherData() async {
    teacherStatusRequest = StatusRequest.loading;
    update();
    var response = await menuData.getTeachersData();
    teacherStatusRequest = handlingdata(response);
    if (StatusRequest.success == teacherStatusRequest) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        teachers.addAll(responsebody.map(
          (e) => TeacherModel.fromJson(e),
        ));
      } else {
        teacherStatusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  getSearchTeacherData() async {
    teacherStatusRequest = StatusRequest.loading;
    update();
    var response = await menuData.getTeachersSearchData(searchController.text);
    teacherStatusRequest = handlingdata(response);
    if (StatusRequest.success == teacherStatusRequest) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        searchteachers.addAll(responsebody.map(
          (e) => TeacherModel.fromJson(e),
        ));
      } else {
        teacherStatusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val != "") {
      isSearch = true;
      cancelsearch = true;
    } else {
      searchController.clear();
      isSearch = false;
      cancelsearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;

    update();
  }

  onCancel() {
    cancelsearch = false;
    searchController.clear();
    checkSearch("");
    update();
  }
}
