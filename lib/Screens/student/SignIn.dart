import 'package:college_app/Screens/student/StudentHome.dart';
import 'package:college_app/Screens/student/StudentRegistration.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/back1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20).r,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                      text: "Sign in",
                      size: 33,
                      fontWeight: FontWeight.w500,
                      color: customBlack),
                  const AppText(
                      text: "Sign into your account",
                      size: 20,
                      fontWeight: FontWeight.w400,
                      color: customBlack),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFormField(
                    cursorColor: customBlack,
                    decoration: const InputDecoration(
                        hintText: "Email Address",
                        focusedBorder: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    obscureText: true,
                    cursorColor: customBlack,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        focusedBorder: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                      btnname: "Login",
                      click: () {
                        // Login.............................................
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentHome(),
                            ));
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                          text: "Don’t have an account?",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: customBlack),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StudentRegister(), // Sign up...............................
                              ));
                        },
                        child: const AppText(
                            text: " Sign up",
                            size: 15,
                            fontWeight: FontWeight.w400,
                            color: maincolor),
                      ),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
