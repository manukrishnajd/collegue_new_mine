import 'package:college_app/Screens/admin/AddNotification.dart';
import 'package:college_app/Screens/admin/Addevent.dart';
import 'package:college_app/Screens/admin/AdminHome.dart';
import 'package:college_app/Screens/admin/EventDetails.dart';
import 'package:college_app/Screens/admin/Notification.dart';
import 'package:college_app/Screens/admin/RequestScreen.dart';
import 'package:college_app/Screens/admin/StudentDetails.dart';
import 'package:college_app/Screens/admin/TeachersDetails.dart';
import 'package:college_app/Screens/admin/adminLogin.dart';
import 'package:college_app/Screens/splashScreen.dart';
import 'package:college_app/Screens/student/AddPhoto.dart';
import 'package:college_app/Screens/student/DetailsPhoto.dart';
import 'package:college_app/Screens/student/EventRegistration.dart';
import 'package:college_app/Screens/student/EventRequest.dart';
import 'package:college_app/Screens/student/RequestEvent.dart';
import 'package:college_app/Screens/student/SignIn.dart';
import 'package:college_app/Screens/student/StudentHome.dart';
import 'package:college_app/Screens/student/StudentNotification.dart';
import 'package:college_app/Screens/student/StudentProfile.dart';
import 'package:college_app/Screens/student/StudentRegistration.dart';
import 'package:college_app/Screens/student/Success.dart';
import 'package:college_app/Screens/teacher/TAddEvent.dart';
import 'package:college_app/Screens/teacher/TEvent.dart';
import 'package:college_app/Screens/teacher/TEventDetails.dart';
import 'package:college_app/Screens/teacher/TEventPhoto.dart';
import 'package:college_app/Screens/teacher/THome.dart';
import 'package:college_app/Screens/teacher/TNotification.dart';
import 'package:college_app/Screens/teacher/TProfile.dart';
import 'package:college_app/Screens/teacher/TRegistration.dart';
import 'package:college_app/Screens/teacher/TSignIn.dart';
import 'package:college_app/Screens/teacher/TStudentDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey:"AIzaSyA9PvRxW3eUnYlI0Z7f8hyP9PyYM-DTVJY",
        appId: "1:237434890689:android:0e00ea111e4033887ce740",
        messagingSenderId: "237434890689",
        projectId: "college-app-769d1")


  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme:
                const AppBarTheme(color: Colors.transparent, elevation: 0),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          home: Splash()),
      designSize: Size(390, 844),
    );
  }
}
