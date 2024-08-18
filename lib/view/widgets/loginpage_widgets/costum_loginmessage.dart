import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CostumLoginMessage extends StatelessWidget {
  final String body;
  const CostumLoginMessage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red, width: 1),
      ),
      width: 325,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                CupertinoIcons.info_circle_fill,
                color: Colors.red,
                size: 13,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "Note",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              body,
              style: const TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
