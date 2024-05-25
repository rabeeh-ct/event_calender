import 'package:event_calender/domain/entities/app_error.dart';
import 'package:event_calender/domain/params/no_params.dart';
import 'package:event_calender/domain/usecases/get_events_usecase.dart';
import 'package:event_calender/utils/debug_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../domain/entities/event_entity.dart';
import '../../../domain/usecases/add_event_usecase.dart';
import '../../../domain/usecases/delete_events_usecase.dart';
import '../../../utils/formatters.dart';
import '../../../utils/snackbar_utils.dart';

class CalenderViewScreenController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final GetEventsUseCase _getEventsUseCase = Get.put(GetEventsUseCase());
  RxList<EventEntity> events = <EventEntity>[].obs;
  RxList<EventEntity> todayEvents = <EventEntity>[].obs;

  RxBool pageLoading = false.obs;
  AppError? appError;

  getData({bool isPull = false}) async {
    if (!isPull) {
      pageLoading(true);
    }
    final response = await _getEventsUseCase(const NoParams());
    response.fold(
      (l) {
        appError = l;
        l.handleError();
      },
      (r) {
        events.value = r;
        consoleLog("event length ${r.length}");
      },
    );

    getDate();
    pageLoading(false);
  }

  int pageIndex = DateTime.now().year - 2000;
  PageController pageController =
      PageController(initialPage: DateTime.now().year - 2000);
  var date = DateTime.now().obs;

  RxList<DateTime> dateList = <DateTime>[].obs;
  Duration totalDays = const Duration(days: 30);

  void getDate({DateTime? tempDate}) {
    if (tempDate != null) {
      date.value = tempDate;
    }
    dateList.clear();

    DateTime firstDayOfMonth = DateTime(date.value.year, date.value.month, 1);
    DateTime firstDayNextMonth =
        DateTime(date.value.year, date.value.month + 1, 1);
    totalDays = firstDayNextMonth.difference(firstDayOfMonth);

    int firstWeekdayOfMonth = firstDayOfMonth.weekday;
    int leadingEmptyDays = firstWeekdayOfMonth % 7;
    int totalDaysToShow = totalDays.inDays + leadingEmptyDays;

    // Ensure totalDaysToShow is a multiple of 7 for complete weeks
    while (totalDaysToShow % 7 != 0) {
      totalDaysToShow++;
    }

    for (int i = 0; i < leadingEmptyDays; i++) {
      dateList
          .add(firstDayOfMonth.subtract(Duration(days: leadingEmptyDays - i)));
    }
    for (int i = 0; i < totalDays.inDays; i++) {
      dateList.add(firstDayOfMonth.add(Duration(days: i)));
    }
    for (int i = 1;
        i <= (totalDaysToShow - totalDays.inDays - leadingEmptyDays);
        i++) {
      dateList.add(firstDayNextMonth.add(Duration(days: i - 1)));
    }

    dateList.refresh();
    getTodayEvents();
  }

  getTodayEvents(){
    todayEvents.clear();
    events.sort((a, b) => a.date.compareTo(b.date),);
    for(EventEntity _event in events){
      if(dateEquality(_event.date, date.value)) {
        todayEvents.add(_event);
      }else if( _event.date.isBefore(date.value)){
        if(_event.repeatType==0){
          todayEvents.add(_event);
        }else if(_event.repeatType==1){
          if(_event.date.weekday==date.value.weekday){
            todayEvents.add(_event);
          }
        }else{
          if(_event.date.day==date.value.day){
            todayEvents.add(_event);
          }
        }
      }
    }
    todayEvents.refresh();
  }

  Future<void> dateTap(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
      getDate();
    }
  }

  void dateForward(int index) {
    date.value = DateTime(date.value.year, date.value.month + 1);
    getDate();
    pageIndex = index;
    HapticFeedback.selectionClick();
  }

  void dateBackward(int index) {
    date.value = DateTime(date.value.year, date.value.month - 1);
    getDate();
    pageIndex = index;
    HapticFeedback.selectionClick();
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar('Press back again to exit', '');
      return Future.value(false);
    }
    return Future.value(true);
  }


}

class RepeatModeEntity {
  final String title;
  final int id;

  RepeatModeEntity({required this.title, required this.id});
}

List<RepeatModeEntity> repeatModes = [
  RepeatModeEntity(title: "Daily", id: 0),
  RepeatModeEntity(title: "Weekly", id: 1),
  RepeatModeEntity(title: "Monthly", id: 2),
];

bool dateEquality(DateTime date1, DateTime date2) {
  return date1.day == date2.day &&
      date1.month == date2.month &&
      date1.year == date2.year;
}