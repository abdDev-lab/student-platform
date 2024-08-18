import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/constant/appAssets.dart';
import 'package:progres/core/constant/appColors.dart';
import 'package:progres/view/widgets/shimmerview_widgets/events_shimmerview.dart';
import 'package:progres/view/widgets/shimmerview_widgets/news_shimmerview.dart';
import 'package:progres/view/widgets/shimmerview_widgets/notify_shimmerview.dart';

class HandlingDataForPages extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String page;
  const HandlingDataForPages(
      {super.key,
      required this.statusRequest,
      required this.widget,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: AppColors.primaryColor,
              size: 50,
            ),
          )
        : statusRequest == StatusRequest.nodata
            ? Center(
                child: Lottie.asset(AppAssets.nodata),
              )
            : statusRequest == StatusRequest.offline
                ? const Center(
                    child: Icon(
                      CupertinoIcons.wifi_slash,
                      size: 50,
                    ),
                  )
                : statusRequest == StatusRequest.serveroffline
                    ? Center(
                        child: Lottie.asset(AppAssets.serverfailure),
                      )
                    : widget;
  }
}

class HandlingDataForScreen extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String page;
  const HandlingDataForScreen(
      {super.key,
      required this.statusRequest,
      required this.widget,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.primaryColor,
                    size: 50,
                  ),
                )
              ],
            ),
          )
        : statusRequest == StatusRequest.nodata
            ? SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Center(
                      child: Lottie.asset(AppAssets.nodata, height: 80),
                    ),
                  ],
                ),
              )
            : statusRequest == StatusRequest.offline
                ? const SizedBox(
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(
                            CupertinoIcons.wifi_slash,
                            size: 80,
                          ),
                        ),
                      ],
                    ),
                  )
                : statusRequest == StatusRequest.serveroffline
                    ? SizedBox(
                        height: 500,
                        child: Column(
                          children: [
                            Center(
                              child: Lottie.asset(AppAssets.serverfailure),
                            ),
                          ],
                        ),
                      )
                    : widget;
  }
}

class HandlingDataForWidgets extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataForWidgets(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            margin: const EdgeInsets.only(top: 100),
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: 50,
              ),
            ),
          )
        : statusRequest == StatusRequest.nodata
            ? Center(
                child: Lottie.asset(AppAssets.nodata),
              )
            : widget;
  }
}

class HandlingDataWithShimmerViewForNews extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataWithShimmerViewForNews(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const NewsShimmerView()
        : statusRequest == StatusRequest.nodata
            ? Center(
                child: Lottie.asset(AppAssets.nodata, height: 50),
              )
            : statusRequest == StatusRequest.offline
                ? const Center(
                    child: Icon(
                      CupertinoIcons.wifi_slash,
                      size: 50,
                    ),
                  )
                : widget;
  }
}

class HandlingDataWithShimmerViewForEvents extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataWithShimmerViewForEvents(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const EventsShimmerView()
        : statusRequest == StatusRequest.nodata
            ? Center(
                child: Lottie.asset(AppAssets.nodata, height: 50),
              )
            : statusRequest == StatusRequest.offline
                ? const Center(
                    child: Icon(
                      CupertinoIcons.wifi_slash,
                      size: 50,
                    ),
                  )
                : widget;
  }
}

class HandlingDataWithShimmerViewForNotif extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataWithShimmerViewForNotif(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const NotfiyShimmerView()
        : statusRequest == StatusRequest.nodata
            ? Center(
                child: Lottie.asset(AppAssets.nodata, height: 50),
              )
            : statusRequest == StatusRequest.offline
                ? const Center(
                    child: Icon(
                      CupertinoIcons.wifi_slash,
                      size: 50,
                    ),
                  )
                : widget;
  }
}
