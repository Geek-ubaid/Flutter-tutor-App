import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

Widget featuredShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 280,
          height: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getAttribute(Icons.play_circle_outlined),
                  // const SizedBox(width: 12),
                  _getAttribute(Icons.schedule_rounded),
                  // const SizedBox(width: 12),
                  _getAttribute(Icons.star),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

_getAttribute(IconData icon) {
  return Row(
    children: [
      Icon(icon, size: 18, color: Colors.white),
      const SizedBox(width: 3),
      Container(
        width: 25,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ],
  );
}

Widget dailyShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    // Row(
    //   children: [
    //     Container(
    //       width: 70,
    //       height: 70,
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     SizedBox(width: 10),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Container(
    //           width: 200,
    //           height: 20,
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(5),
    //           ),
    //         ),
    //         SizedBox(height: 5),
    //         Container(
    //           width: 25,
    //           height: 15,
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(5),
    //           ),
    //         ),
    //         SizedBox(height: 5),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Icon(Icons.label, color: Colors.white, size: 14),
    //             const SizedBox(width: 4),
    //             Container(
    //               width: 150,
    //               height: 15,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(5),
    //               ),
    //             ),
    //             const Spacer(),
    //             Icon(Icons.access_time, color: Colors.white, size: 14),
    //             const SizedBox(width: 4),
    //             Container(
    //               width: 50,
    //               height: 15,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(5),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  );
}
