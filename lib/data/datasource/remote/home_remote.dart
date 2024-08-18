import 'package:progres/core/class/crud.dart';
import 'package:progres/core/constant/appLinks.dart';

class HomeData {
  Crud crud = Crud();
  HomeData(this.crud);

  getEventsData(String univId) async {
    var response =
        await crud.postRequest(AppLinks.eventsLink, {"univ_id": univId});

    return response.fold((l) => l, (r) => r);
  }

  getNewsData(String univId) async {
    var response =
        await crud.postRequest(AppLinks.newsLink, {"univ_id": univId});

    return response.fold((l) => l, (r) => r);
  }

  getScheduleData(String group, String year, String speciality) async {
    var response = await crud.postRequest(AppLinks.scheduleLink,
        {"group": group, "year": year, "speciality": speciality});

    return response.fold((l) => l, (r) => r);
  }

  getNotifications(String studentid) async {
    var response = await crud.postRequest(AppLinks.notificationsLink, {"student_id" : studentid});

    return response.fold((l) => l, (r) => r);
  }

  readNotifications(String studentid) async {
    var response = await crud.postRequest(AppLinks.readnotificationsLink, {"student_id" : studentid});
    return response.fold((l) => l, (r) => r);
  }
}
