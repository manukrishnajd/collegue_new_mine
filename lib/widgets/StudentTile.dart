import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    super.key,
    required this.img,
    required this.name,
    required this.department,
  });
  final String img;
  final String name;
  final String department;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: Image.asset(
            img,
            fit: BoxFit.fill,
          ),
        ),
        title: AppText(
            text: name,
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack),
        subtitle: AppText(
            text: department,
            size: 12,
            fontWeight: FontWeight.w400,
            color: customBlack),
        tileColor: tileColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6).r),
      ),
    );
  }
}
