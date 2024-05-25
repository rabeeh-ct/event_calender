// import 'package:event_calender/presentation/screens/calender_view_screen/calender_view_screen_controller.dart';
// import 'package:event_calender/utils/formatters.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../../theme/theme.dart';
// import '../../../widgets/bottom_sheet_small_container.dart';
// import '../../../widgets/default_button.dart';
//
// class EventAddBottomSheet extends StatelessWidget {
//   const EventAddBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // final CalenderViewScreenController screenController = Get.find();
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       decoration: const BoxDecoration(
//         color: darkBackground,
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(defaultPadding),
//           topLeft: Radius.circular(defaultPadding),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: defaultPadding, vertical: defaultPadding / 2),
//         child: SingleChildScrollView(
//           child: Form(
//             key: screenController.addEventFromKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 defaultSpacer,
//                 const Center(child: BottomSheetSmallContainer()),
//                 defaultSpacer,
//                 // Center(
//                 //   child: Text("Add Event",style: TextStyle(color: whiteColor),),
//                 // ),
//                 Text(
//                   "Event Title",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: whiteColor, fontSize: 13),
//                 ),
//                 10.sBH,
//                 TextFormField(
//                   maxLines: 4,
//                   textCapitalization: TextCapitalization.sentences,
//                   validator: (value) => value == "" ? "This field required" : null,
//                   controller: screenController.eventTitleCtr,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white30,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 10.sBH,
//                 Text(
//                   "Event Time",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: whiteColor, fontSize: 13),
//                 ),
//                 10.sBH,
//                 TextFormField(
//                   enabled: true,
//                   readOnly: true,
//                   onTap: () async {
//                     TimeOfDay? tempTime = await showTimePicker(
//                         context: context,
//                         initialTime: stringToTimeOfDay(screenController.eventTimeCtr.text) ??
//                             const TimeOfDay(hour: 7, minute: 00));
//                     if (tempTime != null) {
//                       screenController.eventTimeCtr.text = tempTime.format(Get.context!);
//                     }
//                   },
//                   maxLines: 1,
//                   textCapitalization: TextCapitalization.sentences,
//                   validator: (value) => value == "" ? "This field required" : null,
//                   controller: screenController.eventTimeCtr,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white30,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 10.sBH,
//                 Text(
//                   "Event Date",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: whiteColor, fontSize: 13),
//                 ),
//                 10.sBH,
//                 TextFormField(
//                   enabled: true,
//                   readOnly: true,
//                   maxLines: 1,
//                   textCapitalization: TextCapitalization.sentences,
//                   validator: (value) => value == "" ? "This field required" : null,
//                   controller: screenController.eventDateCtr
//                     ..text = DateFormat("dd MMM yyyy").format(screenController.date.value),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white30,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 10.sBH,
//                 Text(
//                   "Repeat Mode",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: whiteColor, fontSize: 13),
//                 ),
//                 10.sBH,
//                 Obx(() {
//                   return DropdownButtonFormField<RepeatModeEntity>(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white30,
//                       contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     value: screenController.selectedRepeatMode.value,
//                     items: repeatModes
//                         .map(
//                           (e) => DropdownMenuItem(
//                             value: e,
//                             child: Text(e.title),
//                           ),
//                         )
//                         .toList(),
//                     onChanged: (value) => screenController.selectedRepeatMode.value = value,
//                   );
//                 }),
//                 defaultSpacer,
//                 Obx(() {
//                   return DefaultButton(
//                     text: "Add Event",
//                     // backgroundColor: primaryColor,
//                     // borderColor: primaryColor,
//                     isLoading: screenController.buttonLoading.value,
//                     onPressed: () {
//                       screenController.addEventFromKey.currentState!.validate()
//                           ? screenController.addEvent()
//                           : null;
//                     },
//                     // height: defaultPadding * 2.8,
//                   );
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
