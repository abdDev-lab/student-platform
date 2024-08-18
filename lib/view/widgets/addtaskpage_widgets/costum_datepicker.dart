import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:uicons/uicons.dart';

class CostumDatePicker extends StatelessWidget {
  final void Function()? onCancel;
  final void Function(DateTime) onDateSelect;
  final bool time;
  const CostumDatePicker(
      {super.key,
      this.onCancel,
      required this.onDateSelect,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        decoration: BoxDecoration(
            color: Get.isDarkMode ? AppColors.secondaryDarkColor : Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        height: 370,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: onCancel,
                    icon: Icon(
                      UIcons.regularRounded.cross,
                      color: Colors.grey,
                      size: 20,
                    )),
                IconButton(
                    onPressed: () {
                      Get.back();
                      FocusScope.of(context).unfocus();
                    },
                    icon: Icon(
                      UIcons.regularRounded.check,
                      color: AppColors.primaryColor,
                      size: 25,
                    )),
              ],
            ),
            SizedBox(
              height: 300,
              child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: time
                      ? CupertinoDatePickerMode.time
                      : CupertinoDatePickerMode.date,
                  showDayOfWeek: true,
                  onDateTimeChanged: onDateSelect),
            )
          ],
        ));
  }
}
