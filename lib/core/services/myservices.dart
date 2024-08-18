
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyALjJslBCeSKyiNijyyIfSjRgjUaADIkoQ",
            appId: "1:723096680316:android:77308c856e9fa0db4196f9",
            messagingSenderId: "723096680316",
            projectId: "progres-a14e4"));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  
}
