import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/menu/reportcardpage_controller.dart';
import 'package:progres/core/class/handlingData.dart';
import 'package:progres/view/widgets/reportcard_widgets/costum_semsterstudentstats.dart';

class CostumReportCard extends StatelessWidget {
  const CostumReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportCardPageController>(
        builder: (controller) => HandlingDataForWidgets(
              statusRequest: controller.reportStatusRequest,
              widget: Container(
                margin: const EdgeInsets.only(top: 32),
                padding: const EdgeInsets.only(left: 23, right: 23),
                child: Column(
                  children: [
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: controller.columnWidths,
                      children: [
                        const TableRow(children: [
                          SizedBox(height: 40, child: Text("")),
                          Text(
                            "Ceoff",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Credit",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            "AVG",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          )
                        ]),
                        ...List.generate(
                            controller.semesterSelectedStats().length,
                            (index) => TableRow(children: [
                                  Container(
                                      height: 70,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text(
                                            "${controller.semesterSelectedStats()[index].subjectName}",
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )),
                                  Text(
                                    "${controller.semesterSelectedStats()[index].subjectCoff}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.semesterSelectedStats()[index].subjectStudentCredit}/${controller.semesterSelectedStats()[index].subjectCredit}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: controller.getcreditcolor(
                                            controller
                                                .semesterSelectedStats()[index]
                                                .subjectCredit!,
                                            controller
                                                .semesterSelectedStats()[index]
                                                .subjectStudentCredit!)),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: controller.getAvgContainerColor(
                                          controller
                                              .semesterSelectedStats()[index]
                                              .subjectAverge!),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                        "${controller.semesterSelectedStats()[index].subjectAverge}",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: controller.getAvgColor(
                                                controller
                                                    .semesterSelectedStats()[
                                                        index]
                                                    .subjectAverge!))),
                                  )
                                ])),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CostumSemsterStudentAvg(
                      semesteravg: controller.semesterSelectedAvg(),
                      semesterprogress: controller.getsemesterprogress(),
                      semesterCredit: controller.getSemesterCredit(),
                    )
                  ],
                ),
              ),
            ));
  }
}
