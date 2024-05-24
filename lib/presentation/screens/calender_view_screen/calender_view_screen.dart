import 'package:event_calender/presentation/theme/theme.dart';
import 'package:event_calender/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calender_view_screen_controller.dart';
import 'components/event_tile.dart';
import 'components/calender.dart';
import 'components/event_add_bottom_sheet.dart';

class CalenderViewScreen extends StatelessWidget {
  const CalenderViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenController = Get.put(CalenderViewScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          onTap: () {
            Get.back();
          },
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          screenController.clearData();
          Get.bottomSheet(const EventAddBottomSheet(),
              isScrollControlled: true);
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return NetworkResource(
          appError: screenController.appError,
          loading: screenController.pageLoading.value,
          retry: screenController.getDate,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: RefreshIndicator(
              onRefresh: () => screenController.getData(isPull: true),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.only(top: 6),
                          child: const Calender()),
                      Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 8),
                          child: const Calender()),
                      const Calender(),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 24, top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "     __________",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                  ),
                  ...List.generate(
                    screenController.todayEvents.length,
                    (index) => EventTile(
                      event: screenController.todayEvents[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
