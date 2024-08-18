import 'dart:math';

import 'package:progres/data/datasource/local/app_Db.dart';
import 'package:progres/data/model/shedule_model.dart';

class ScheduleTable {
  AppDb appDb = AppDb();

  insertSchedule(List data) async {
    int response = 0;
    Random random = Random();
    for (var index = 0; index < data.length; index++) {
      response = await appDb.insertData("schedules", {
        "schedule_id": data[index]["schedule_id"],
        "teacher_lastname": data[index]["teacher_lastname"],
        "subject_name": data[index]["subject_name"],
        "schedule_groupe": data[index]["schedule_groupe"],
        "schedule_classtype": data[index]["schedule_classtype"],
        "schedule_class": data[index]["schedule_class"],
        "schedule_day": data[index]["schedule_day"],
        "schedule_from": data[index]["schedule_from"],
        "schedule_to": data[index]["schedule_to"],
        "schedule_year": data[index]["schedule_year"],
        "schedule_card_color" : random.nextInt(6),
      });
    }

    if (response > 0) {
      print("success insert");
    }
  }

  getSchedule() async {
    List response = await appDb.readData("schedules", "1=1");
    List<ScheduleModel> data = [];
    data.addAll(response.map((e) => ScheduleModel.fromJson(e)));

    return data;
  }

  deleteSchedule() async {
    int response = await appDb.deleteData("schedules");
    if (response > 0) {
      print("delete success");
    }
  }
}
