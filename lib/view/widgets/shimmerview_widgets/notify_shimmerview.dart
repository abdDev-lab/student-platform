import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotfiyShimmerView extends StatelessWidget {
  const NotfiyShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 192, 192, 192)
                          .withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 0)
                ]),
            child: Shimmer.fromColors(
              period: const Duration(seconds: 2),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                children: [
                  Column(
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
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}