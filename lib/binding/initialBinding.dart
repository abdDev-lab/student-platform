import 'package:get/get.dart';
import 'package:progres/core/class/crud.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
