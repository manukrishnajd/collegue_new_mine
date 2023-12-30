import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/EventCard.dart';
import 'package:college_app/widgets/StudentTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TEventPhoto extends StatelessWidget {
  const TEventPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                text: "Details",
                size: 18.sp,
                fontWeight: FontWeight.w500,
                color: customBlack),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 240, top: 20).r,
                child: TabBar(
                  tabs: [
                    Text(
                      "Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                    Text(
                      "Photo",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.sp),
                    )
                  ],
                  labelColor: maincolor,
                  indicatorColor: maincolor,
                  unselectedLabelColor: customBlack,
                  dividerColor: Colors.transparent,
                ),
              ),
              const Expanded(
                  child: TabBarView(children: [PrevDetails(), PhotoList()])),
            ],
          )),
    );
  }
}

//Details tab Screen..............................
class PrevDetails extends StatelessWidget {
  const PrevDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const EventCard(
            heading: "heading",
            date: "date",
            time: "time",
            location: "location",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const AppText(
                text: 'participants',
                size: 15,
                fontWeight: FontWeight.w500,
                color: customBlack),
          ),
          Expanded(
            child: ListView.builder(
              //participend list.............................
              itemBuilder: (context, index) => StudentTile(
                img: "assets/teac.png",
                name: "Name",
                department: "department",
                mode: true, // if mode true cancel button will be show.....
                click: () {},
              ),
              itemCount: 3,
            ),
          )
        ]),
      ),
    );
  }
}

// photo list screen...............................
class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20).r,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Image.asset(
            "assets/onam.png",
            width: 95,
            height: 95,
          );
        },
      ),
    ));
  }
}
