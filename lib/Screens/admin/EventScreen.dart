import 'package:college_app/Screens/admin/Addevent.dart';
import 'package:college_app/Screens/admin/EventDetails.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/EventCard.dart';
import 'package:college_app/widgets/EventUpcomingTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 150).r,
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
              child: TabBarView(
                  children: [EventUpcomingList(), EventPreviousList()]))
        ]),
      ),
    );
  }
}

//Event Upcomming List..........................
class EventUpcomingList extends StatelessWidget {
  const EventUpcomingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) => EventUpcomingTila(
                title: "food festival",
                click: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EventDetails(),
                      ));
                },
                delete: () {
                  // delete Function.............
                }),
            itemCount: 2,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10).r,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEvent(),
                      ));
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

//Event Previous List..........................
class EventPreviousList extends StatelessWidget {
  const EventPreviousList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const EventCard(
          heading: "Onam Festival",
          date: "08/28/2023",
          time: "9:00 AM",
          location: "College Hall"),
      itemCount: 4,
    );
  }
}
