import 'package:get/get.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/functions/handlingdata.dart';
import 'package:progres/core/services/myservices.dart';
import 'package:progres/data/datasource/remote/home_remote.dart';
import 'package:progres/data/model/notifications_model.dart';

class NotificationsPageController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  StatusRequest notifyStausRequest = StatusRequest.none;
  StatusRequest readNotifyStausRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  List<NotificationsModel> notifications = [];
  int notReadNotify = 0;

  getNotifications() async {
    notifyStausRequest = StatusRequest.loading;
    update();
    var response = await homeData
        .getNotifications(myServices.sharedPreferences.getInt("id").toString());
    notifyStausRequest = handlingdata(response);
    if (StatusRequest.success == notifyStausRequest) {
      if (response["status"] == "success") {
        notReadNotify = response["data"]["notifications_not_read"];
        notifications.clear();
        List responsebody = response["data"]["notifications"];
        notifications.addAll(responsebody.reversed.map(
          (e) => NotificationsModel.fromJson(e),
        ));
      } else {
        notifyStausRequest = StatusRequest.nodata;
      }
    } else {
      notifyStausRequest = StatusRequest.offline;
    }
    update();
  }

  readNotifications() async {
    readNotifyStausRequest = StatusRequest.loading;
    update();
    var response = await homeData.readNotifications(
        myServices.sharedPreferences.getInt("id").toString());
    readNotifyStausRequest = handlingdata(response);
    if (StatusRequest.success == readNotifyStausRequest) {
      if (response["status"] == "success") {
      } else {
        readNotifyStausRequest = StatusRequest.nodata;
      }
    } else {
      readNotifyStausRequest = StatusRequest.offline;
    }
    update();
  }

  changeReadNotify() {
    notReadNotify = 0;
    update();
  }
}
