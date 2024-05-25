import 'package:event_calender/presentation/screens/event_detail_view_screen/components/event_detail_item.dart';
import 'package:event_calender/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:event_calender/presentation/theme/theme.dart';
import 'package:event_calender/presentation/widgets/default_button.dart';
import 'package:event_calender/presentation/widgets/default_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/snackbar_utils.dart';
import '../../widgets/event_add_or_edit_bottom_sheet.dart';
import '../calender_view_screen/calender_view_screen_controller.dart';
import 'event_detail_view_screen_controller.dart';

class EventDetailViewScreen extends StatelessWidget {
  const EventDetailViewScreen({
    super.key,
  });

  // final EventEntity event;

  @override
  Widget build(BuildContext context) {
    final screenController = Get.put(EventDetailViewScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.maxFinite,
                    constraints: const BoxConstraints(minHeight: 100),
                    decoration: BoxDecoration(
                        color: darkBackground, borderRadius: BorderRadius.circular(20)),
                    child: Text(screenController.eventDetailViewScreenArgs.eventEntity.title),
                  ),
                  20.sBH,
                  EventDetailItem(
                    iconData: Icons.access_time_rounded,
                    title: "Time :",
                    trailing: screenController.eventDetailViewScreenArgs.eventEntity.time,
                  ),
                  20.sBH,
                  EventDetailItem(
                    iconData: Icons.calendar_month,
                    title: "Date :",
                    trailing: DateFormat("dd MMM yyyy")
                        .format(screenController.eventDetailViewScreenArgs.eventEntity.date),
                  ),
                  20.sBH,
                  EventDetailItem(
                    iconData: Icons.reply,
                    title: "Repeat Mode :",
                    trailing: repeatModes
                        .firstWhere(
                          (element) =>
                              element.id ==
                              screenController
                                  .eventDetailViewScreenArgs.eventEntity.repeatType,
                        )
                        .title,
                  ),
                  10.sBH,
                ],
              ),
            ),
            DefaultButton(
              text: "EDIT",
              isLoading: false,
              onPressed: () async {
                Get.put(EventAddOrEditBottomSheetController())
                    .setEditData(screenController.eventDetailViewScreenArgs.eventEntity);
                bool? result = await Get.bottomSheet(
                    EventAddOrEditBottomSheet(
                      date: screenController.eventDetailViewScreenArgs.eventEntity.date,
                      isAdd: false,
                    ),
                    isScrollControlled: true);
                if (result == true) {
                  if (screenController.eventDetailViewScreenArgs.isFromHome) {
                    Get.find<HomeScreenController>().getData(isPull: true);
                  } else {
                    Get.find<CalenderViewScreenController>().getData(isPull: true);
                  }
                  Get.back();
                  showMessage("Event edited successfully");
                }
              },
            ),
            10.sBH,
            Obx(() {
              return DefaultButton(
                text: "DELETE",
                isLoading: screenController.deleteButtonLoading.value,
                onPressed: () {
                  Get.dialog(Center(
                    child: DefaultConfirmDialog(
                      title: "Are you sure",
                      subTitle: "Are you sure to delete this event",
                      loading: screenController.deleteButtonLoading,
                      onClick: () => screenController.deleteEvent(
                        screenController.eventDetailViewScreenArgs.eventEntity.indexId,
                        isHome: screenController.eventDetailViewScreenArgs.isFromHome,
                      ),
                      buttonText: "Delete",
                      primaryButtonColor: errorColor,
                    ),
                  ));
                },
                backgroundColor: errorColor,
              );
            }),
            10.sBH
          ],
        ),
      ),
    );
  }
}
