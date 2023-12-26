import 'package:college_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Text(
          "ColleagueApp",
          style: GoogleFonts.kadwa(
              fontSize: 40.sp, fontWeight: FontWeight.w700, color: customWhite),
        ),
      ),
    );
  }
}
