import 'package:progres/core/class/crud.dart';
import 'package:progres/core/constant/appLinks.dart';

class LoginData {
  Crud crud = Crud();
  LoginData(this.crud);

  getData(String id, String password) async {
    var response = await crud
        .postRequest(AppLinks.loginLink, {"id": id, "password": password});

    return response.fold((l) => l, (r) => r);
  }
}
