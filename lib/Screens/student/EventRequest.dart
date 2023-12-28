import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventRequest extends StatelessWidget {
  EventRequest({super.key});

  final eventname = TextEditingController();
  final name = TextEditingController();
  final department = TextEditingController();
  final phone = TextEditingController();
  final description = TextEditingController();

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
            text: "Event Request",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25).r,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                        text: "Request Event",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                      child: TextFormField(
                        controller: eventname, // controller........
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r,
                                borderSide:
                                    const BorderSide(color: maincolor))),
                      ),
                    ),
                    const AppText(
                        text: "Name",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                      child: TextFormField(
                        controller: name, // controller........
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r,
                                borderSide:
                                    const BorderSide(color: maincolor))),
                      ),
                    ),
                    const AppText(
                        text: "Department",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                      child: TextFormField(
                        controller: department, // controller........
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r,
                                borderSide:
                                    const BorderSide(color: maincolor))),
                      ),
                    ),
                    const AppText(
                        text: "Phone No",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                      child: TextFormField(
                        controller: phone, // controller........
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r,
                                borderSide:
                                    const BorderSide(color: maincolor))),
                      ),
                    ),
                    const AppText(
                        text: "Description",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: customBlack),
                    Padding(
                      padding: const EdgeInsets.only(top: 5).r,
                      child: TextFormField(
                        controller: description, // controller........
                        maxLines: 4,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6).r,
                                borderSide:
                                    const BorderSide(color: maincolor))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                CustomButton(btnname: "Submit", click: () {})
              ]),
        ),
      ),
    );
  }
}
