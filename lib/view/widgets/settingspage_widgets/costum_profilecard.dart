import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/settingspage_controller.dart';


class CostumProfileCardSettings extends StatelessWidget {
  final String name;
  final String image;
  final String faculty;
  final String specialty;
  final String year;
  final String univname;
  final String univlog;
  final int id;
  final int group;

  const CostumProfileCardSettings({
    super.key,
    required this.name,
    required this.faculty,
    required this.specialty,
    required this.year,
    required this.id,
    required this.group,
    required this.univname,
    required this.univlog,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsPageController>(builder: (controller) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
       
      );
    });
  }
}
