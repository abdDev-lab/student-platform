import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventsShimmerView extends StatelessWidget {
  const EventsShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 192, 192, 192).withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0)
          ]),
      width: 220,
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 70,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
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
                )),
                const SizedBox(
                  width: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
