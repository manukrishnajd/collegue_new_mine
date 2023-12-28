import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:college_app/widgets/StudentTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  List<String> droplist = [];
  String? selectedvalue;

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
            text: "Event details",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20.h,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: AppText(
                  text: "Food Festival",
                  size: 15,
                  fontWeight: FontWeight.w500,
                  color: maincolor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
              child: const EventDet(
                  date: "12-12-2024",
                  time: "10.00 Am",
                  date2: "25-12-2023",
                  location: "College Ground"),
            ),
            const AppText(
                text: "Description",
                size: 15,
                fontWeight: FontWeight.w400,
                color: customBlack),
            SizedBox(
              height: 20.h,
            ),
            const AppText(
                text:
                    "traditional genres such as folk and classical music,  music festival can be defined as a community event, with performances of singing and instrument playing, that is often presented with a theme such as a music genre ",
                size: 12,
                fontWeight: FontWeight.w400,
                color: customBlack),
            SizedBox(
              height: 20.h,
            ),
            const AppText(
                text: "Host",
                size: 15,
                fontWeight: FontWeight.w500,
                color: maincolor),
            SizedBox(
              height: 10.h,
            ),
            const StudentTile(
                // StudentDetails Custom Tile...................
                img: "assets/teac.png",
                name: "Name",
                department: "department"),
            SizedBox(
              height: 20.h,
            ),
            const AppText(
                text: "Add Host",
                size: 15,
                fontWeight: FontWeight.w500,
                color: maincolor),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              color: Colors.grey[200],
              child: DropdownButton<String>(
                isExpanded: true,
                elevation: 0,
                underline: const SizedBox(),
                value: selectedvalue,
                items: droplist.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (newvalue) {
                  setState(() {
                    selectedvalue = newvalue;
                  });
                },
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
                btnname: "Add Host",
                click: () {}), // adhost function................
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
                btnname: "Conform",
                click: () {}), // conform function...................
            SizedBox(
              height: 20.h,
            )
          ]),
        ),
      ),
    );
  }
}

// event details Custom Model...............................
class EventDet extends StatelessWidget {
  const EventDet({
    super.key,
    required this.date,
    required this.time,
    required this.date2,
    required this.location,
  });
  final String date;
  final String time;
  final String date2;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          const AppText(
              text: "Dtae",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Text(":"),
          AppText(
              text: date,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
        const TableRow(children: [
          SizedBox(height: 15), //SizeBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
              text: "Time",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Text(':'),
          AppText(
              text: time,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
        const TableRow(children: [
          SizedBox(height: 15), //SizeBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
              text: "Date",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Text(':'),
          AppText(
              text: date2,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
        const TableRow(children: [
          SizedBox(height: 15), //SizeBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
              text: "Location",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Text(':'),
          AppText(
              text: location,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
      ],
      columnWidths: const {
        0: FlexColumnWidth(4),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(5),
      },
    );
  }
}
