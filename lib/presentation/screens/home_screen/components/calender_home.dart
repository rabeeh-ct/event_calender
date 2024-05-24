import 'package:event_calender/presentation/routes/route_constants.dart';
import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../calender_view_screen/calender_view_screen.dart';
import 'next_card.dart';

class CalenderHome extends StatelessWidget {
  const CalenderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Calender Name
          const Flexible(
            flex: 0,
            child: Text(
              "Calender",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),

          //Meetings
          const Flexible(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                "You have 4 meeting today",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
          ),

          Flexible(
            flex: 1,
            child: ListView(
              children: [
                //1st Card
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RouteList.calenderViewScreen);
                    },
                    hoverColor: Colors.white70,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [primaryColor, primaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 25, right: 16, top: 40, bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat("MMM").format(DateTime.now()),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 4)),
                                Text(
                                  DateFormat("dd").format(DateTime.now()),
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(left: 30)),
                            const Text(
                              "T O D A Y",
                              style: TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const NextCard(
                  time: "11:00 PM",
                  title: "Lead Meeting",
                  color: primaryColor,
                ),
                const NextCard(
                  time: "08:00 PM",
                  title: "Designer Meeting",
                  color: Colors.black,
                ),
                const NextCard(
                  time: "04:00 PM",
                  title: "Weekly Scrum",
                  color: primaryColor,
                ),
                const NextCard(
                  time: "10:00 AM",
                  title: "Daily Prayers",
                  color: Colors.black,
                ),
                const NextCard(
                  time: "11:00 PM",
                  title: "Fun Time!",
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
