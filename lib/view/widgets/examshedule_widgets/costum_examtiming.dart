import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CostumExamTiming extends StatelessWidget {
  final String subject;
  final String classType;
  final int classNumber;
  final String dateTimeFrom;
  final String dateTimeTo;
  const CostumExamTiming(
      {super.key,
      required this.subject,
      required this.classType,
      required this.classNumber,
      required this.dateTimeFrom,
      required this.dateTimeTo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 90,
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Jiffy.parse(dateTimeFrom).Hm,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(Jiffy.parse(dateTimeTo).Hm,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15))
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 85,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.redAccent[100],
              boxShadow: [
                BoxShadow(
                    color: Colors.redAccent[100]!.withOpacity(0.3),
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
                      "$classType $classNumber",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
