import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TStudentDetails extends StatelessWidget {
  const TStudentDetails({super.key});

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
            text: "Student details",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30).r,
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: customWhite,
                      backgroundImage: const AssetImage("assets/user.png"),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20).r,
                  child: AppText(
                      text: "Adhil",
                      size: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: customBlack),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                            left: 50, right: 30, top: 40, bottom: 80)
                        .r,
                    child: const EventDet(
                        regno: "regno",
                        dipartment: "dipartment",
                        phone: "phone",
                        email: "email")),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(btnname: "Accept", click: () {})),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(child: CustomButton(btnname: "Reject", click: () {}))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Student Details model.............................................
class EventDet extends StatelessWidget {
  const EventDet({
    super.key,
    required this.regno,
    required this.dipartment,
    required this.phone,
    required this.email,
  });
  final String regno;
  final String dipartment;
  final String phone;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          const AppText(
              text: "Register No",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Center(child: Text(":")),
          AppText(
              text: regno,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
        const TableRow(children: [
          SizedBox(height: 20), //SizeBox Widget
          SizedBox(height: 20),
          SizedBox(height: 20),
        ]),
        TableRow(children: [
          const AppText(
              text: "Department",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Center(child: Text(':')),
          AppText(
              text: dipartment,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
        const TableRow(children: [
          SizedBox(height: 20), //SizeBox Widget
          SizedBox(height: 20),
          SizedBox(height: 20),
        ]),
        TableRow(children: [
          const AppText(
              text: "Phone No",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Center(child: Text(':')),
          AppText(
              text: phone,
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack)
        ]),
        const TableRow(children: [
          SizedBox(height: 20), //SizeBox Widget
          SizedBox(height: 20),
          SizedBox(height: 20),
        ]),
        TableRow(children: [
          const AppText(
              text: "Email",
              size: 14,
              fontWeight: FontWeight.w400,
              color: customBlack),
          const Center(child: Text(':')),
          AppText(
              text: email,
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
