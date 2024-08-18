import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:uicons/uicons.dart';

class CostumListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const CostumListTile(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
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
                ]),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Icon(
                    icon,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                )
              ],
            ),
            Icon(
              UIcons.regularRounded.angle_right,
              color: AppColors.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
