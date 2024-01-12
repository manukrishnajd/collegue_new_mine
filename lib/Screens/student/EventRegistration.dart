import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:college_app/widgets/EventCard.dart';
import 'package:college_app/widgets/StudentTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventRegistration extends StatelessWidget {
  final String eventId;

  const EventRegistration({Key? key, required this.eventId}) : super(key: key);
 Future<void> registerForEvent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String studentId = prefs.getString('studentId') ?? ''; // Get studentId from shared preferences
    DateTime now = DateTime.now();

    // Add data to Firestore in the 'EventRegistration' collection
    await FirebaseFirestore.instance.collection('EventRegistration').add({
      'studentId': studentId,
      'eventId': eventId,
      'registrationDate': Timestamp.fromDate(now),
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBlack,
            ),
          ),
        ),
        title: AppText(
          text: 'Details',
          size: 18,
          fontWeight: FontWeight.w500,
          color: customBlack,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('events').doc(eventId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Event not found'));
          } else {
            final eventData = snapshot.data!.data() as Map<String, dynamic>;
            return buildEventDetails(eventData);
          }
        },
      ),
    );
  }


  Widget buildEventDetails( Map<String, dynamic> eventData) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventCard(
            heading: eventData['eventName'] ?? 'Event Name',
            date: eventData['date'] ?? 'Event Date',
            time: eventData['time'] ?? 'Event Time',
            location: eventData['location'] ?? 'Event Location',
            eventId: '',
            
          ),
          const SizedBox(height: 40),
          const AppText(
            text: 'Participants',
            size: 15,
            fontWeight: FontWeight.w500,
            color: customBlack,
          ),
          Expanded(
  child: FutureBuilder<List<DocumentSnapshot>>(
    future: _fetchStudentData(eventId),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Center(child: Text('No participants registered yet'));
      } else {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final studentData = snapshot.data![index].data() as Map<String, dynamic>;
            return StudentTile(
              img: studentData['profileImage'] ?? '',
              name: studentData['name'] ?? "Name",
              department: studentData['department'] ?? "Department",
              studentId: '',
              click: () {
                // Add click functionality if needed
              },
              eventId: '',
            );
          },
        );
      }
    },
  ),
)
,
          CustomButton(
            btnname: 'Register',
            click: () {
              registerForEvent();
            }, // Update the 'click' action as needed
          ),
        ],
      ),
    );
  }

 Future<List<DocumentSnapshot>> _fetchStudentData(String eventId) async {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('EventRegistration')
      .where('eventId', isEqualTo: eventId)
      .get();
      List<String> studentIds = querySnapshot.docs
      .map((doc) => doc['studentId'].toString()) // Get studentId field from EventRegistration docs
      .toList();
print(studentIds);

   // Assuming combined IDs are stored in 'EventRegistration'
  final studentSnapshots = await FirebaseFirestore.instance
      .collection('students')
      .where(FieldPath.documentId, whereIn: studentIds)
      .get();
print(studentSnapshots.docs);
  return studentSnapshots.docs;
}
}