import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/EventRequestTile.dart';
import 'package:college_app/widgets/TeacherTile.dart';
import 'package:college_app/Screens/admin/StudentDetails.dart';
import 'package:college_app/Screens/admin/TeachersDetails.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  late Future<List<Map<String, dynamic>>> teacherDataFuture;

  @override
  void initState() {
    super.initState();
    teacherDataFuture = fetchTeacherdata();
  }

  Future<void> updateTeacherStatus(String teacherId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(teacherId)
          .update({'status': newStatus});

      // Fetch updated data after status update
      setState(() {
        teacherDataFuture = fetchTeacherdata();
      });
    } catch (e) {
      print("Error updating status: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchTeacherdata() async {
    try {
      QuerySnapshot<Map<String, dynamic>> teachersQuery =
          await FirebaseFirestore.instance.collection('teachers').get();

      List<Map<String, dynamic>> teacherData = [];

      teachersQuery.docs.forEach((doc) {
        Map<String, dynamic> teacher = doc.data();
        teacher['id'] = doc.id; // Include the document ID in the student data
        teacherData.add(teacher);
      });

      return teacherData;
    } catch (e) {
      print("Error fetching students: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchTeacherdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          // Display data fetched from Firestore
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> teacher = snapshot.data![index];
              return TeacherTile(
                image: teacher['image'] ?? "assets/teac.png",
                name: teacher['name'] ?? "Teacher Name",
                department: teacher['department'] ?? "department",
                status: teacher['status'] ?? "status",
                cancel: () {
                  updateTeacherStatus(teacher['id'], 'rejected');
                  fetchTeacherdata();

                },
                accept: () {
                  updateTeacherStatus(teacher['id'], 'accepted');
                  fetchTeacherdata();
                },
              );
            },
          );
        }
      },
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Container(
                height: 37.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                  color: Colors.blue.shade50,
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6).r,
                    color: maincolor,
                  ),
                  tabs: [
                    Text(
                      "Students",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Teacher",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  labelColor: customWhite,
                  unselectedLabelColor: customBlack,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            const Expanded(
              child: TabBarView(
                children: [
                  StudentRequestList(),
                  TeacherRequestList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentRequestList extends StatelessWidget {
  const StudentRequestList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => EventRequestTile(
          image: "assets/teac.png",
          requestText: "Adhil requests Food Festival",
          click: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentDetails(),
              ),
            );
          },
        ),
        itemCount: 2,
      ),
    );
  }
}

class TeacherRequestList extends StatelessWidget {
  const TeacherRequestList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => EventRequestTile(
          image: "assets/teac.png",
          requestText: "Anandu requests Food Festival",
          click: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherDetails(),
              ),
            );
          },
        ),
        itemCount: 3,
      ),
    );
  }
}
