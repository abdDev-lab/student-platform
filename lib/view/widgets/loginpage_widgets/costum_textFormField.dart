import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumTextFormField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final Color iconsColor;
  final TextEditingController controller;
  final bool obscureText;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final void Function()? onPressedIcon;
  const CostumTextFormField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.controller,
    required this.obscureText,
    this.onTap,
    this.onTapOutside,
    required this.iconsColor,
    this.validator,
    this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: Get.isDarkMode
              ? null
              : [
                  BoxShadow(
                      color: const Color.fromARGB(255, 234, 234, 234)
                          .withOpacity(0.5),
                      offset: const Offset(0, -10),
                      blurRadius: 20,
                      spreadRadius: 0)
                ]),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        onTap: onTap,
        onTapOutside: onTapOutside,
        controller: controller,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onPressedIcon,
            icon: Icon(
              iconData,
              color: iconsColor,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          errorStyle:
              const TextStyle(fontSize: 13, color: Colors.red, height: 1),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
