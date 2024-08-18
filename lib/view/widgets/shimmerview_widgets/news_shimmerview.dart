import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmerView extends StatelessWidget {
  const NewsShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 192, 192, 192).withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 0)
          ]),
      child: Column(
        children: [
          ...List.generate(
              3,
              (index) => SizedBox(
                    width: 400.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: 400,
                          height: 80,
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 120,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
        ],
      ),
    );
  }
}
