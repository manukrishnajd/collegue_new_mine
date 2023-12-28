import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotification extends StatelessWidget {
  AddNotification({super.key});
  final eventname = TextEditingController();
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customWhite,
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
            text: "Add Notification",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25).r,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: "Event Name",
                        size: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: eventname, // controller........
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 15.h),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6).r),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6).r,
                              borderSide: const BorderSide(color: maincolor))),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppText(
                        text: "Description",
                        size: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: description, // controller........
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6).r),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6).r,
                              borderSide: const BorderSide(color: maincolor))),
                    ),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  btnname: "Send",
                  click: () {
                    // //send function.........
                  }),
            )
          ],
        ),
      ),
    );
  }
}
