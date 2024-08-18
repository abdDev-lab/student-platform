import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/addtaskpage_controller.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/view/widgets/addtaskpage_widgets/costum_datepicker.dart';
import 'package:progres/view/widgets/addtaskpage_widgets/costum_textformField.dart';
import 'package:uicons/uicons.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTaskPageController());
    return GetBuilder<AddTaskPageController>(
      builder: (controller) => Scaffold(
        backgroundColor:
            Get.isDarkMode ? AppColors.primaryDarkColor: Colors.white,
        body: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(UIcons.regularRounded.angle_left)),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "New Task",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CostumTextformfieldForTask(
                      title: "Title",
                      controller: controller.titlecontroller,
                      readOnly: false,
                      validator: (value) {
                        if (value == "") {
                          return "this field is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CostumTextformfieldForTask(
                      title: "Date",
                      controller: controller.datecontroller,
                      readOnly: true,
                      validator: (value) {
                        if (value == "") {
                          return "this field is required";
                        }
                        return null;
                      },
                      onTap: () {
                        Get.bottomSheet(CostumDatePicker(
                            onCancel: () {
                              controller.clearDate();
                              Get.back();
                              FocusScope.of(context).unfocus();
                            },
                            onDateSelect: (value) {
                              controller.setDate(value);
                            },
                            time: false));
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CostumTextformfieldForTask(
                          title: "Start",
                          controller: controller.startTimecontroller,
                          readOnly: true,
                          validator: (value) {
                            if (value == "") {
                              return "this field is required";
                            }
                            return null;
                          },
                          onTap: () {
                            Get.bottomSheet(CostumDatePicker(
                                onCancel: () {
                                  controller.clearStartTime();
                                  Get.back();
                                  FocusScope.of(context).unfocus();
                                },
                                onDateSelect: (value) {
                                  controller.setStartTime(value);
                                },
                                time: true));
                          },
                        )),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                            child: CostumTextformfieldForTask(
                          title: "End",
                          controller: controller.endTimecontroller,
                          readOnly: true,
                          validator: (value) {
                            if (value == "") {
                              return "this field is required";
                            }
                            return null;
                          },
                          onTap: () {
                            Get.bottomSheet(CostumDatePicker(
                                onCancel: () {
                                  controller.clearEndTime();
                                  Get.back();
                                  FocusScope.of(context).unfocus();
                                },
                                onDateSelect: (value) {
                                  controller.setEndTime(value);
                                },
                                time: true));
                          },
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Select Color",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          controller.colors.length,
                          (index) => InkWell(
                            splashColor: Colors.white.withOpacity(0),
                            onTap: () {
                              controller.changeSelectColor(index);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 12),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(controller.colors[index]),
                                ),
                                child: index == controller.selectColor
                                    ? Icon(
                                        UIcons.regularRounded.check,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    : Container()),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            controller.addTask();
                          },
                          child: const Text(
                            "Create New Task",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
