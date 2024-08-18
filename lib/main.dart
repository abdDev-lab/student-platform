import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/binding/initialBinding.dart';
import 'package:progres/core/functions/themeData.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("theme") != null) {
      if (myServices.sharedPreferences.getString("theme") == "dark") {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
        myServices.sharedPreferences.setString("theme", "light");
      }
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Initialbinding(),
      getPages: routes,
      theme: lightThem,
      darkTheme: darkThem,
    );
  }
}
