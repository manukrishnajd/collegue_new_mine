import 'package:college_app/widgets/EventTile.dart';

import 'package:flutter/material.dart';

class PreviousEvent extends StatelessWidget {
  const PreviousEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const EventTile(title: "Onam Festival"),
      itemCount: 2,
    );
  }
}
