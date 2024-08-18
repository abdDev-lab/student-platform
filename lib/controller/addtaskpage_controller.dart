import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/controller/home/shedulepage_controller.dart';
import 'package:progres/data/datasource/local/tasks_table.dart';

class AddTaskPageController extends GetxController {
  late SchedulePageController schedulePageController;
  TasksTable tasksTable = TasksTable();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController titlecontroller;
  late TextEditingController datecontroller;
  late TextEditingController startTimecontroller;
  late TextEditingController endTimecontroller;
  DateTime? datefortable;
  int selectColor = 0;
  List<int> colors = [
    0xFFFF8A80,
    0xFF82B1FF,
    0xFFFFD180,
    0xFFFF80AB,
    0xFFEA80FC,
    0xFF1A237E,
  ];

  @override
  void onInit() {
    schedulePageController = Get.find();
    titlecontroller = TextEditingController();
    datecontroller = TextEditingController();
    datecontroller.text = Jiffy.parseFromDateTime(DateTime.now()).yMMMEd;
    datefortable = DateTime.now();
    startTimecontroller = TextEditingController();
    startTimecontroller.text = Jiffy.parseFromDateTime(DateTime.now()).jm;
    endTimecontroller = TextEditingController();
    endTimecontroller.text = Jiffy.parseFromDateTime(DateTime.now()).jm;
    super.onInit();
  }

  setDate(DateTime date) {
    datecontroller.text = Jiffy.parseFromDateTime(date).yMMMEd;
    datefortable = date;
    update();
  }

  clearDate() {
    datecontroller.text = "";
    update();
  }

  setStartTime(DateTime date) {
    startTimecontroller.text = Jiffy.parseFromDateTime(date).jm;
    update();
  }

  clearStartTime() {
    startTimecontroller.text = "";
    update();
  }

  setEndTime(DateTime date) {
    endTimecontroller.text = Jiffy.parseFromDateTime(date).jm;
    update();
  }

  clearEndTime() {
    endTimecontroller.text = "";
    update();
  }

  changeSelectColor(index) {
    selectColor = index;
    update();
  }

  addTask() {
    if (formstate.currentState!.validate()) {
      tasksTable.insertTask(
          titlecontroller.text,
          datefortable.toString(),
          startTimecontroller.text,
          endTimecontroller.text,
          colors[selectColor],
          0);
      schedulePageController.setTasks();
      update();
      Get.back();
    }
  }
}
