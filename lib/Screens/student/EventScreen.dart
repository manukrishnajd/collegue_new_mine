import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/EventTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SRequestScreen extends StatelessWidget {
  const SRequestScreen({super.key});

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
                  "Event",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                Text(
                  "Request",
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
              child: TabBarView(children: [EventList(), RequstList()]))
        ]),
      ),
    );
  }
}

//Upcoming EventList .................
class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) =>
            const EventTile(title: "food festival"),
        itemCount: 3,
      ),
    );
  }
}

//Upcoming RequstList .................
class RequstList extends StatelessWidget {
  const RequstList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10).r,
              child: ListTile(
                title: const AppText(
                    text: "Holi festival",
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: customWhite),
                tileColor: maincolor,
                trailing: const AppText(
                    text: "Accept",
                    size: 12,
                    fontWeight: FontWeight.w500,
                    color: customWhite),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6).r),
              ),
            ),
            itemCount: 2,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10).r,
            child: FloatingActionButton(
              onPressed: () {}, // Event Add Function...........
              shape: const CircleBorder(),
              backgroundColor: maincolor,
              child: const Icon(
                Icons.add,
                color: customWhite,
                size: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
