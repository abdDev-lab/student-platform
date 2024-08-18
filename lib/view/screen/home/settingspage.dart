import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progres/controller/home/settingspage_controller.dart';
import 'package:progres/view/widgets/homepage_widgets/costum_listTile.dart';
import 'package:progres/view/widgets/settingspage_widgets/costum_listTileSettings.dart';
import 'package:progres/view/widgets/settingspage_widgets/costum_profilecard.dart';
import 'package:uicons/uicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsPageController());
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: GetBuilder<SettingsPageController>(
          builder: (controller) => ListView(
            physics: controller.viewprofile
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            children: [
              CostumProfileCardSettings(
                image:
                    controller.myServices.sharedPreferences.getString("image")!,
                name:
                    "${controller.myServices.sharedPreferences.getString("firstname")} ${controller.myServices.sharedPreferences.getString("lastname")}",
                faculty:
                    "${controller.myServices.sharedPreferences.getString("facultyname")}",
                specialty:
                    "${controller.myServices.sharedPreferences.getString("specialtyname")}",
                univname:
                    "${controller.myServices.sharedPreferences.getString("univname")}",
                year:
                    "${controller.myServices.sharedPreferences.getString("year")}",
                id: controller.myServices.sharedPreferences.getInt("id")!,
                group: controller.myServices.sharedPreferences.getInt("group")!,
                univlog: controller.myServices.sharedPreferences
                    .getString("univlogo")!,
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    CostumListTileSettings(
                        title: "Dark Mode",
                        icon: UIcons.regularStraight.moon,
                        value: controller.darkmode,
                        onToggle: (value) {
                          controller.onToggleDarkMode(value);
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    ...List.generate(
                        controller.settingbuttons.length,
                        (index) => Column(
                              children: [
                                CostumListTile(
                                  title: controller.settingbuttons[index]
                                      ["title"],
                                  icon: controller.settingbuttons[index]
                                      ["icon"],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
