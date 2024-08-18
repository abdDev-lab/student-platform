import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumSubtitle extends StatelessWidget {
  final String title;
  final bool viewallvisible;
  final void Function()? onTapview;
  const CostumSubtitle(
      {super.key,
      required this.title,
      required this.viewallvisible,
      this.onTapview});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 10, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
          Visibility(
              visible: viewallvisible,
              child: InkWell(
                onTap: onTapview,
                child: Text(
                  "View all",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}
