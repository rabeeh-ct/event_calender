import 'package:event_calender/data/models/event_model.dart';
import 'package:event_calender/utils/debug_utils.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';


abstract class LocalDataSource {

  Future<void> addEvent(EventModel params);

  Future<void> editEvent(EventModel params);

  Future<List<EventModel>> getEvents();

  Future<void> deleteEvent(int params);

}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl() {
    Hive.registerAdapter(EventModelAdapter());
    consoleLog("registerAdapter");
  }

  // var box = Hive.box('eventBox');

  @override
  Future<void> addEvent(EventModel params) async {
    var box = await Hive.openBox<EventModel>('eventBox');
    await box.add(params);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    var box = await Hive.openBox<EventModel>('eventBox');
    List<EventModel> eventList=[];
    box.values.toList().asMap().forEach((key, value) {
      eventList.add(value..indexId=key);
    },);
    return eventList;
  }

  @override
  Future<void> deleteEvent(int params) async {
    var box = await Hive.openBox<EventModel>('eventBox');
    return box.deleteAt(params);
  }

  @override
  Future<void> editEvent(EventModel params) async {
    var box = await Hive.openBox<EventModel>('eventBox');
    return await box.putAt(params.indexId!,params);
  }
}
