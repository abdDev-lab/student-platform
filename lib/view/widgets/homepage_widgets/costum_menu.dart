import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/homepage_controller.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumMenu extends StatelessWidget {
  const CostumMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color:
                  Get.isDarkMode ? AppColors.secondaryDarkColor : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: Get.isDarkMode
                  ? null
                  : [
                      BoxShadow(
                          color: const Color.fromARGB(255, 192, 192, 192)
                              .withOpacity(0.2),
                          offset: const Offset(0, 0),
                          blurRadius: 20,
                          spreadRadius: 0)
                    ],
            ),
            child: MaterialButton(
              splashColor: Colors.white.withOpacity(0),
              onPressed: controller.menu[index]["ontap"],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    controller.menu[index]["icon"],
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    controller.menu[index]["title"],
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
