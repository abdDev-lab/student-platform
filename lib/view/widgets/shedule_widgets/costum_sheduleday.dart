import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/shedulepage_controller.dart';
import 'package:progres/view/widgets/shedule_widgets/costum_coursetiming.dart';

class CostumScheduleDay extends StatelessWidget {
  const CostumScheduleDay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulePageController>(
      builder: (controller) => Column(
        children: [
          ...List.generate(
              controller.scheduleData.length,
              (index) => controller.scheduleData[index].scheduleDay ==
                      controller.selectweekday + 1
                  ? CostumCourseTiming(
                      lastSubject: controller.verifylastsubject(
                          controller.scheduleData[index].scheduleTo!,
                          controller.scheduleData[index].scheduleDay!),
                      weekday: controller.scheduleData[index].scheduleDay!,
                      subject: "${controller.scheduleData[index].subjectName}",
                      classType:
                          "${controller.scheduleData[index].scheduleClasstype}",
                      classnNumber:
                          controller.scheduleData[index].scheduleClass!,
                      teacherLastName:
                          "${controller.scheduleData[index].teacherLastname}",
                      from: "${controller.scheduleData[index].scheduleFrom}",
                      to: "${controller.scheduleData[index].scheduleTo}",
                      color: controller.colors[controller.scheduleData[index].color!])
                  : Container())
        ],
      ),
    );
  }
}
