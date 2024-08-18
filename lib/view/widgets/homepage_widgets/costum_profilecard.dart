import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appAssets.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:progres/core/constant/appLinks.dart';
import 'package:uicons/uicons.dart';
import 'package:url_launcher/url_launcher.dart';

class CostumProfileCard extends StatelessWidget {
  final String name;
  final String image;
  final String faculty;
  final String facultywebsite;
  final String specialty;

  final String year;
  final String univlog;
  final String univname;
  final String univwebsite;
  final int id;
  final int group;

  const CostumProfileCard({
    super.key,
    required this.name,
    required this.faculty,
    required this.specialty,
    required this.year,
    required this.id,
    required this.group,
    required this.univname,
    required this.facultywebsite,
    required this.univlog,
    required this.univwebsite,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 355,
      child: Stack(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: 200,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${AppLinks.univImageLink}/$univlog",
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "University of\n$univname",
                                textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                speed: const Duration(milliseconds: 125),
                                cursor: "|",
                              ),
                            ],
                            totalRepeatCount: 1,
                            pause: const Duration(milliseconds: 10),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                            onTap: () {
                              launchUrl(Uri.parse(univwebsite),
                                  mode: LaunchMode.externalApplication);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  AppAssets.progresIconsWhite,
                  width: 100,
                  height: 50,
                ),
              ],
            ),
          ),
          Positioned(
              top: 110,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
                height: 235,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: Get.isDarkMode
                        ? null
                        : [
                            BoxShadow(
                                color: const Color.fromARGB(255, 192, 192, 192)
                                    .withOpacity(0.3),
                                offset: const Offset(0, 1),
                                blurRadius: 20,
                                spreadRadius: 0)
                          ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "UNI$id",
                      style: TextStyle(
                          color: Get.isDarkMode
                              ? Colors.white
                              : Colors.black), //grey
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(facultywebsite),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Text(
                                faculty,
                                style: const TextStyle(
                                    color: AppColors.primaryColor),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              UIcons.regularRounded.angle_right,
                              size: 13,
                              color: AppColors.primaryColor,
                            )
                          ],
                        )),
                    Text(
                      specialty,
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Year",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.grey), //grey
                              ),
                              Text(
                                year,
                                style: TextStyle(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                          VerticalDivider(
                            width: 0.5,
                            color: Colors.grey[300],
                          ),
                          Column(
                            children: [
                              Text(
                                "Group",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.grey), //grey
                              ),
                              Text("$group",
                                  style: TextStyle(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Colors.black))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              top: 60,
              left: 40,
              right: 40,
              child: Container(
                padding: const EdgeInsets.all(2),
                height: 100,
                width: 100,

                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    shape: BoxShape.circle,
                    boxShadow: Get.isDarkMode
                        ? null
                        : [
                            BoxShadow(
                                color: const Color.fromARGB(255, 192, 192, 192)
                                    .withOpacity(0.5),
                                offset: const Offset(0, 2),
                                blurRadius: 5,
                                spreadRadius: 0)
                          ]),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "${AppLinks.userImageLink}/$image",
                            ),
                      )),
                ),

                // child: Image.asset(
                //   AppAssets.userimage,
                //   width: 50,
                //   height: 50,
                // ),
              ))
        ],
      ),
    );
  }
}
