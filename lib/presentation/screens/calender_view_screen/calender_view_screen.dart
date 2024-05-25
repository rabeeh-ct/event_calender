import 'package:event_calender/presentation/theme/theme.dart';
import 'package:event_calender/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/snackbar_utils.dart';
import '../../widgets/event_add_or_edit_bottom_sheet.dart';
import '../../widgets/event_tile.dart';
import 'calender_view_screen_controller.dart';
import 'components/calender.dart';

class CalenderViewScreen extends StatelessWidget {
  const CalenderViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenController = Get.put(CalenderViewScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.put(EventAddOrEditBottomSheetController()).clearData();
          bool? result = await Get.bottomSheet(
              EventAddOrEditBottomSheet(
                date: screenController.date.value,
                isAdd: true,
              ),
              isScrollControlled: true);
          if (result == true) {
            showMessage("Event added successfully");
            screenController.getData(isPull: true);
          }
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
                              color: Colors.white, fontSize: 10, fontWeight: FontWeight.w200),
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
                      isFromHome: false,
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
