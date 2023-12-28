import 'package:college_app/Screens/admin/AddNotification.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/NotificationCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
            text: "Notification",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
          child: Stack(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => NotifiactionCard(
                  heading: "onam",
                  contents:
                      "We are delighted to announce the upcoming Onam Program, a celebration of joy, culture, and togetherness! The college principal has approved the event, and we can't wait to make it a memorable occasion for all. ",
                  delete: () {}, //delete icon  function.................
                ),
                itemCount: 2,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        DialogRoute(
                          context: context,
                          builder: (context) => AddNotification(),
                        ));
                  }, // Notification Add Function...........
                  shape: const CircleBorder(),
                  backgroundColor: maincolor,
                  child: const Icon(
                    Icons.add,
                    color: customWhite,
                    size: 50,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
