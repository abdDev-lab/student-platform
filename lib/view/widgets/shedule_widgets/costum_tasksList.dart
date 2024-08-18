import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/controller/home/shedulepage_controller.dart';
import 'package:progres/view/widgets/shedule_widgets/costum_taskcard.dart';

class CostumTasksList extends StatelessWidget {
  const CostumTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulePageController>(
      builder: (controller) => Column(
        children: [
          SizedBox(
            width: 400,
            child: Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                )),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: const Text(
                    "Tasks",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ...List.generate(controller.tasksData.length, (index) {
            return controller.daySelected ==
                    Jiffy.parse(controller.tasksData[index]["task_datetime"])
                        .date
                ? InkWell(
                    onTap: () {
                      if (controller.tasksData[index]["task_do"] == 1) {
                        controller.tasksTable.updateTasks(
                            controller.tasksData[index]["task_id"], 0);
                        controller.setTasks();
                      } else {
                        controller.tasksTable.updateTasks(
                            controller.tasksData[index]["task_id"], 1);
                        controller.setTasks();
                      }
                    },
                    splashColor: Colors.white.withOpacity(0),
                    child: CostumTaskCard(
                        title: controller.tasksData[index]["task_title"],
                        startTime: controller.tasksData[index]
                            ["task_starttime"],
                        endTime: controller.tasksData[index]["task_endtime"],
                        color: controller.tasksData[index]["task_color"],
                        check: controller.tasksData[index]["task_do"] == 1
                            ? true
                            : false))
                : Container();
          })
        ],
      ),
    );
  }
}
