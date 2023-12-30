import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/DetailsCard.dart';
import 'package:college_app/widgets/StudentTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestEvent extends StatelessWidget {
  const RequestEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: InkWell(
            onTap: () {
              Navigator.pop(context); // back arrow Function...........
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBlack,
            ),
          ),
        ),
        title: AppText(
            text: "Details",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30).r,
              child: Image.asset(
                "assets/stu.png",
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppText(
                  text: "Adhil",
                  size: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 50, right: 30, top: 30).r,
                child: DetailsCard(
                    department: "Bcom",
                    event: "food fest",
                    date: "10/12/2023",
                    time: "10.00 am",
                    place: "college ground")),
            SizedBox(
              height: 40.h,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Host",
                  size: 15,
                  fontWeight: FontWeight.w500,
                  color: maincolor),
            ),
            SizedBox(
              height: 10.h,
            ),
            StudentTile(
              img: "assets/teac.png",
              name: "Host",
              department: "department",
              click: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Description :",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text:
                      "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.",
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
            ),
          ]),
        ),
      ),
    );
  }
}
