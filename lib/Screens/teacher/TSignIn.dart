import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Screens/student/StudentHome.dart';
import 'package:college_app/Screens/student/StudentRegistration.dart';
import 'package:college_app/Screens/teacher/THome.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TSignIn extends StatefulWidget {
  const TSignIn({super.key});

  @override
  State<TSignIn> createState() => _SignInState();
}

class _SignInState extends State<TSignIn> {
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/back1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20).r,
            child: Form(
              key: formKey,
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
                      controller: username, // controller.........
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                      },
                      cursorColor: customBlack,
                      decoration: const InputDecoration(
                          hintText: "Email Address",
                          focusedBorder: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: password, // controller.........
                      
                      obscureText: true,
                      cursorColor: customBlack,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          focusedBorder: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                        btnname: "Login",
                        click: () {
                        validateLogin();
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
          ),
        ],
      ),
    );
  }
  void validateLogin() async {
    final String enteredEmail = username.text;
    final String enteredPassword = password.text;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('teachers')
          .where('email', isEqualTo: enteredEmail)
          .where('password', isEqualTo: enteredPassword)
          .where('status', isEqualTo: 'accepted') // Check for 'accepted' status
    .get();
    print(querySnapshot.docs);

      if (querySnapshot.docs.isNotEmpty) {
        
        String docId = querySnapshot.docs.first.id; // Get the Document ID

        // Store Document ID in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('teacherId', docId);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => THome()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Credentials'),
              content: Text('Please enter valid email and password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
