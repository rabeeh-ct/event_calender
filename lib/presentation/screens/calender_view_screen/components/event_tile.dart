import 'package:event_calender/domain/entities/event_entity.dart';
import 'package:event_calender/presentation/screens/calender_view_screen/calender_view_screen_controller.dart';
import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    // required this.name,
    // required this.profession,
    // required this.time1,
    // required this.time2,
    required this.event,
  });

  final EventEntity event;

  // final String name;
  // final String profession;
  // final String time1;
  // final String time2;

  @override
  Widget build(BuildContext context) {
    final CalenderViewScreenController screenController = Get.find();
    return ListTile(
      leading: Container(
        width: 5,
        color: primaryColor,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            event.title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            event.time,
            style: const TextStyle(fontSize: 16, color: primaryColor),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat("dd MMM yyyy").format(event.date),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200),
          ),
          Text(
            screenController.repeatModes
                .firstWhere(
                  (element) => element.id == event.repeatType,
                )
                .title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200),
          )
        ],
      ),
    );
  }
}
