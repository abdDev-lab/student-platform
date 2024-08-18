import 'package:progres/core/class/statusRequest.dart';

handlingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
