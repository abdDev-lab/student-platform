import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumTextformfieldForTask extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;

  const CostumTextformfieldForTask(
      {super.key,
      required this.title,
      required this.controller,
      this.onTap,
      this.validator,
      required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
      height: 80,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        validator: validator,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        readOnly: readOnly,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: title,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          filled: true,
          fillColor:
              Get.isDarkMode ? AppColors.primaryDarkColor : Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: Get.isDarkMode ? Colors.white : Colors.black)),
          errorStyle:
              const TextStyle(fontSize: 13, color: Colors.red, height: 1),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
