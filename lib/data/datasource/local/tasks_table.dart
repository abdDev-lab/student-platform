import 'package:progres/data/datasource/local/app_Db.dart';

class TasksTable {
  AppDb appDb = AppDb();

  insertTask(String title, String dateTime, String startTime, String endTime,
      int color, int taskdo) async {
    int response = 0;

    response = await appDb.insertData("tasks", {
      "task_title": title,
      "task_datetime": dateTime,
      "task_starttime": startTime,
      "task_endtime": endTime,
      "task_color": color,
      "task_do": taskdo
    });

    if (response > 0) {
      print("success insert");
    }
  }

  getTasks() async {
    var response = await appDb.readData("tasks", "1=1");
    return response;
  }

  updateTasks(int taskId, int value) async {
    int response = await appDb.updateData(
        'UPDATE tasks SET task_do = $value WHERE task_id = $taskId');
    if (response > 0) {
      print("update success");
    }
  }

  deletetask() async {
    int response = await appDb.deleteData("tasks");
    if (response > 0) {
      print("delete success");
    }
  }
}
