import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:college_app/widgets/DetailsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherDetails extends StatelessWidget {
  const TeacherDetails({super.key});

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
            text: "Teachers details",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          text: "Anandu",
                          size: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: customBlack),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 50)
                                .r,
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
                    SizedBox(
                      height: 100.h,
                    ),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(btnname: "Accept", click: () {})),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(child: CustomButton(btnname: "Reject", click: () {}))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
