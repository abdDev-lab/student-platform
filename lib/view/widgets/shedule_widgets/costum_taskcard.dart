import 'package:flutter/material.dart';

class CostumTaskCard extends StatelessWidget {
  final String title;
  final String startTime;
  final String endTime;
  final bool check;
  final int color;
  const CostumTaskCard(
      {super.key,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.check,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(color),
        boxShadow: [
          BoxShadow(
              color: Color(color).withOpacity(0.3),
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 0)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$startTime - $endTime",
                style: const TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
          Icon(
            check ? Icons.check_box : Icons.check_box_outline_blank_rounded,
            size: 25,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
