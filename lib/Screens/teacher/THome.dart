import 'package:college_app/Screens/teacher/TEvent.dart';
import 'package:college_app/Screens/teacher/TNotification.dart';
import 'package:college_app/Screens/teacher/TProfile.dart';
import 'package:college_app/Screens/teacher/TStudentDetails.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/StudentTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class THome extends StatelessWidget {
  const THome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20).r,
          child: Column(children: [
            const Expanded(
                child: TabBarView(children: [StudentList(), TEvent()])),
            Container(
              // Tab bar.......................
              height: 60.h,
              decoration: BoxDecoration(
                  color: customWhite,
                  border: Border.all(color: maincolor),
                  borderRadius: BorderRadius.circular(50).r),
              child: Padding(
                padding: const EdgeInsets.all(4).r,
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: maincolor), //Change background color from here
                  tabs: [
                    Text("Students",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600)),
                    Text("Event",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600))
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: customWhite,
                  unselectedLabelColor: customBlack,
                  dividerColor: Colors.transparent,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

//StudentList................................................
class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customWhite,
        automaticallyImplyLeading: false,
        title: AppText(
            text: "Students List",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //goto profile......................................
                      builder: (context) => TProfile(),
                    ));
              },
              child: const Icon(Icons.person_2_outlined)),
          SizedBox(width: 10.w),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //goto notification......................................
                      builder: (context) => TNotification(),
                    ));
              },
              child: const Icon(Icons.notifications_active_outlined)),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => StudentTile(
          img: "assets/user.png",
          name: "name",
          department: "department",
          click: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  //goto notification......................................
                  builder: (context) => const TStudentDetails(),
                ));
          },
        ),
        itemCount: 3,
      ),
    );
  }
}
