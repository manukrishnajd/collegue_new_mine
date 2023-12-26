import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviousEventTile extends StatelessWidget {
  const PreviousEventTile({
    super.key,
    required this.heading,
    required this.date,
    required this.time,
    required this.location,
  });
  final String heading;
  final String date;
  final String time;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10).r,
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6).r,
            color: Colors.blue.shade50),
        child: Padding(
            padding: const EdgeInsets.all(10).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                    text: heading,
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: maincolor),
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            text: "Date",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: customBlack),
                        AppText(
                            text: "Time",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: customBlack),
                        AppText(
                            text: "location",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: customBlack),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText2(
                              text: ":${date}",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: customBlack),
                          AppText2(
                              text: ":${time}",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: customBlack),
                          AppText2(
                              text: ":${location}",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: customBlack),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
