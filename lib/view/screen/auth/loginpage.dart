import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/auth/login_controller.dart';
import 'package:progres/core/constant/appAssets.dart';
import 'package:progres/view/widgets/loginpage_widgets/costum_loginbutton.dart';
import 'package:progres/view/widgets/loginpage_widgets/costum_loginmessage.dart';
import 'package:progres/view/widgets/loginpage_widgets/costum_textFormField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        // bottomNavigationBar: Container(
        //   margin: const EdgeInsets.only(bottom: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Text(
        //         "وزارة التعليم العالي والبحث العلمي",
        //         style: TextStyle(fontFamily: "Cairo"),
        //       ),
        //       const SizedBox(
        //         width: 8,
        //       ),
        //       Image.asset(
        //         AppAssets.algeriaIcon,
        //         height: 20,
        //       )
        //     ],
        //   ),
        // ),
        body: GetBuilder<LoginControllerImp>(
      builder: (controller) => ListView(
        children: [
          Container(
            //color: Colors.red,
            margin: const EdgeInsets.only(bottom: 20, top: 10),
            height: 230,

            child: Image.asset(
              AppAssets.loginimage,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Wolcome to ",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                  ),
                  Image.asset(
                    AppAssets.progresIconsGreen,
                    width: 120,
                    height: 50,
                  )
                ],
              ),
              const Text(
                "Algerian Students Platform",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Form(
            key: controller.formstate,
            child: Column(
              children: [
                CostumTextFormField(
                  hintText: "Registration Number",
                  iconData: CupertinoIcons.person,
                  controller: controller.useridcontroller,
                  obscureText: false,
                  iconsColor: controller.userIconColor,
                  onTap: () {
                    controller.focusUseridIconColor();
                  },
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                    controller.changeToUnFocusIconColor();
                  },
                  validator: (value) {
                    if (value == "") {
                      return "";
                    }
                    return null;
                  },
                ),
                CostumTextFormField(
                  hintText: "password",
                  iconData: controller.passwordIcon,
                  iconsColor: controller.passwordIconColor,
                  controller: controller.passwordcontroller,
                  obscureText: !controller.passwordvisble,
                  onPressedIcon: () {
                    controller.onPressPasswordIcon();
                  },
                  onTap: () {
                    controller.focusPasswordIconColor();
                  },
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                    controller.changeToUnFocusIconColor();
                  },
                  validator: (value) {
                    if (value == "") {
                      return "";
                    }
                    return null;
                  },
                ),
                Visibility(
                  visible: controller.infoMessage,
                  child: CostumLoginMessage(
                      body: controller.infoMessageForUserId == true
                          ? "your registration number is the year you passed your secondary education certificate + your regestration number ."
                          : "your password is your secret code that you find in your report card."),
                ),
                const CostumLoginButton(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
