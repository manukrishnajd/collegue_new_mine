import 'package:college_app/Screens/student/SignIn.dart';
import 'package:college_app/Screens/teacher/THome.dart';
import 'package:college_app/Screens/teacher/TRegistration.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TSignIn extends StatefulWidget {
  const TSignIn({super.key});

  @override
  State<TSignIn> createState() => _TSignInState();
}

class _TSignInState extends State<TSignIn> {
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = "";
  String _password = "";


  void _handleLogIn() async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email:_email, password: _password);
      print("user loggedin : ${userCredential.user?.email}");
    }catch(e){
      print("error during registeration : $e");
    }
  }


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
                      controller: username,
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
                      controller: password,
                      validator: (value) {
                        if (value != null) return " enter password";
                      },
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
                          // formKey.currentState!.validate(); // Login.............................................
                       //   if (formKey.currentState!.validate()) {
                                _handleLogIn();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const THome()),
                            // );

                       //   }
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
                                      TRegistration(), // Sign up...............................
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
}
