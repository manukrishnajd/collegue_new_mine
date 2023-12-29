import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/EventTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TEvent extends StatelessWidget {
  const TEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 150, top: 50).r,
            child: TabBar(
              tabs: [
                Text(
                  "Upcoming",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                Text(
                  "Previous",
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
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) => EventTile(
                title: "food festival",
                click: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => EventRegistration(),
                  //     ));
                }),
            itemCount: 2,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10).r,
              child: FloatingActionButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => EventRequest(),
                  //     ));
                }, // Event Add Function...........
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
      ),
    );
  }
}

//Previous EventList .................
class RequstList extends StatelessWidget {
  const RequstList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => EventTile(
            title: "food festival",
            click: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => EventRegistration(),
              //     ));
            }),
        itemCount: 2,
      ),
    );
  }
}
