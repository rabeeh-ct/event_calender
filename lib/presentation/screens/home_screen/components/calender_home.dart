import 'package:event_calender/presentation/routes/route_constants.dart';
import 'package:event_calender/presentation/screens/calender_view_screen/calender_view_screen_controller.dart';
import 'package:event_calender/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/event_tile.dart';

class CalenderHome extends StatelessWidget {
  const CalenderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController screenController = Get.find();
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Calender",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          10.sBH,
          Text(
            "You have ${screenController.todayEvents.length} events today",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          10.sBH,
          InkWell(
            onTap: () {
              Get.toNamed(RouteList.calenderViewScreen)?.then((value) {
                screenController.getData(isPull: true);
                return Get.delete<CalenderViewScreenController>();
              });
            },
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat("MMM").format(DateTime.now()),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 4)),
                      Text(
                        DateFormat("dd").format(DateTime.now()),
                        style: const TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                  30.sBW,
                  const Text(
                    "T O D A Y",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                  30.sBW,
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding
                  ),
                  itemBuilder: (context, index) => EventTile(
                    isFromHome: true,
                    event: screenController.todayEvents[index],
                  ),
                  itemCount: screenController.todayEvents.length,
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
