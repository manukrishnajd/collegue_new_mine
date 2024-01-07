import 'package:cloud_firestore/cloud_firestore.dart';
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addToFirestore() async {
    try {
      await _firestore.collection('students').add({
        'name': name.text,
        'department': departmnet.text,
        'registerno': registerno.text, // Add if available in your form
        'phone': phone.text,
        'email': email.text,
        // You might want to consider encrypting passwords before storing them in Firestore
        // Storing passwords in plain text is not recommended for security reasons
        // For demo purposes, storing plain text password here
        'password': password.text,
        'timestamp': FieldValue.serverTimestamp(),
        'status':'pending'
      });
    } catch (e) {
      print('Error adding to Firestore: $e');
      // Handle error, maybe show an error message to the user
    }
  }

  void _submitForm() {
    if (formkey.currentState!.validate()) {
      _addToFirestore();
      // Navigate or perform any actions after adding to Firestore
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => RegSuccess(),
      //     ));
    }
  }

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
                 // controller........
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
                   // controller........
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
                    
                      click: _submitForm 
                    ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
