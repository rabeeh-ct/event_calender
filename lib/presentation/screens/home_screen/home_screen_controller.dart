import 'package:get/get.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/get_events_usecase.dart';
import '../../../utils/debug_utils.dart';
import '../calender_view_screen/calender_view_screen_controller.dart';

class HomeScreenController extends GetxController {
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
        getTodayEvents();
      },
    );

    pageLoading(false);
  }

  getTodayEvents() {
    todayEvents.clear();
    events.sort(
      (a, b) => a.date.compareTo(b.date),
    );
    for (EventEntity event in events) {
      if (dateEquality(event.date, DateTime.now())) {
        todayEvents.add(event);
      } else if (event.date.isBefore(DateTime.now())) {
        if (event.repeatType == 0) {
          todayEvents.add(event);
        } else if (event.repeatType == 1) {
          if (event.date.weekday == DateTime.now().weekday) {
            todayEvents.add(event);
          }
        } else {
          if (event.date.day == DateTime.now().day) {
            todayEvents.add(event);
          }
        }
      }
    }
    todayEvents.refresh();
  }
}
