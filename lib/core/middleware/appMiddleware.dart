import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/core/services/myservices.dart';

class AppMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();


  @override
  RouteSettings? redirect(route) {
    if (myServices.sharedPreferences.getInt("id") != null ) {
      return const RouteSettings(name: AppRoutes.homescreen);
    }
    return null;
  }
}
