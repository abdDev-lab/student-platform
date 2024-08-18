import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/menu/evaluationpage_controller.dart';

class CostumStudentEvaluate extends StatelessWidget {
  const CostumStudentEvaluate({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvlauationPageController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(top: 32),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Table(
              columnWidths: controller.columnWidths,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "TD",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    "TP",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "exam",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
                ...List.generate(
                  controller.semesterSelectedStats().length,
                  (index) => TableRow(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Text(
                        "${controller.semesterSelectedStats()[index].subjectName}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "${controller.semesterSelectedStats()[index].subjectTD ?? "-"}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${controller.semesterSelectedStats()[index].subjectTP ?? "-"}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${controller.semesterSelectedStats()[index].subjectExam}",
                      textAlign: TextAlign.center,
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
