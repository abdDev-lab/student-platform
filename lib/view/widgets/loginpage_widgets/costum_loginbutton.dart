import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/auth/login_controller.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appColors.dart';

class CostumLoginButton extends StatelessWidget {
  const CostumLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (controller) => Hero(
        tag: "loginanimation",
        child: Container(
          margin: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.primaryColor,
          ),
          width: 125,
          height: 60,
          child: MaterialButton(
            splashColor: Colors.white.withOpacity(0),
            
            onPressed: () {
              controller.login();
            },
            child: controller.statusRequest == StatusRequest.loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
