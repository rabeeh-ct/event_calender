import 'package:flutter/material.dart';

import '../routes/route_constants.dart';
import '../screens/calender_view_screen/calender_view_screen.dart';
import '../screens/event_detail_view_screen/event_detail_view_screen.dart';
import '../screens/home_screen/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> get routes => {
        RouteList.initial: (context) => const HomeScreen(),
        RouteList.calenderViewScreen: (context) => const CalenderViewScreen(),
        RouteList.eventDetailViewScreen: (context) => const EventDetailViewScreen(),

      };
}
