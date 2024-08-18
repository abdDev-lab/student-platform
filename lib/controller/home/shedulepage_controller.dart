import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'package:progres/data/datasource/local/shedule_table.dart';
import 'package:progres/data/datasource/local/tasks_table.dart';

import 'package:progres/data/model/shedule_model.dart';



class SchedulePageController extends GetxController {
  ScheduleTable scheduleTable = ScheduleTable();
  TasksTable tasksTable = TasksTable();
  List<ScheduleModel> scheduleData = [];
  List tasksData = [];
  Map checkList = {};

  List<String> daysofWeek = ["Mon", "The", "Wed", "Thu", "Fri", "Sat", "Sun"];
  Map<int, int> lasthoursofweekdays = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0
  };
  List<Map> monthsOfSeason = [
    {"month": 08, "year": 2024}, // August
    {"month": 09, "year": 2024}, // September
    {"month": 10, "year": 2024}, // October
    {"month": 11, "year": 2024}, // November
    {"month": 12, "year": 2024}, // December
    {"month": 01, "year": 2025}, // January
    {"month": 02, "year": 2025}, // February
    {"month": 03, "year": 2025}, // March
    {"month": 04, "year": 2025}, // April
    {"month": 05, "year": 2025}, // May
    {"month": 06, "year": 2025}, // June
    {"month": 07, "year": 2025} // July
  ];
  List<int> colors = [
    0xFFFF8A80,
    0xFF82B1FF,
    0xFFFFD180,
    0xFFFF80AB,
    0xFFEA80FC,
    0xFF1A237E,
  ];

  Map<int, Map> weeksAndDaysInMonth = {};

  int weeknumber = 0;
  int currentweeknumber = 0;

  //Schedule________________________
  double notcurrentDayHeight = 0;
  double notcurrentDayWidth = 35;
  double notcurrentDaymargin = 0;

  double currentDayHeight = 70;
  double currentDayWidth = 45;
  double currentDayMargin = 0;
  double currentDayPadding = 10;
  Alignment currentDayAlign = Alignment.bottomCenter;

  double weekDayPos = 10;
  double currentWeekPos = 0;

  double monthPostion = 10;
  double anglemonthopacity = 0;
  int selectedMonth = 0;

  double tableHeight = 80;
  double daysopacity = 1;

  int currentDay = DateTime.now().day;
  int currentweekDay = DateTime.now().weekday;

  int selectWeekNumber = 0;
  int selectweekday = 0;

  bool weekdayvisible = true;
  double? weekdayheighthead = 70 ; 

  double dateOpacity = 1;
  double dateMargin = 20;

  int lastCoursTime = 0;
  // Tasks _____________
  bool check = false;
  Random random = Random();
  int maxhour = 0;
  int daySelected = 0;

  @override
  void onInit() {
    getWeeksDayofMonth(DateTime.now().year, DateTime.now().month);
    setSchedule();
    setTasks();
    daySelected = currentDay;
    update();
    super.onInit();
  }

  setSchedule() async {
    scheduleData = await scheduleTable.getSchedule();
    for (var i = 0; i < scheduleData.length; i++) {
      if (Jiffy.parse("0000-00-00 ${scheduleData[i].scheduleTo}").hour >
          lasthoursofweekdays[scheduleData[i].scheduleDay!]!) {
        lasthoursofweekdays[scheduleData[i].scheduleDay!] =
            Jiffy.parse("0000-00-00 ${scheduleData[i].scheduleTo}").hour;
      }
    }
    update();
  }

  setTasks() async {
    tasksData = [];
    tasksData = await tasksTable.getTasks();
    update();
  }

  getWeeksDayofMonth(int year, int month) {
    String filterMonth = month < 10 ? "0$month" : "$month";
    weeknumber = 0;
    weeksAndDaysInMonth.clear();
    int daysofmonth = Jiffy.parse("$year-$filterMonth-01").daysInMonth;
    for (int day = 1; day <= daysofmonth; day++) {
      int weekday = DateTime(year, month, day).weekday;
      if (weekday == 1) {
        weeknumber++;
      }
      if (day == DateTime.now().day) {
        currentweeknumber = weeknumber;
        update();
      }

      if (!weeksAndDaysInMonth.containsKey(weekday)) {
        weeksAndDaysInMonth[weekday] = {};
      }
      weeksAndDaysInMonth[weekday]![weeknumber] = day;
    }
    if (!weekdayvisible) {
      if (weeknumber == 4) {
        tableHeight = 260;
      } else {
        tableHeight = 300;
      }
    }
    selectWeekNumber = currentDay;
    selectweekday = currentweekDay - 1;
    update();
  }

  onTapDay(int index, int weekdayindex) {
    selectWeekNumber = index;
    selectweekday = weekdayindex;
    daySelected = weeksAndDaysInMonth[weekdayindex + 1]![index];
    update();
  }

  onTapWeekDay(int weekdayindex) {
    if (weekdayvisible) {
      selectweekday = weekdayindex;
    }
    update();
  }

  showweek() {
    weekdayvisible = !weekdayvisible;
    if (weekdayvisible) {
      tableHeight = 80;
      currentDayHeight = 70;
      currentDayWidth = 45;
      currentDayMargin = 0;
      weekDayPos = 10;
      currentWeekPos = 0;
      currentDayPadding = 10;
      currentDayAlign = Alignment.bottomCenter;
      dateOpacity = 1;
      daysopacity = 0;
      dateMargin = 20;
      monthPostion = 10;
      anglemonthopacity = 0;
      weekdayheighthead = 70 ; 
    } else {
      if (weeknumber == 4) {
        tableHeight = 260;
      } else {
        tableHeight = 300;
      }
      currentDayHeight = 35;
      currentDayWidth = 35;
      currentDayMargin = 10;
      weekDayPos = 0;
      currentWeekPos = 25;
      currentDayPadding = 0;
      currentDayAlign = Alignment.center;
      daysopacity = 1;
      notcurrentDayHeight = 35;
      notcurrentDayWidth = 35;
      notcurrentDaymargin = 10;
      dateOpacity = 0;
      dateMargin = 0;
      monthPostion = 0;
      anglemonthopacity = 1;
      weekdayheighthead= 35 ; 
    }
    update();
  }

  changeNotCurrentDay() {
    if (weekdayvisible) {
      notcurrentDayHeight = 0;
      notcurrentDayWidth = 0;
      notcurrentDaymargin = 0;
    }
    update();
  }

  changeMonth(int value) {
    selectedMonth = value;
    update();
  }

  verifylastsubject(String lasthour, int scheduleDay) {
    if (Jiffy.parse("0000-00-00 $lasthour").hour ==
        lasthoursofweekdays[scheduleDay]!) {
      return true;
    } else {
      return false;
    }
  }

  int getRandomColor() {
    int randomNumber = random.nextInt(6);
    return colors[randomNumber];
  }

  //Tasks _______
}
