import 'package:college_app/Screens/student/DetailsPhoto.dart';
import 'package:college_app/widgets/EventTile.dart';

import 'package:flutter/material.dart';

class PreviousEvent extends StatelessWidget {
  const PreviousEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => EventTile(
        title: "Onam Festival",
        click: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPhoto(),
              ));
        },
      ),
      itemCount: 2,
    );
  }
}
