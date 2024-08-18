import 'package:progres/core/class/crud.dart';
import 'package:progres/core/constant/appLinks.dart';

class MenuData {
  Crud crud = Crud();
  MenuData(this.crud);

  getTeachersData() async {
    var response = await crud.postRequest(AppLinks.teachersLink, {});

    return response.fold((l) => l, (r) => r);
  }

  getTeachersSearchData(String search) async {
    var response = await crud
        .postRequest(AppLinks.teachersSearchLink, {"teachername": search});

    return response.fold((l) => l, (r) => r);
  }

  getStudentData(String id, String year) async {
    var response = await crud
        .postRequest(AppLinks.reportcardLink, {"student_id": id, "year": year});

    return response.fold((l) => l, (r) => r);
  }

  getExamSchedule(String specialityid, String year, String groupe) async {
    var response = await crud.postRequest(AppLinks.examscheduleLink,
        {"speciality_id": specialityid, "year": year, "groupe": groupe});
    return response.fold((l) => l, (r) => r);
  }
}
