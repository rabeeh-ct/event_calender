import 'package:event_calender/domain/entities/event_entity.dart';
import 'package:event_calender/presentation/routes/route_constants.dart';
import 'package:event_calender/presentation/screens/calender_view_screen/calender_view_screen_controller.dart';
import 'package:event_calender/presentation/screens/event_detail_view_screen/event_detail_view_screen_controller.dart';
import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.event, required this.isFromHome,
  });

  final EventEntity event;
  final bool isFromHome;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(RouteList.eventDetailViewScreen, arguments: EventDetailViewScreenArgs(eventEntity: event, isFromHome: isFromHome))?.then(
          (value) => Get.delete<EventDetailViewScreenController>(),
        );
      },
      leading: Container(
        width: 5,
        color: primaryColor,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              event.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
          5.sBW,
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
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          ),
          Text(
            repeatModes
                .firstWhere(
                  (element) => element.id == event.repeatType,
                )
                .title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          )
        ],
      ),
    );
  }
}
