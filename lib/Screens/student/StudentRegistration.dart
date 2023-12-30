import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final name = TextEditingController();
  final departmnet = TextEditingController();
  final registerno = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: "Registration",
            size: 18.sp,
            fontWeight: FontWeight.w500,
            color: customBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 60).r,
                child: const AppText(
                    text: "Name",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: customBlack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                child: TextFormField(
                  controller: name, // controller.........
                  validator: (value) {
                    if (value != null || value == null) {
                      // validator.....
                      return "Enter your name";
                    }
                    return null;
                  }, // controller........
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r,
                          borderSide: const BorderSide(color: maincolor))),
                ),
              ),
              const AppText(
                  text: "Department",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                child: TextFormField(
                  controller: departmnet,
                  validator: (value) {
                    if (value != null || value == null) {
                      // validator.....
                      return "Enter your department";
                    }
                    return null;
                  }, // controller........
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r,
                          borderSide: const BorderSide(color: maincolor))),
                ),
              ),
              const AppText(
                  text: "Register No",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                child: TextFormField(
                  controller: registerno, // controller........
                  validator: (value) {
                    if (value != null || value == null) {
                      // validator.....
                      return "Enter your Register no";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r,
                          borderSide: const BorderSide(color: maincolor))),
                ),
              ),
              const AppText(
                  text: "Phone No",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                child: TextFormField(
                  controller: phone, // controller........
                  validator: (value) {
                    if (value?.length != 10) {
                      // validation............
                      return 'Please enter mobile number'; // validator.........
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r,
                          borderSide: const BorderSide(color: maincolor))),
                ),
              ),
              const AppText(
                  text: "Email",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                child: TextFormField(
                  controller: email, // controller........
                  validator: (value) {
                    // validator.........
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r,
                          borderSide: const BorderSide(color: maincolor))),
                ),
              ),
              const AppText(
                  text: "Password",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: customBlack),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                child: TextFormField(
                  controller: password,
                  obscureText: true, // controller........
                  validator: (value) {
                    if (value?.length != 6) {
                      return "Enter  atleast 6 character";
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6).r,
                          borderSide: const BorderSide(color: maincolor))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50).r,
                child: CustomButton(
                    btnname: "Submit",
                    click: () {
                      formkey.currentState!.validate();
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
