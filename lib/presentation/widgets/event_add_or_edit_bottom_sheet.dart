import 'package:event_calender/domain/usecases/edit_event_usecase.dart';
import 'package:event_calender/presentation/screens/calender_view_screen/calender_view_screen_controller.dart';
import 'package:event_calender/utils/debug_utils.dart';
import 'package:event_calender/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/add_event_usecase.dart';
import '../../utils/snackbar_utils.dart';
import '../theme/theme.dart';
import 'bottom_sheet_small_container.dart';
import 'default_button.dart';

class EventAddOrEditBottomSheet extends StatelessWidget {
  const EventAddOrEditBottomSheet({
    super.key,
    required this.date,
    required this.isAdd,
  });

  final DateTime date;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    final screenController = Get.find<EventAddOrEditBottomSheetController>();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: darkBackground,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(defaultPadding),
          topLeft: Radius.circular(defaultPadding),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: SingleChildScrollView(
          child: Form(
            key: screenController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultSpacer,
                const Center(child: BottomSheetSmallContainer()),
                defaultSpacer,
                // Center(
                //   child: Text("Add Event",style: TextStyle(color: whiteColor),),
                // ),
                Text(
                  "Event Title",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: whiteColor, fontSize: 13),
                ),
                10.sBH,
                TextFormField(
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) => value == "" ? "This field required" : null,
                  controller: screenController.eventTitleCtr,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                10.sBH,
                Text(
                  "Event Time",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: whiteColor, fontSize: 13),
                ),
                10.sBH,
                TextFormField(
                  enabled: true,
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? tempTime = await showTimePicker(
                        context: context,
                        initialTime: stringToTimeOfDay(screenController.eventTimeCtr.text) ??
                            const TimeOfDay(hour: 7, minute: 00));
                    if (tempTime != null) {
                      screenController.eventTimeCtr.text = tempTime.format(Get.context!);
                    }
                  },
                  maxLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) => value == "" ? "This field required" : null,
                  controller: screenController.eventTimeCtr,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                10.sBH,
                Text(
                  "Event Date",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: whiteColor, fontSize: 13),
                ),
                10.sBH,
                TextFormField(
                  enabled: true,
                  readOnly: true,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) => value == "" ? "This field required" : null,
                  controller: screenController.eventDateCtr
                    ..text = DateFormat("dd MMM yyyy").format(date),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                10.sBH,
                Text(
                  "Repeat Mode",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: whiteColor, fontSize: 13),
                ),
                10.sBH,
                Obx(() {
                  return DropdownButtonFormField<RepeatModeEntity>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    value: screenController.selectedRepeatMode.value,
                    items: repeatModes
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.title),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => screenController.selectedRepeatMode.value = value,
                  );
                }),
                defaultSpacer,
                Obx(() {
                  return DefaultButton(
                    text: isAdd ? "Add Event" : "Edit Event",
                    // backgroundColor: primaryColor,
                    // borderColor: primaryColor,
                    isLoading: screenController.buttonLoading.value,
                    onPressed: () {
                      screenController.formKey.currentState!.validate()
                          ? isAdd
                              ? screenController.addEvent(date)
                              : screenController.editEvent(date,screenController.index!)
                          : null;
                    },
                    // height: defaultPadding * 2.8,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventAddOrEditBottomSheetController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey(debugLabel: "fromKey");

  final TextEditingController eventTitleCtr = TextEditingController();
  final TextEditingController eventDateCtr = TextEditingController();
  final TextEditingController eventTimeCtr = TextEditingController();
  Rxn<RepeatModeEntity> selectedRepeatMode = Rxn();

  final AddEventUseCase _addEventUseCase = Get.put(AddEventUseCase());
  final EditEventUseCase _editEventUseCase = Get.put(EditEventUseCase());
  Rx<bool> buttonLoading = false.obs;

  addEvent(DateTime date) async {
    buttonLoading(true);
    EventEntity params = EventEntity(
      date: date,
      time: eventTimeCtr.text,
      title: eventTitleCtr.text.trim(),
      repeatType: selectedRepeatMode.value!.id,
    );
    final response = await _addEventUseCase(params);
    response.fold((l) {
      return l.handleError();
    }, (r) async {
      Get.back(result: true);
    });
    buttonLoading(false);
  }

  editEvent(DateTime date,int index) async {
    buttonLoading(true);
    EventEntity params = EventEntity(
      indexId: index,
      date: date,
      time: eventTimeCtr.text,
      title: eventTitleCtr.text.trim(),
      repeatType: selectedRepeatMode.value!.id,
    );
    final response = await _editEventUseCase(params);
    response.fold((l) {
      return l.handleError();
    }, (r) async {
      consoleLog("heeeiiiiiiiiiiiiiiiiiiiiiiiiii");
      Get.back(result: true);
    });
    buttonLoading(false);
  }
  int? index;

  setEditData(EventEntity event) {
    eventTitleCtr.text = event.title;
    eventDateCtr.text = DateFormat("dd MMM yyyy").format(event.date);
    eventTimeCtr.text = event.time;
    index =event.indexId;
    selectedRepeatMode.value = repeatModes.firstWhere(
      (element) => element.id == event.repeatType,
    );
  }

  clearData(){
    eventTitleCtr.clear();
    eventDateCtr.clear();
    eventTimeCtr.clear();
    index=null;
    selectedRepeatMode.value=null;
  }
}
