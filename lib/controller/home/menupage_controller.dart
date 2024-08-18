import 'package:get/get.dart';
import 'package:progres/core/constant/appAssets.dart';
import 'package:progres/core/constant/appRoutes.dart';

abstract class MenuPageController extends GetxController {}

class MenuPageControllerImp extends MenuPageController {
  List<Map> menu = [
    {
      "title": "Exam Schedule",
      "icon": AppAssets.examscheduleIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.examschedulepage);
      }
    },
    {
      "title": "Report Card",
      "icon": AppAssets.reportcardIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.reportcardpage);
      }
    },
    {
      "title": "Evaluation",
      "icon": AppAssets.evaluationIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.evaluationpage);
      }
    },
    {
      "title": "Teachers",
      "icon": AppAssets.teacherIcon,
      "ontap": () {
        Get.toNamed(AppRoutes.teacherspage);
      }
    },
    {
      "title": "BAC certificate",
      "icon": AppAssets.bacCertificateIcon,
      "ontap": () {}
    },
    {"title": "Deplome", "icon": AppAssets.deplomIcon, "ontap": () {}},
    {
      "title": "Medical Certificate",
      "icon": AppAssets.medeicalCertificateIcon,
      "ontap": () {}
    },
  ];
}
