import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumOverall extends StatelessWidget {
  final double progress;
  final String overall;
  const CostumOverall(
      {super.key, required this.progress, required this.overall});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 16),
      child: Column(
        children: [
          SizedBox(
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 160,
                    child: DashedCircularProgressBar.aspectRatio(
                      aspectRatio: 1, // width ÷ height
                      valueNotifier: ValueNotifier(75),
                      progress: progress,
                      startAngle: 225,
                      sweepAngle: 270,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      foregroundStrokeWidth: 10,
                      backgroundStrokeWidth: 9,
                      animation: true,
                      seekSize: 5,
                      seekColor: const Color(0xffeeeeee),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            overall,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "/20",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Overall",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              )),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Passed",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Credit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "60",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
