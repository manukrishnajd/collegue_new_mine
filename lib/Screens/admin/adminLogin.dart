import 'package:college_app/Screens/admin/AdminHome.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customWhite,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 340.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                  color: Colors.blue.shade50),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: "Login",
                        size: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: maincolor),
                    TextFormField(
                      controller: username, // controller..........
                      decoration: const InputDecoration(
                          hintText: "Username",
                          prefixIcon:
                              Icon(Icons.people_alt, color: Colors.grey)),
                    ),
                    TextFormField(
                      controller: password, // controller..........
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock, color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      btnname: "Login",
                      click: () {
                        // Login Function..................
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHome(),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
