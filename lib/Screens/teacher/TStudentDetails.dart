import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:college_app/widgets/DetailsCard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TStudentDetails extends StatelessWidget {
  const TStudentDetails({super.key});

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
            text: "Student details",
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
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30).r,
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: customWhite,
                      backgroundImage: const AssetImage("assets/user.png"),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20).r,
                  child: AppText(
                      text: "Adhil",
                      size: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: customBlack),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                            left: 50, right: 30, top: 40, bottom: 80)
                        .r,
                    child: const StudDet(
                        regno: "regno",
                        dipartment: "dipartment",
                        phone: "phone",
                        email: "email")),
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
