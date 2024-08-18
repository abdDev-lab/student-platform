import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/menupage_controller.dart';
import 'package:progres/core/constant/appColors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MenuPageControllerImp());
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 16, bottom: 20),
            child: Text(
              "Menu",
              style: TextStyle(
                  fontSize: 26,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          GetBuilder<MenuPageControllerImp>(
            builder: (controller) => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.menu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                splashColor: Colors.white.withOpacity(0),
                onTap: controller.menu[index]["ontap"],
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? AppColors.secondaryDarkColor
                        : Colors.white,
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
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
