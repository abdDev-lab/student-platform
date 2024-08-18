import 'package:get/get.dart';
import 'package:progres/core/constant/appRoutes.dart';
import 'package:progres/core/middleware/appMiddleware.dart';
import 'package:progres/view/screen/addtaskpage.dart';
import 'package:progres/view/screen/auth/loginpage.dart';
import 'package:progres/view/screen/home/homescreen.dart';
import 'package:progres/view/screen/home/studentcardpage.dart';
import 'package:progres/view/screen/menu/evaluationpage.dart';
import 'package:progres/view/screen/menu/examshedulepage.dart';
import 'package:progres/view/screen/menu/reportcardPage.dart';
import 'package:progres/view/screen/menu/teacherspage.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: "/", page: () => const LoginPage(), middlewares: [AppMiddleware()]),
  GetPage(name: AppRoutes.homescreen, page: () => const HomeScreen()),
  GetPage(
      name: AppRoutes.addtaskpage,
      page: () => const AddTaskPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.teacherspage,
      page: () => const TeachersPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.evaluationpage,
      page: () => const EvaluationPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.reportcardpage,
      page: () => const ReportCardPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.examschedulepage,
      page: () => const ExamSchedulePage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.studentcardpage,
      page: () => const StudentCardPage(),
      transition: Transition.cupertino),
];
