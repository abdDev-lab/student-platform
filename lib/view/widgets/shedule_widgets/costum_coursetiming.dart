import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumCourseTiming extends StatelessWidget {
  final String subject;
  final String classType;
  final int classnNumber;
  final String teacherLastName;
  final int weekday;
  final String from;
  final String to;
  final int color;
  final bool lastSubject;
  const CostumCourseTiming(
      {super.key,
      required this.subject,
      required this.classType,
      required this.classnNumber,
      required this.teacherLastName,
      required this.from,
      required this.to,
      required this.weekday,
      required this.lastSubject,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 2),
              height: 150,
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Jiffy.parse("0000-00-00 $from").Hm,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(Jiffy.parse("0000-00-00 $to").Hm,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15))
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                DateTime.parse("0000-00-00 $to").hour <= DateTime.now().hour &&
                        weekday == DateTime.now().weekday
                    ? CupertinoIcons.largecircle_fill_circle
                    : CupertinoIcons.circle,
                color: AppColors.primaryColor,
                size: 20,
              ),
              lastSubject
                  ? Container(
                      height: 130,
                    )
                  : Container(
                      height: 130,
                      width: 2.5,
                      margin: const EdgeInsets.only(top: 2, bottom: 2),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                    )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 140,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(color) , 
              boxShadow: [
                BoxShadow(
                    color: Color(color).withOpacity(0.3),
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: 0)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      classType,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "${classType == "Cours" ? "Amphi" : classType == "TD" ? "Salle" : "Labo"} $classnNumber",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person_circle,
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Dr. $teacherLastName",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
