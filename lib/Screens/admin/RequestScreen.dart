import 'package:college_app/Screens/admin/StudentDetails.dart';
import 'package:college_app/Screens/admin/TeachersDetails.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/EventRequestTile.dart';
import 'package:college_app/widgets/TeacherTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 180).r,
            child: TabBar(
              tabs: [
                Text(
                  "Teacher",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                Text(
                  "Event",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                )
              ],
              labelColor: maincolor,
              indicatorColor: maincolor,
              unselectedLabelColor: customBlack,
              dividerColor: Colors.transparent,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Expanded(
              child: TabBarView(children: [TeacherList(), EventList()]))
        ]),
      ),
    );
  }
}

//Teacher List.................
class TeacherList extends StatelessWidget {
  const TeacherList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => TeacherTile(
            image: "assets/teac.png",
            name: "Teacher Name",
            department: "department",
            cancel: () {}, // Cancel button function....
            accept: () {}), // accept button function....
        itemCount: 4,
      ),
    );
  }
}

//Event List.................
class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Container(
              height: 37.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6).r,
                color: Colors.blue.shade50,
              ),
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6).r, color: maincolor),
                tabs: [
                  Text("Students",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  Text("Teacher",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500))
                ],
                labelColor: customWhite,
                unselectedLabelColor: customBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Expanded(
              child: TabBarView(
                  children: [StudentRequestList(), TeacherRequestList()]))
        ]),
      ),
    );
  }
}

//Student Event Request List................
class StudentRequestList extends StatelessWidget {
  const StudentRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => EventRequestTile(
            image: "assets/teac.png",
            requestText: "Adhil requests Food Festival",
            click: () {
              // goto Student RequstScreen.................
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentDetails(),
                  ));
            }),
        itemCount: 2,
      ),
    );
  }
}

//Student Event Request List................
class TeacherRequestList extends StatelessWidget {
  const TeacherRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => EventRequestTile(
            image: "assets/teac.png",
            requestText: "Anandu requests Food Festival",
            click: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    // goto Student RequstScreen.................
                    builder: (context) => const TeacherDetails(),
                  ));
            }),
        itemCount: 3,
      ),
    );
  }
}
