import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:college_app/widgets/StudentTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetails extends StatefulWidget {
  final String eventId; // Declare eventId variable
  const EventDetails({Key? key, required this.eventId}) : super(key: key);
  

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
   List<Map<String, dynamic>> droplist = [];// Sample list for dropdown
  String? selectedvalue;
  Map<String, dynamic>? eventData;
  bool isLoading = true;
 String teacherName = '';
  String teacherDepartment = '';

  @override
  void initState() {
    super.initState();
    fetchEventDetails();
    fetchTeachersData(); 

  }

    Future<void> fetchTeachersData() async {
      
    try {
      QuerySnapshot teachersSnapshot = await FirebaseFirestore.instance
          .collection('teachers')
          .get();

       if (teachersSnapshot.docs.isNotEmpty) {
      setState(() {
         droplist = teachersSnapshot.docs
            .map((doc) => {
                  'name': doc['name'] as String,
                  'id': doc.id,
                })
            .toList();
      });
    }
    } catch (e) {
      print('Error fetching teachers data: $e');
    }
  }

 Future<void> fetchTeacherData() async {
    try {
      String hostId = eventData!['hostId'];
      print(hostId);

      QuerySnapshot teachersSnapshot = await FirebaseFirestore.instance
          .collection('teachers')
          .where(FieldPath.documentId, isEqualTo: hostId)
          .get();

      if (teachersSnapshot.docs.isNotEmpty) {
        DocumentSnapshot teacherSnapshot = teachersSnapshot.docs.first;
        setState(() {
          teacherName = teacherSnapshot['name'];
          teacherDepartment = teacherSnapshot['department'];
        });
      } else {
        print('No teacher found with the given hostId: $hostId');
      }
    } catch (e) {
      print('Error fetching teacher data: $e');
    }
  }


  Future<void> fetchEventDetails() async {
    try {
      DocumentSnapshot eventSnapshot = await FirebaseFirestore.instance
          .collection('events')
          .doc(widget.eventId)
          .get();

      if (eventSnapshot.exists) {
        setState(() {
          eventData = eventSnapshot.data() as Map<String, dynamic>;
          isLoading = false;
           fetchTeacherData();
          print(eventData);
        });
      } else {
        // Handle if the event with the provided eventId doesn't exist
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // Handle errors while fetching event details
      print('Error fetching event details: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> addHostToEvent() async {
    if (selectedvalue != null) {
    // Perform the operation to add the selected hostId to the event collection
    try {
      FirebaseFirestore.instance.collection('events').doc(widget.eventId).update({
        'hostId': selectedvalue,
      }).then((value) {
        print('Host added to event with ID: ${widget.eventId}');
      });
    } catch (e) {
      print('Error adding host to event: $e');
    }
  } else {
    print('Please select a host');
  }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context); // back arrow Function...........
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBlack,
            ),
          ),
        ),
        title: AppText(
          text: "Event details",
          size: 18.sp,
          fontWeight: FontWeight.w500,
          color: customBlack,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const Align(
                alignment: Alignment.topCenter,
                child: AppText(
                  text: "Food Festival",
                  size: 15,
                  fontWeight: FontWeight.w500,
                  color: maincolor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                child: EventDet(
                  name: eventData!['eventName'],
                  description: eventData!['description'],
                  date: eventData!['date'],
                  time: eventData!['time'],
                  status: eventData!['status'],
                  location: eventData!['location'],
                ),
              ),
              const AppText(
                text: "Description",
                size: 15,
                fontWeight: FontWeight.w400,
                color: customBlack,
              ),
              SizedBox(height: 20.h),
              AppText(
                text: eventData!['description'],
                size: 12,
                fontWeight: FontWeight.w400,
                color: customBlack,
              ),
              SizedBox(height: 20.h),
              const AppText(
                text: "Host",
                size: 15,
                fontWeight: FontWeight.w500,
                color: maincolor,
              ),
              SizedBox(height: 10.h),
              StudentTile(
                img: "assets/teac.png",
                name: teacherName,
                department: teacherDepartment,
                click: () {},
                eventId: '',
                studentId: '',
              ),
              SizedBox(height: 20.h),
              const AppText(
                text: "Add Host",
                size: 15,
                fontWeight: FontWeight.w500,
                color: maincolor,
              ),
              SizedBox(height: 10.h),
               Container(
                height: 50.h,
                color: Colors.grey[200],
                child: DropdownButton<String>(
                  isExpanded: true,
                  elevation: 0,
                  underline: const SizedBox(),
                  value: selectedvalue,
                  items: droplist.map<DropdownMenuItem<String>>((teacher) {
              return DropdownMenuItem<String>(
                value: teacher['id'] as String,
                child: Text(teacher['name'] as String),
              );
            }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      selectedvalue = newvalue;
                    });
                  },
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                btnname: "Add Host",
                click: addHostToEvent,
                
              ),
              SizedBox(height: 15.h),
              CustomButton(
                btnname: "Confirm",
                click: () {
                  // Confirm functionality
                  print("Confirm Clicked");
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class EventDet extends StatelessWidget {
  const EventDet({
    Key? key,
    required this.date,
    required this.time,
    required this.location,
    required this.name,
    required this.description,
    required this.status,
  }) : super(key: key);

  final String date;
  final String name;
  final String time;
  final String location;
  final String description;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          const AppText(
            text: "Name",
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          ),
          const Text(":"),
          AppText(
            text: name,
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          )
        ]),
        const TableRow(children: [
          SizedBox(height: 15), // SizedBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
            text: "Date",
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          ),
          const Text(":"),
          AppText(
            text: date,
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          )
        ]),
        const TableRow(children: [
          SizedBox(height: 15), // SizedBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
            text: "Time",
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          ),
          const Text(':'),
          AppText(
            text: time,
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          )
        ]),
        const TableRow(children: [
          SizedBox(height: 15), // SizedBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
            text: "Status",
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          ),
          const Text(':'),
          AppText(
            text: status,
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          )
        ]),
        const TableRow(children: [
          SizedBox(height: 15), // SizedBox Widget
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
        TableRow(children: [
          const AppText(
            text: "Location",
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          ),
          const Text(':'),
          AppText(
            text: location,
            size: 14,
            fontWeight: FontWeight.w400,
            color: customBlack,
          )
        ]),
      ],
      columnWidths: const {
        0: FlexColumnWidth(4),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(5),
      },
    );
  }
}
