import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/homepage_controller.dart';
import 'package:progres/core/class/handlingData.dart';
import 'package:progres/core/constant/appLinks.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CostumNewsView extends StatelessWidget {
  const CostumNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        builder: (controller) => HandlingDataWithShimmerViewForNews(
              statusRequest: controller.newsStatusRequest,
              widget: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                width: 400,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: Get.isDarkMode
                        ? null
                        : [
                            BoxShadow(
                                color: const Color.fromARGB(255, 192, 192, 192)
                                    .withOpacity(0.2),
                                offset: const Offset(0, 0),
                                blurRadius: 20,
                                spreadRadius: 0)
                          ]),
                child: Column(
                  children: [
                    ...List.generate(
                      controller.news.length,
                      (index) => Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: 400,
                          height: 80,
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppLinks.newsImageLink}/${controller.news[index].newsImage}",
                                  )),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.news[index].newsSmallbody}",
                                      style: TextStyle(
                                          color: Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ));
  }
}
