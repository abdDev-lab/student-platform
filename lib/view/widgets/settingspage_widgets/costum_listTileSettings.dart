import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumListTileSettings extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  final void Function(bool) onToggle;
  final void Function()? onTap;
  const CostumListTileSettings(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      required this.value,
      required this.onToggle});

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
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            FlutterSwitch(
              value: value,
              onToggle: onToggle,
              width: 40,
              height: 23,
              toggleSize: 15,
              inactiveColor: AppColors.secondaryColor,
              activeColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
