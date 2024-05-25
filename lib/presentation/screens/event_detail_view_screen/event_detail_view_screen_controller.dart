import 'package:event_calender/domain/entities/event_entity.dart';
import 'package:event_calender/presentation/screens/calender_view_screen/calender_view_screen_controller.dart';
import 'package:event_calender/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/delete_events_usecase.dart';
import '../../../utils/snackbar_utils.dart';

class EventDetailViewScreenController extends GetxController {
  EventDetailViewScreenArgs eventDetailViewScreenArgs = Get.arguments;

  final _deleteEventsUseCase = Get.put(DeleteEventsUseCase());

  RxBool deleteButtonLoading = false.obs;

  deleteEvent(int? index, {required bool isHome}) async {
    if (index == null) {
      showMessage("Item have no index");
      return;
    }
    deleteButtonLoading(true);

    final response = await _deleteEventsUseCase(index);
    response.fold((l) {
      return l.handleError();
    }, (r) async {
      if (isHome) {
        Get.find<HomeScreenController>().getData(isPull: true);
      } else {
        Get.find<CalenderViewScreenController>().getData(isPull: true);
      }
      Get.back();
      Get.back();
      showMessage("Event deleted successfully");
    });
    deleteButtonLoading(false);
  }
}

class EventDetailViewScreenArgs {
  final EventEntity eventEntity;
  final bool isFromHome;

  EventDetailViewScreenArgs({required this.eventEntity, required this.isFromHome});
}
